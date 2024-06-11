#charset "us-ascii"
//
// transcriptTools.t
//
//	A TADS3/adv3 module for managing reports and the transcript.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

// Module ID for the library
transcriptToolsModuleID: ModuleID {
        name = 'Transcript Tools Library'
        byline = 'Diegesis & Mimesis'
        version = '1.0'
        listingOrder = 99
}

// Generic class for stuff in the module.
class TranscriptToolsObject: Syslog syslogID = 'transcriptTools';

// Class for high-level "manager"-type objects that can be toggled on
// and off.
class TranscriptToolsWidget: TranscriptToolsObject
	active = true

	getActive() { return(active == true); }
	setActive(v) { active = (v ? true : nil); }

	// Wrappers for the base methods, only calls them when we're active
	_preprocess(t, v) { if(getActive()) preprocess(t, v); }
	_run(t, v) { if(getActive()) run(t, v); }
	_postprocess(t, v) { if(getActive()) postprocess(t, v); }

	// Stub methods to be overwritten by subclasses
	preprocess(t, v) {}
	run(t, v) {}
	postprocess(t, v) {}
	clear(t, v) {}

	resolveTranscript(t?) { return(t ? t : gTranscript); }
	resolveReports(t?) { return(resolveTranscript(t).reports_); }
;


// Abstract class for widgets that operate on (group, sort, or whatever)
// the entire transcript.
class TranscriptTool: TranscriptToolsWidget
	// The TranscriptTools instance we're a part of
	parentTools = nil

	// Numeric priority for the tool.
	// Lower-numbered tools go before higher-numbered tools.  Basic
	// ordering is something like:
	//
	//	100	grouping tools
	//	200	sorting tools
	//	300	markup tools
	//	900	default
	//
	toolPriority = 900

	// Called at preinit
	initializeTranscriptTool() {
		if(location == nil) return;
		location.addTranscriptTool(self);
	}
;

// A couple of "base subclasses" for transcript parsing widgets.  Pure sugar.
class TranscriptPreprocessor: TranscriptTool;
class TranscriptPostprocessor: TranscriptTool;

// Base class for transcript-rewriting logic.
// In theory this is an abstract class so we can create pre-transcript
// instances that do different things.  But in practice all you probably
// want is the stock transcriptTools instance declared below.
transcriptTools: TranscriptToolsWidget
	// Optional list of TranscriptTool classes to add instances of
	// to ourselves at preinit
	defaultTools = nil

	_timestamp = nil

	// List of TranscriptTool instances we're using
	_transcriptTools = perInstance(new Vector())

	// Called at preinit
	initializeTranscriptTools() {
		addDefaultTranscriptTools();
		sortTranscriptTools();
	}

	// Returns the first tool, if any, matching the given class
	getTranscriptTool(cls) {
		local i;

		for(i = 1; i <= _transcriptTools.length; i++) {
			if(_transcriptTools[i].ofKind(cls))
				return(_transcriptTools[i]);
		}

		return(nil);
	}

	// Set up our default widgets
	addDefaultTranscriptTools() {
		local obj;

		if(defaultTools == nil)
			return;

		if(!defaultTools.ofKind(Collection))
			defaultTools = [ defaultTools ];

		defaultTools.forEach(function(o) {
			if(getTranscriptTool(o))
				return;

			obj = o.createInstance();
			obj.location = self;
			obj.initializeTranscriptTool();
		});
	}

	// Add the given widget to our list
	addTranscriptTool(obj) {
		if((obj == nil) || !obj.ofKind(TranscriptTool))
			return(nil);

		_transcriptTools.append(obj);
		obj.parentTools = self;

		return(true);
	}

	// Remove the given tool from our list
	removeTranscriptTool(obj) { _transcriptTools.removeElement(obj); }

	// Order the list of tools by their numeric toolPriority
	sortTranscriptTools() {
		_transcriptTools.sort(true, {
			a, b: b.toolPriority - a.toolPriority
		});
	}

	// Main turn lifecycle methods
	preprocess(t, v) { forEachTool({ x: x._preprocess(t, v) }); }
	run(t, v) { forEachTool({ x: x._run(t, v) }); }
	postprocess(t, v) { forEachTool({ x: x._postprocess(t, v) }); }
	clear() { forEachTool({ x: x.clear() }); }

	forEachTool(fn) { _transcriptTools.forEach({ x: (fn)(x) }); }
;
