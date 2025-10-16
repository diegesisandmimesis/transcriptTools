#charset "us-ascii"
//
// reportSummary.t
//
//	ReportSummary base class and related utility classes.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

// Data structure used internally for grouping reports to be summarized
// by their report class.
class _MergeData: object
	_reportClass = nil			// the report class
	vec = perInstance(new Vector())		// vector for the reports

	construct(v) { _reportClass = v; }
;

// Data structure used internally for grouping reports by distinguisher.
class _DistinguisherData: object
	_distinguisher = nil
	vec = perInstance(new Vector())

	construct(v) { _distinguisher = v; }
;

// Data structure used as an argument to whenSummarized().  Used to
// ping objects that want to be notified when reports involving them
// are removed by a summarizer.
class SummaryNotification: object
	report = nil	// report being removed by summary
	summary = nil	// the summary so far
	construct(v0, v1) {
		report = v0;
		summary = v1;
	}
;

class ReportSummary: TranscriptToolsWidget
	action = nil			// the kind of action we match
	isFailure = nil			// did the action fail?
	isImplicit = nil		// is this an implicit action?

	reportManager = nil		// our parent report manager
	minSummaryLength = (reportManager ? reportManager.minSummaryLength : 2)

	_summaryText = nil

	// Lookup table mapping report classes to summary methods
	_reportClasses = static [
		ImplicitActionAnnouncement -> &_summarizeImplicit,
		MultiObjectAnnouncement -> &_summarizeAnnouncement,
		DefaultCommandReport -> &_summarize,
		BeforeCommandReport -> &_summarize,
		MainCommandReport -> &_summarize,
		AfterCommandReport -> &_summarize,
		FailCommandReport -> &_summarizeFailure,
		ExtraCommandReport -> &_summarizeExtra
	]

	_groupTogether = static [
		MainCommandReport -> DefaultCommandReport
	]

	// Preinit method.  Add ourselves to our report manager.
	initializeReportSummary() {
		if(location == nil)
			return(nil);

		if(location.ofKind(ReportManager))
			return(location.addReportManagerSummary(self));

		return(nil);
	}

	// Returns boolean true if we match the given action.
	matchAction(act) {
		if(!getActive())
			return(nil);

		if((act == nil) || (action == nil))
			return(nil);

		return(act.ofKind(action));
	}

	// See if the given object matches our object criteria, if any.
	matchObject(obj) {
		// If we don't have a report manager, what are we even
		// doing here?  Fail.
		if(reportManager == nil)
			return(nil);

		// If we're not the summary for a particular type of
		// object, we match any object
		if(reportManager.reportManagerFor == nil)
			return(true);

		// If we're here, we only care about a particular
		// object class.  If the arg is nil, it can't match
		// the object class, so we fail.
		if(obj == nil)
			return(nil);

		return(reportManager.isReportManagerFor(obj));
	}

	// Returns boolean true if we summarize this kind of report.
	matchReport(report) {
		if(report == nil)
			return(nil);

		return(matchObject(report.dobj_)
			&& matchAction(report.action_)
			&& (isFailure == report.isFailure)
			&& (isImplicit == report.isActionImplicit));
	}

	// Returns boolean true if we match the same things as the given
	// summary class.
	matchSummary(cls) {
		if(cls == nil)
			return(nil);

		return((isFailure == cls.isFailure)
			&& (isImplicit == cls.isImplicit)
			&& matchAction(cls.action));
	}

	// Given a transcript object and a list of reports, return all of
	// the reports in the vector that we'd like to summarize.
	getMatchingReports(t, vec) {
		local l;

		l = new Vector(vec.length);
		vec.forEach(function(o) {
			if(matchReport(o))
				l.append(o);
		});

		return(l);
	}

	// Entry point from the report manager.  Run our summary logic on
	// the given transcript (first arg) and reports (second arg).
	run(t, vec) {
		local l, len;

		if(!reportManager)
			return;

		len = minSummaryLength;

		// Make sure we have enough reports to summarize before
		// any sorting.
		l = getMatchingReports(t, vec);
		if(_getReportCount(l) < len)
			return;
		
		// Now we sort the associated reports into types
		// (in most cases this is the multi-object announcements, if
		// any, and then default/main reports).
		l = _sortForMerging(l);
		l.forEach(function(data) {
			// If any of the types doesn't have our min number
			// of reports, we have nothing to do.
			if(_getReportCount(data.vec) < len)
				return;

			// Now merge and summarize the reports.
			_mergeReports(t, data);
		});
	}

	_getReportCount(lst) {
		local n;

		n = 0;
		lst.forEach(function(o) {
			if(o.dobjList_) n += o.dobjList_.length;
			else n += 1;
		});

		return(n);
	}

	// Sorts the reports by type:  announcements with announcements,
	// default reports with default reports, main reports with main
	// reports, and so on.
	_sortForMerging(lst) {
		local i, j, k, v;

		k = _reportClasses.keysToList();

		// We create a vector containing as many _MergeData
		// instances as we have classes we care about.  Not all
		// of these will get reports.
		v = new Vector(k.length);
		k.forEach({ x: v.append(new _MergeData(x)) });

		// Go through the reports and add each to the appropriate
		// _MergeData instance.
		lst.forEach(function(o) {
			for(i = 1; i <= k.length; i++) {
				if(o.ofKind(k[i])) {
					if(_groupTogether[k[i]])
						j = k.indexOf(_groupTogether[k[i]]);
					else
						j = i;
					v[j].vec.append(o);
				}
			}
		});

		return(v);
	}

	_mergeReportList(t, lst, cls) {
		local i, l, r, txt;

		r = lst[1];

		l = new Vector(lst.length - 1);
		for(i = 1; i <= lst.length; i++) {
			// Add all the dobjs and iobjs from the individual
			// reports onto the first report.
			r.addDobj(lst[i].dobj_);
			r.addIobj(lst[i].iobj_);

			// Remove all the reports except the first one.
			if(i != 1)
				l.append(lst[i]);
		}

		r.transcript_ = t;

		// Call the summarizer method for this kind of report,
		// as defined in the _reportClass table.  If the summarizer
		// method returns nil, bail.
		if((txt = (_reportClasses[cls])(r)) == nil)
			return;

		l.forEach({ x: removeReport(t, x, r) });

		r.messageText_ = txt;
	}

	removeReport(t, report, data) {
		notifyDobj(report, data);
		t.removeReport(report);
	}

	notifyDobj(report, data) {
		if((report == nil) || (data == nil))
			return;

		if((report.dobj_ == nil) || (data.action_ == nil))
			return;

		if(data.action_.whenSummarizedDobjProp == nil)
			return;

		if(report.dobj_.propType(data.action_.whenSummarizedDobjProp)
			== TypeNil)
			return;

		report.dobj_.(data.action_.whenSummarizedDobjProp)(
			new SummaryNotification(report, data));
	}

	// Merge and summarize the reports.
	// First arg is the transcript, second is a _MergeData instance (which
	// contains reports for a specific report class).
	_mergeReports(t, data) {
		local v;

		v = new Vector();
		data.vec.forEach({ x: _sortByDistinguisher(t, x, v) });
		v.forEach({ x: _mergeReportList(t, x.vec, data._reportClass) });
	}

	_sortByDistinguisher(t, report, vec) {
		local dist, o;

		dist = getReportDistinguisher(report, true);
		o = vec.valWhich({ x: x._distinguisher == dist });
		if(o == nil) {
			vec.append(new _DistinguisherData(dist));
			o = vec[vec.length];
		}
		o.vec.append(report);
	}

	// Get the distinguisher announcement for this report.
	getReportDistinguisher(report, forceSingle?) {
		local lst, obj, n;

		if(gameMain.useDistinguishersInAnnouncements == nil)
			return(nil);

		if((obj = report.dobj_) == nil)
			return(nil);

		//if(report.dobjList_)
			//lst = report.dobjList_;
		//else
		lst = report.action_.getResolvedObjList(DirectObject);

		if(lst && !forceSingle)
			n = lst.length;
		else
			n = 1;

		return(obj.getBestDistinguisher(lst).reportName(obj, n));
	}

	// Stub method; up to subclasses to overwrite.
	summarize(v) { return(nil); }

	_summarize(r) { return(summarize(r)); }

	summarizeAnnouncement(r) { return(getReportDistinguisher(r)); }

	// Stock announcement summarizer;  this is really only useful
	// for swapping out the "stock" one ("pebble:") for a plural or
	// a custom report name ("pebbles:").
	_summarizeAnnouncement(r) {
		local txt;

		if((txt = summarizeAnnouncement(r)) == nil)
			return(nil);

		return('<./p0>\n<.announceObj>' + txt
			+ ':<./announceObj> <.p0>');
	}

	_summarizeImplicit(r) {
		local txt;

		if((txt = summarizeImplicit(r)) == nil)
			return(nil);

		r._summaryText = txt;

		return('<./p0>\n<.assume>first ' + txt + '<./assume>\n');
	}
	summarizeImplicit(r) { return(summarize(r)); }

	_summarizeFailure(r) { return(nil); }

	_summarizeExtra(r) { return(summarizeExtra(r)); }
	summarizeExtra(r) { return(nil); }
;

class FailureSummary: ReportSummary isFailure = true;
