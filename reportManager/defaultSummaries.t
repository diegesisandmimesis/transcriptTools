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
	summarize(data) {
		return(inherited(data));
	}
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
	summaryProp = &summarizeDobjProp
	reportTypes = static [
		DefaultCommandReport,
		BeforeCommandReport,
		MainCommandReport,
		AfterCommandReport
	]

	matchObject(obj) {
		if((obj == nil) || (gAction == nil))
			return(nil);

		if(gAction.propType(self.summaryProp) == TypeNil) {
			return(nil);
		}

		if(obj.propType(gAction.(self.summaryProp)) == TypeNil) {
			return(nil);
		}

		return(true);
	}

	matchReportType(report) {
		local i;

		if(reportTypes == nil)
			return(true);
		if(!reportTypes.ofKind(Collection))
			return(report.ofKind(reportTypes));
		for(i = 1; i <= reportTypes.length; i++)
			if(report.ofKind(reportTypes[i]))
				return(true);
		return(nil);
	}

	matchReport(report) {
		local t;

		if((report == nil) || (report.action_ == nil))
			return(nil);

		if(!matchObject(report.dobj_)
			|| (isFailure != report.isFailure)
			|| (isImplicit != report.isActionImplicit))
			return(nil);

		if(!matchReportType(report))
			return(nil);

		t = report.action_.propType(self.summaryProp);
		if((t == nil) || (t == TypeNil))
			return(nil);

		t = report.dobj_.propType(report.action_.(self.summaryProp));
		if((t == nil) || (t == TypeNil))
			return(nil);

		return(true);
	}

	summarize(data) {
		//local p;
		//p = data.action_.(self.summaryProp);
		return(data.dobj_.(data.action_.(self.summaryProp))(data));
	}
;

class SelfSummaryImplicit: SelfSummary, ImplicitSummary
	summaryProp = &summarizeImplicitDobjProp
	reportType = ImplicitActionAnnouncement
;

class SelfSummaryExtra: SelfSummary
	reportType = ExtraCommandReport
;
