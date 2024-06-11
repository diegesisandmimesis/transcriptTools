#charset "us-ascii"
//
// transcriptToolsTransform.t
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

modify CommandTranscript
	transforms_ = [
		transcriptToolsTransformPreprocess,
		defaultReportTransform,
		implicitGroupTransform,
		reportOrderTransform,
		transcriptToolsTransformMain,
		complexMultiTransform,
		transcriptToolsTransformPostprocess
	]
;

class TranscriptToolsTransform: TranscriptTransform, TranscriptToolsWidget
;

transcriptToolsTransformPreprocess: TranscriptToolsTransform
	applyTransform(t, vec) { transcriptTools.preprocess(t, vec); }
;

transcriptToolsTransformMain: TranscriptToolsTransform
	applyTransform(t, vec) { transcriptTools.run(t, vec); }
;

transcriptToolsTransformPostprocess: TranscriptToolsTransform
	applyTransform(t, vec) { transcriptTools.postprocess(t, vec); }
;
