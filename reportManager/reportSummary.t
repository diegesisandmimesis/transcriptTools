#charset "us-ascii"
//
// reportSummary.t
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

class ReportSummary: TranscriptToolsWidget
	action = nil			// the kind of action we match
	isFailure = nil			// did the action fail?
	isImplicit = nil		// is this an implicit action?

	reportManager = nil		// our parent report manager

	// Lookup table mapping report classes to summary methods
	_reportClasses = static [
		ImplicitActionAnnouncement -> &_summarizeImplicit,
		MultiObjectAnnouncement -> &_summarizeAnnouncement,
		DefaultCommandReport -> &_summarize,
		MainCommandReport -> &_summarize,
		FullCommandReport -> &_summarize
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

	// Returns boolean true if we summarize this kind of report.
	matchReport(report) {
		if(report == nil)
			return(nil);

		return(matchAction(report.action_)
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

		len = reportManager.minSummaryLength;

		// Make sure we have enough reports to summarize before
		// any sorting.
		l = getMatchingReports(t, vec);
		if(l.length < len)
			return;
		
		// Now we sort the associated reports into types
		// (in most cases this is the multi-object announcements, if
		// any, and then default/main reports).
		l = _sortForMerging(l);
		l.forEach(function(data) {
			// If any of the types doesn't have our min number
			// of reports, we have nothing to do.
			if(data.vec.length < len)
				return;

			// Now merge and summarize the reports.
			_mergeReports(t, data);
		});
	}

	// Sorts the reports by type:  announcements with announcements,
	// default reports with default reports, main reports with main
	// reports, and so on.
	_sortForMerging(lst) {
		local k, i, v;

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
				if(o.ofKind(k[i]))
					v[i].vec.append(o);
			}
		});

		return(v);
	}

	// Merge and summarize the reports.
	// First arg is the transcript, second is a _MergeData instance (which
	// contains reports for a specific report class).
	_mergeReports(t, data) {
		local i, r, txt;

		r = data.vec[1];

		for(i = 1; i <= data.vec.length; i++) {
			// Add all the dobjs and iobjs from the individual
			// reports onto the first report.
			r.addDobj(data.vec[i].dobj_);
			r.addIobj(data.vec[i].iobj_);

			// Remove all the reports except the first one.
			if(i != 1)
				t.removeReport(data.vec[i]);
		}

		// Call the summarizer method for this kind of report,
		// as defined in the _reportClass table.  If the summarizer
		// method returns nil, bail.
		if((txt = (_reportClasses[data._reportClass])(r)) == nil)
			return;

		r.messageText_ = txt;
	}

	// Get the distinguisher announcement for this report.
	getReportDistinguisher(report) {
		local obj, n;

		if(gameMain.useDistinguishersInAnnouncements == nil)
			return(nil);

		obj = report.dobj_;
		n = report.dobjList_.length;

		return(obj.getBestDistinguisher(report.action_
			.getResolvedObjList(DirectObject))
			.reportName(obj, n));
	}

	// Stub method; up to subclasses to overwrite.
	summarize(v) { return(nil); }

	_summarize(r) { return(summarize(r)); }

	// Stock announcement summarizer;  this is really only useful
	// for swapping out the "stock" one ("pebble:") for a plural or
	// a custom report name ("pebbles:").
	_summarizeAnnouncement(r) {
		local txt;

		if((txt = getReportDistinguisher(r)) == nil)
			return(nil);

		return('<./p0>\n<.announceObj>' + txt
			+ ':<./announceObj> <.p0>');
	}

	_summarizeImplicit(r) {
		local txt;

		if((txt = summarize(r)) == nil)
			return(nil);

		return('<./p0>\n<.assume>' + txt + '<./assume>\n');
	}
;

class FailureSummary: ReportSummary isFailure = true;
