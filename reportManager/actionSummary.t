#charset "us-ascii"
//
// actionSummary.t
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class ActionSummary: ReportSummary
	matchMessageProp = nil

/*
	// Merge and summarize the reports.
	// First arg is the transcript, second is a _MergeData instance (which
	// contains reports for a specific report class).
	_mergeReports(t, data) {
		local i, r, txt;

		r = data.vec[1];

		for(i = 1; i <= data.vec.length; i++) {
			// Add all the dobjs and iobjs from the individual
			// reports onto the first report.
			r.addDobj(data.vec[i].dobj_);
			r.addIobj(data.vec[i].iobj_);

			// Remove all the reports except the first one.
			if(i != 1)
				t.removeReport(data.vec[i]);
		}

		// Call the summarizer method for this kind of report,
		// as defined in the _reportClass table.  If the summarizer
		// method returns nil, bail.
		if((txt = (_reportClasses[data._reportClass])(r)) == nil)
			return;

		r.messageText_ = txt;
	}
*/
	_mergeReports(t, data) {
		_mergeReportList(t, data.vec, data._reportClass);
	}
	
	summarize(data) { return('{You/He} <<data.actionClause()>>.'); }
;

class ActionFailureSummary: ActionSummary, FailureSummary
	summarize(data) { return('{You/He} can\'t '
		+ '<<data.actionClauseWithOr()>>.'); }
;
