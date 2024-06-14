#charset "us-ascii"
//
// mergeReports.t
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class MergeReport: object
	matchClass = nil

	matchReport(r0, r1) {
		if((r0 == nil) || (r1 == nil) || (matchClass == nil))
			return(nil);

		if(!r0.ofKind(matchClass) || !r1.ofKind(matchClass))
			return(nil);

		if(r0.action != r1.action)
			return(nil);

		return(true);
	}
;

mergeImplicit: MergeReport
	matchClass = ImplicitActionAnnouncement
;

mergeMultiObject: MergeReport
	matchClass = MultiObjectAnnouncement
;

mergeDefault: MergeReport
	matchClass = DefaultCommandReport
;

mergeMain: MergeReport
	matchClass = MainCommandReport
;

mergeFull: MergeReport
	matchClass = FullCommandReport
;
