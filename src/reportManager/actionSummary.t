#charset "us-ascii"
//
// actionSummary.t
//
//	ActionSummary class definition.
//
//	This is for object-agnostic, action-specific report summarizers.
//	That's things like the >TAKE action summarizer (TakeSummary in
//	reportManager/defaultReports.t) which merges all the individual
//	>TAKE actions in a command into a single report.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class ActionSummary: ReportSummary
	// FIXME:  no longer used
	//defaultMessageProp = nil

	// Returns boolean true if we want to summarize the given report.
	matchReport(report) {
		// First we apply the default checks.  If we fail there,
		// we don't have to check any further.
		if(inherited(report) != true)
			return(nil);

		// If we're here, we passed the basic checks.  Now we
		// see if the report's Action has the noSummary flag set.
		if(report.action_ && (report.action_.noSummary == true))
			return(nil);

		return(true);
	}

	// The stock ReportSummary _mergeReport() method sorts by distinguisher,
	// which we don't want to do here.
	_mergeReports(t, data) {
		_mergeReportList(t, data.vec, data._reportClass);
	}
	
	// Construct the actual summary.
	summarize(data) { return('{You/He} <<data.actionClause()>>.'); }

	summarizeAnnouncement(r) {
		local d, l;

		if(r.dobjList_ == nil)
			return(nil);

		l = new Vector(r.dobjList_.length);
		r.dobjList_.forEach(function(o) {
			d = o.getBestDistinguisher(r.action_
				.getResolvedObjList(DirectObject))
				.reportName(o, 1);
			l.appendUnique(d);
		});

		if((l.length == 1) || (l.length > 3))
			return(getReportDistinguisher(r, nil));

		return(stringLister.makeSimpleList(l));
	}
;

// Stock action failure summary.
class ActionFailureSummary: ActionSummary, FailureSummary
	summarize(data) { return('{You/He} can\'t '
		+ '<<data.actionClauseWithOr()>>.'); }
;
