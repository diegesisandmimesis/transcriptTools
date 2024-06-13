#charset "us-ascii"
//
// transcriptToolsTransform.t
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

modify CommandTranscript
	_reportIterList = nil

	transforms_ = [
		transcriptToolsTransformPreprocess,
		defaultReportTransform,
		implicitGroupTransform,
		reportOrderTransform,
		transcriptToolsTransformMain,
		complexMultiTransform,
		transcriptToolsTransformPostprocess
	]

	getMatchingReports(fn) {
		local v;

		v = new Vector(reports_.length);

		forEachReport(function(o) {
			if((fn)(o) == true)
				v.append(o);
		});

		return(v);
	}

	_generateReportIterList() {
		local idx, v;

		if(_reportIterList == nil)
			_reportIterList = new Vector(8);
		else
			_reportIterList.setLength(0);

		v = new Vector(8);
		forEachReport(function(o) {
			if((idx = v.indexOf(o.iter_)) == nil) {
				v.appendUnique(o.iter_);
				_reportIterList.append(new Vector());
				idx = _reportIterList.length;
			}
			_reportIterList[idx].append(o);
		});
	}

	forEachReportIter(fn) {
		if(_reportIterList == nil)
			_generateReportIterList();

		_reportIterList.forEach({ x: (fn)(x) });
	}
;

class TranscriptToolsTransform: TranscriptTransform, TranscriptToolsWidget
;

transcriptToolsTransformPreprocess: TranscriptToolsTransform
	applyTransform(t, vec) {
		if(vec.length == 0)
			return;
		transcriptTools.preprocessEntry(t, vec);
	}
;

transcriptToolsTransformMain: TranscriptToolsTransform
	applyTransform(t, vec) {
		if(vec.length == 0)
			return;
		transcriptTools.runEntry(t, vec);
	}
;

transcriptToolsTransformPostprocess: TranscriptToolsTransform
	applyTransform(t, vec) {
		if(vec.length == 0)
			return;
		transcriptTools.postprocessEntry(t, vec);
	}
;


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
