#charset "us-ascii"
//
// transcriptPreinit.t
//
//	Preinit object.  Mostly handles shuffling lexical ownership stuff.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

transcriptToolsPreinit: PreinitObject
	execute() {
		forEachInstance(ReportSummary, function(o) {
			o.initializeReportSummary();
		});
		forEachInstance(ReportManager, function(o) {
			o.initializeReportManager();
		});
		forEachInstance(_TranscriptToolBase, function(o) {
			o.initializeTranscriptTool();
		});
		transcriptTools.initializeTranscriptTools();
	}
;
