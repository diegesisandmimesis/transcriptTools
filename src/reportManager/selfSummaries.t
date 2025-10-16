#charset "us-ascii"
//
// selfSummaries.t
//
//	Self-summary summarizers.  This is for summary logic that
//	lives inside dobjFor(Action) {} stanzas on objects.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

// Special summarizer designed for use with SelfReportManager.
// This calls dobjFor(Action) { summarize(data) {} } summarizers.
class SelfSummary: ReportSummary
	summaryProp = &summarizeDobjProp

	// We only care about main-ish action reports (and not things like
	// implicit action reports, multi object announcements, and so on).
	reportTypes = static [
		DefaultCommandReport,
		BeforeCommandReport,
		MainCommandReport,
		AfterCommandReport
	]

	// Check to see if the given report is one of the kinds we care about.
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

	// Replacement for the report matching logic from ReportSummary.
	// Difference of note is that we check for a summarize() method
	// for the report's action.
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

		// See if the action defines the kind of summary property
		// we care about.
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

	// Summarize by calling the summarize property.
	// This is a little baroque, but self.summaryProp is our
	// summaryProp property, which is &summarizeDobjProp.
	// So we check data.action_.summarizeDobjProp.  The value of
	// this property will be action-specific.  For example, for
	// TakeAction summarizeDobjProp = &summarizeDobjTake (you can
	// see this in transcriptTools/transcriptToolsPatch.t).
	// So we then apply THAT to the direct object, data.dobj_,
	// meaning in the >TAKE example we're calling
	// data.dobj_.summarizeDobjTake().
	// summarizeDobjTake() is, via macro magic, the actual method
	// name for the summarize() method declared in a dobjFor(Take) {}
	// stanza.
	summarize(data) {
		return(data.dobj_.(data.action_.(self.summaryProp))(data));
	}
;

// Self-summarizer that handles implicit actions.
class SelfSummaryImplicit: SelfSummary, ImplicitSummary
	summaryProp = &summarizeImplicitDobjProp
	reportTypes = ImplicitActionAnnouncement
	getMinSummaryLength() { return(1); }
;

// Self-summarizer that handles ExtraCommandReport instances.
class SelfSummaryExtra: SelfSummary
	reportTypes = ExtraCommandReport
;

// Self-summarizer for handling multi-object announcements
class SelfSummaryAnnouncement: SelfSummary
	reportTypes = MultiObjectAnnouncement
;
