#charset "us-ascii"
//
// transcriptToolsMods.t
//
//	Modifications to base TADS3/adv3 classes.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

// Remember the direct object in every command report.
// This approach is from Eric Eve's "Manipulating the Transcript"
//	https://tads.org/t3doc/doc/techman/t3transcript.htm
modify CommandReport
	dobj_ = nil			// to remember gDobj
	iobj_ = nil			// to remember gIobj

	construct() {
		inherited();
		dobj_ = gDobj;
		iobj_ = gIobj;
	}
;

modify CommandTranscript
	noSummary = nil

	removeReport(report) {
		if(reports_.indexOf(report) == nil)
			return(nil);

		_clearReportIterList();
		reports_.removeElement(report);
		return(true);
	}
;

modify Action
	// Property for naming the action-specific summarizer property
	summarizeDobjProp = nil

	noSummary = nil

	ofAnyKind(val) {
		local i;

		if(!val.ofKind(Collection))
			return(self.ofKind(val));

		for(i = 1; i <= val.length; i++) {
			if(self.ofKind(val[i]))
				return(true);
		}

		return(nil);
	}
;

modify Thing
	reportManager = nil	// report manager for this object, if any
	_reportCount = nil	// number of matching objects in report, if
				//	we've been chosed as the representative
				//	dobj for a report summary
;

gNoSummary() { if(gTranscript) gTranscript.noSummary = true; }
