#charset "us-ascii"
//
// transcriptCleanup.t
//
//	Tools to remove unneeded reports
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class TranscriptCleanup: TranscriptPostprocessor
	toolPriority = 990
;

class CleanupAnnouncements: TranscriptCleanup
	postprocess(t, vec) {
		if((vec.subset({ x: x.ofKind(MultiObjectAnnouncement) })
			.length) > 1)
			return;
		
		t.forEachReport(function(o) {
			if(o.ofKind(MultiObjectAnnouncement))
				t.removeReport(o);
		});
	}
;
