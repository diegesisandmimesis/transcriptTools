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

	summarize(v) { return(nil); }
;

class FailureSummary: ReportSummary isFailure = true;
