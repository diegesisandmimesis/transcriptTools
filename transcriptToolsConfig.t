#charset "us-ascii"
//
// transcriptToolsConfig.t
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

modify transcriptTools
	defaultTools = static [
		MarkFailures,
		TranscriptReportManager,
		ImplicitGrouper,
		CleanupAnnouncements
	]
;

modify TranscriptReportManager
	defaultReportManagers = static [
		ActionReportManager,
		SelfReportManager
	]
;

modify ActionReportManager
	defaultReportSummaries = static [
		TakeSummary,
		TakeFromSummary,
		DropSummary,
		PutOnSummary,
		PutInSummary,
		PutUnderSummary,
		PutBehindSummary,

		ImplicitTakeSummary
	]
;
