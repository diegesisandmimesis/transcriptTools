#charset "us-ascii"
//
// implicitSummary.t
//
//	Base class for implicit action summaries.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class ImplicitSummary: ActionSummary
	isImplicit = true

	// Tweak the stock report merging logic to clean up after
	// we've merged implicit reports.
	_mergeReports(t, data) {
		// Do whatever we were going to do anyway.
		inherited(t, data);

		// Remove the non-implicit action announcements.
		_cleanupImplicit(t, data);
	}

	// When we merge implicit action reports we end up with
	// dangling "regular" action reports for the implicit actions
	// For example, if it's an implicit take, in addition to the implicit
	// "first taking the pebble" report there will be a regular
	// "Taken." command report for the underlying action.
	// Here we clean up those dangling reports because the ones that
	// no longer have a corresponding implicit report (because we just
	// summarized it away) would show up in the command output.
	_cleanupImplicit(t, data) {
		// The reports in the data object are grouped by
		// report type, so we just check the first one to
		// see if it's an implicit action annoucement.
		if(data.vec[1].ofKind(ImplicitActionAnnouncement))
			return;

		// Remove the the non-implicit action announcements.
		data.vec.forEach(function(o) {
			t.removeReport(o);
		});
	}

	summarize(data) { return(data.actionClause(true)); }
;
