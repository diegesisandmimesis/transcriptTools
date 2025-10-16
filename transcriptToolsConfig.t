#charset "us-ascii"
//
// transcriptToolsConfig.t
//
//	transcriptTools configuration.
//
//	This is where the default report managers and summarizers are set.
//	In general you probably won't have to change any of this.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

// Module ID for the library
transcriptToolsModuleID: ModuleID {
        name = 'Transcript Tools Library'
        byline = 'Diegesis & Mimesis'
        version = '1.0'
        listingOrder = 99
}

// The tools used by the transcriptTools singleton
modify transcriptTools
	defaultTools = static [
		MarkFailures,
		CleanupMainCommandReports,
		TranscriptReportManager,
		ImplicitGrouper,
		CleanupSingleAnnouncements,
		CleanupOrphanedAnnouncements,
		CleanupExtraSummaryReports
	]
;

// Define report managers used by the "main" transcript report manager.
// Generally there's only one TranscriptReportManager instance, owned
// by the transcriptTools singleton, above.
modify TranscriptReportManager
	defaultReportManagers = static [
		ActionReportManager,
		SelfReportManager
	]
;

// Add the default summaries to ActionReportManager instances.  Once again
// there's usually only one ActionReportManager instance, the one declared
// as one of the default report managers above.
modify ActionReportManager
	defaultReportSummaries = static [
		TakeSummary,
		TakeFromSummary,
		DropSummary,
		PutOnSummary,
		PutInSummary,
		PutUnderSummary,
		PutBehindSummary,

		ImplicitTakeSummary,

		TakeFailureSummary
	]
;

modify SelfReportManager
	// Special summarizer classes for handling self-summary logic.
	// You probably don't want to touch this unless you know what
	// you're doing.
	defaultReportSummaries = static [
		SelfSummary,
		SelfSummaryImplicit,
		SelfSummaryExtra,
		SelfSummaryAnnouncement
	]
;
