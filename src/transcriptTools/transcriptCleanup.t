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

// Cleanup MainCommandReport instances.
// When a double-quoted string contains an inline expression (via <<>>),
// this causes new MainCommandReports to be inserted into the transcript.
// For exmaple: "foo <<bar>> baz" results in THREE MainCommandReports
// being in the transcript:  one with the message text 'foo ', one with
// he contents of bar, and one with ' baz'.
// This widget merges the text of multiple MainCommandReports into a
// single instance.
class CleanupMainCommandReports: TranscriptPreprocessor

	preprocess(t, vec) {
		local l;

		// We handle each iter_ value separately.
		l = new Vector();
		vec.forEach({ x: l.appendUnique(x.iter_) });
		l.forEach({ x: _runIter(x, t, vec) });
	}

	// Handle iter_ value n.
	_runIter(n, t, vec) {
		local i, l, r, txt;

		// Make sure we have more than one MainCommandReport for
		// this iter_.
		l = vec.subset({ x: x.ofKind(MainCommandReport)
			&& x.iter_ == n });
		if(l.length < 2)
			return;

		// Start out with an empty string.
		txt = new StringBuffer();

		// This is to hold the first MainCommandReport we're
		// summarizing.  We'll put the updated message text on
		// it and remove the others.
		r = nil;

		// Go through the MainCommandReport instances.
		for(i = 1; i <= l.length; i++) {
			// Add this report's message text to the buffer.
			txt.append(l[i].messageText_);

			// If this is the first report we've summarized,
			// remember it.  Otherwise remove it from the
			// transcript.
			if(r == nil)
				r = l[i];
			else
				t.removeReport(l[i]);
		}

		// If we matched no reports or got no message text, fail.
		if((r == nil) || (txt.length == 0))
			return;

		// Set the complete message text on the first, now only,
		// report.
		r.messageText_ = toString(txt);
	}
;
