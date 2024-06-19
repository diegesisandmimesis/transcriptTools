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

// Remove multi-object announcements when we've summarized things down
// to a single report or report group
class CleanupSingleAnnouncements: TranscriptCleanup
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

// Remove multi-object announcements for report groups that have been
// summarized away
class CleanupOrphanedAnnouncements: TranscriptCleanup
	postprocess(t, vec) {
		t.forEachReportIter(function(o) {
			if(o.subset({ x: x.ofKind(MultiObjectAnnouncement) })
				.length == 0)
				return;
			if(o.length == 1)
				t.removeReport(o[1]);
		});
	}
;

// Remove identical ExtraSummaryReports
class CleanupExtraSummaryReports: TranscriptCleanup
	postprocess(t, vec) {
		local i, j, l;

		l = vec.subset({ x: x.ofKind(ExtraSummaryReport) });
		for(i = 1; i <= l.length; i++) {
			for(j = i + 1; j <= l.length; j++) {
				if(l[i].messageText_ == l[j].messageText_)
					t.removeReport(l[j]);
			}
		}
	}
;
