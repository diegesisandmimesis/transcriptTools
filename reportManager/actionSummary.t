#charset "us-ascii"
//
// actionSummary.t
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class ActionSummary: ReportSummary
	matchMessageProp = nil
	summarize(data) { return('{You/He} <<data.actionClause()>>.'); }
;

class ActionFailureSummary: ActionSummary, FailureSummary
	summarize(data) { return('{You/He} can\'t '
		+ '<<data.actionClauseWithOr()>>.'); }
;
