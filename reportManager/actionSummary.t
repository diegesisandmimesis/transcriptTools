#charset "us-ascii"
//
// actionSummary.t
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class ActionSummary: ReportSummary
	defaultMessageProp = nil

	matchReport(report) {
		if(inherited(report) != true)
			return(nil);

		return(_checkMessageProp(report));
	}

	_checkMessageProp(report) {
		if(defaultMessageProp == nil)
			return(true);

		if(!report.ofKind(DefaultCommandReport)
			&& !report.ofKind(FullCommandReport))
			return(true);

		return(report.messageProp_ == defaultMessageProp);
	}

	_mergeReports(t, data) {
		_mergeReportList(t, data.vec, data._reportClass);
	}
	
	summarize(data) { return('{You/He} <<data.actionClause()>>.'); }
;

class ActionFailureSummary: ActionSummary, FailureSummary
	summarize(data) { return('{You/He} can\'t '
		+ '<<data.actionClauseWithOr()>>.'); }
;
