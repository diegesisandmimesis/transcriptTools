#charset "us-ascii"
//
// reportSummary.t
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class ReportSummary: TranscriptToolsWidget
	action = nil
	isFailure = nil
	isImplicit = nil

	reportManager = nil

	_sortClasses = static [
		ImplicitActionAnnouncement,
		MultiObjectAnnouncement,
		DefaultCommandReport,
		MainCommandReport,
		FullCommandReport
	]

	initializeReportSummary() {
		if(location == nil)
			return(nil);

		if(location.ofKind(ReportManager))
			return(location.addReportManagerSummary(self));

		return(nil);
	}

	matchAction(act) {
		if(!getActive())
			return(nil);

		if((act == nil) || (action == nil))
			return(nil);

		return(act.ofKind(action));
	}

	matchReport(report) {
		if(report == nil)
			return(nil);

		return(matchAction(report.action_)
			&& (isFailure == report.isFailure)
			&& (isImplicit == report.isActionImplicit));
	}

	matchSummary(cls) {
		if(cls == nil)
			return(nil);

		return((isFailure == cls.isFailure)
			&& (isImplicit == cls.isImplicit)
			&& matchAction(cls.action));
	}

	getMatchingReports(t, vec) {
		local l;

		l = new Vector(vec.length);
		vec.forEach(function(o) {
			if(matchReport(o))
				l.append(o);
		});

		return(l);
	}

	run(t, vec) {
		local l, len;

		if(!reportManager)
			return;

		len = reportManager.minSummaryLength;

		l = getMatchingReports(t, vec);
		if(l.length < len)
			return;
		
		l = _sortForMerging(l);
		l.forEach(function(lst) {
			if(lst.length < len)
				return;
			_mergeReports(t, lst);
		});
	}

	_sortForMerging(lst) {
		local i, v;

		v = new Vector(_sortClasses.length);
		_sortClasses.forEach({ x: v.append(new Vector()) });
		lst.forEach(function(o) {
			for(i = 1; i <= _sortClasses.length; i++) {
				if(o.ofKind(_sortClasses[i]))
					v[i].append(o);
			}
		});

		return(v);
	}

	_mergeReports(t, lst) {
		local i, r;

		r = lst[1];

		for(i = 1; i <= lst.length; i++) {
			r.addDobj(lst[i].dobj_);
			r.addIobj(lst[i].iobj_);
			if(i != 1)
				t.removeReport(lst[i]);
		}
//aioSay('\ndobjList_ = <<toString(lst[1].dobjList_)>>\n ');

		if(r.ofKind(MultiObjectAnnouncement)) {
			r.messageText_ = '<./p0>\n<.announceObj>'
				+ getReportDistinguisher(r)
				+ ':<./announceObj> <.p0>';
		} else {
			r.messageText_ = summarize(lst[1]);
		}
	}

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

	summarize(v) { return(nil); }
;

class FailureSummary: ReportSummary isFailure = true;
