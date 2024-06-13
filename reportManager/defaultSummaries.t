#charset "us-ascii"
//
// defaultReports.t
//
//	Class declarations of default summaries
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class TakeSummary: ActionSummary
	action = TakeAction
;

class TakeFromSummary: ActionSummary
	action = TakeFromAction
;

class DropSummary: ActionSummary
	action = DropAction
;

class PutOnSummary: ActionSummary
	action = PutOnAction
;

class PutInSummary: ActionSummary action = PutInAction;
class PutUnderSummary: ActionSummary action = PutUnderAction;
class PutBehindSummary: ActionSummary action = PutBehindAction;

modify playerActionMessages
	cannotTakeThatMsg = '{You/he} {can\'t} take {that dobj/him}. '
;

class TakeFailureSummary: ActionFailureSummary
	action = TakeAction
;

class ImplicitTakeSummary: ImplicitSummary
	action = TakeAction
	//summarize(data) { return('first taking <<data.listNames()>>'); }
;


// Special summarizer designed for use with SelfReportManager.
// This calls dobjFor(Action) { summarize(data) {} } summarizers.
class SelfSummary: ReportSummary
;
