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
	defaultMessageProp = &okayTakeMsg
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
;


// Special summarizer designed for use with SelfReportManager.
// This calls dobjFor(Action) { summarize(data) {} } summarizers.
class SelfSummary: ReportSummary
	matchObject(obj) {
		if((obj == nil) || (gAction == nil))
			return(nil);
		if(gAction.propType(&summarizeDobjProp) == TypeNil)
			return(nil);
		if(obj.propType(gAction.summarizeDobjProp) == TypeNil)
			return(nil);

		return(true);
	}
	matchReport(report) {
		local t;

		if((report == nil) || (report.action_ == nil))
			return(nil);

		if(!matchObject(report.dobj_)
			|| (isFailure != report.isFailure)
			|| (isImplicit != report.isActionImplicit))
			return(nil);

		t = report.action_.propType(&summarizeDobjProp);
		if((t == nil) || (t == TypeNil))
			return(nil);

		t = report.dobj_.propType(report.action_.summarizeDobjProp);
		if((t == nil) || (t == TypeNil))
			return(nil);

		return(true);
	}

	summarize(data) {
		return(data.dobj_.(data.action_.summarizeDobjProp)(data));
	}
;
