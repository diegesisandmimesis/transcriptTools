#charset "us-ascii"
//
// transcriptToolsTransform.t
//
//	Tweaks to CommandTranscript and TranscriptTransform.
//
//	This is the main hook we use to attach our logic to normal
//	adv3 transcript processing.
//
//	We tweak CommandTranscript to include a couple custom
//	TranscriptTransform instances, and they in turn ping methods
//	on the transcriptTools singleton.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

modify CommandTranscript
	// Cache for the reports in the transcript, grouped by iter_
	_reportIterList = nil

	transforms_ = [
		transcriptToolsTransformPreprocess,
		defaultReportTransform,
		//implicitGroupTransform,
		reportOrderTransform,
		transcriptToolsTransformMain,
		complexMultiTransform,
		transcriptToolsTransformPostprocess
	]

	// Returns a list of reports in the transcript that match the
	// given function.
	getMatchingReports(fn) {
		local v;

		v = new Vector(reports_.length);

		forEachReport(function(o) {
			if((fn)(o) == true)
				v.append(o);
		});

		return(v);
	}

	// Reset the iter cache.
	_clearReportIterList() { _reportIterList = nil; }

	// Generate the iter cache.
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

	// Group the reports in the transcript by iter_, then iterate
	// over the groups.
	forEachReportIter(fn) {
		if(_reportIterList == nil)
			_generateReportIterList();

		_reportIterList.forEach({ x: (fn)(x) });
	}

	// Convenience method to insert a report at the given point in
	// the transcript, padding it with CommandSepAnnouncements.
	insertReportAt(idx, report) {
		reports_.insertAt(idx, new CommandSepAnnouncement());
		idx += 1;
		reports_.insertAt(idx, report);
		idx += 1;
		reports_.insertAt(idx, new CommandSepAnnouncement());
	}
;

// Transforms.  TranscriptTransform is supplied by adv3.  Here we
// implement a few custom classes to insert ourselves at multiple points
// in processing.
class TranscriptToolsTransform: TranscriptTransform, TranscriptToolsWidget;

// Preprocess transform.  This is called before any other transcript
// processing.
transcriptToolsTransformPreprocess: TranscriptToolsTransform
	applyTransform(t, vec) {
		if(vec.length == 0)
			return;
		transcriptTools.preprocessEntry(t, vec);
	}
;

// "Main" transform.  This is called after a couple basic bookkeeping
// transforms (removing default reports when there's a superceding main
// report, sorting before, main, and after reports, and so on).
transcriptToolsTransformMain: TranscriptToolsTransform
	applyTransform(t, vec) {
		if(vec.length == 0)
			return;
		transcriptTools.runEntry(t, vec);
	}
;

// Postprocessing transform.  This is called after all the other
// transforms.
transcriptToolsTransformPostprocess: TranscriptToolsTransform
	applyTransform(t, vec) {
		if(vec.length == 0)
			return;
		transcriptTools.postprocessEntry(t, vec);
	}
;
