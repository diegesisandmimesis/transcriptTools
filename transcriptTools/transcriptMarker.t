#charset "us-ascii"
//
// transcriptMark.t
//
//	Tools to mark reports transcript-wide
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class TranscriptMarker: TranscriptPreprocessor
	toolPriority = 300
;

// Go through and mark all reports in a group as failures if the group
// itself is marked as a failure
class MarkFailures: TranscriptMarker
	preprocess(t, vec) {
		t.forEachReportIter(function(o) {
			if(o.subset({ x: x.isFailure }).length > 0)
				o.forEach({ x: x.isFailure = true });
		});
	}
;
