#charset "us-ascii"
//
// selfSummaries.t
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

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
		local act, obj, t;

		if(report == nil) return(nil);
		if((act = report.action_) == nil) return(nil);
		if((obj = report.dobj_) == nil) return(nil);

		if((isFailure != report.isFailure)
			|| (isImplicit != report.isActionImplicit))
			return(nil);

		if(!matchReportType(report))
			return(nil);

		if(act.propType(self.summaryProp) == TypeNil)
			return(nil);

		// FIXME:  No idea why T3 sometimes returns nil instead
		//	of TypeNil here.  Object without propType()?  Is
		//	that possible?
		t = obj.propType(act.(self.summaryProp));
		if((t == TypeNil) || (t == nil))
			return(nil);

		return(true);
	}

	summarize(data) {
		return(data.dobj_.(data.action_.(self.summaryProp))(data));
	}
;

class SelfSummaryImplicit: SelfSummary, ImplicitSummary
	summaryProp = &summarizeImplicitDobjProp
	reportTypes = ImplicitActionAnnouncement
	getMinSummaryLength() { return(1); }
;

class SelfSummaryExtra: SelfSummary
	reportTypes = ExtraCommandReport
;

class SelfSummaryAnnouncement: SelfSummary
	reportTypes = MultiObjectAnnouncement
;
