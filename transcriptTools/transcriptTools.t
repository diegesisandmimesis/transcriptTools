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

// Generic class for stuff in the module.
class TranscriptToolsObject: Syslog syslogID = 'transcriptTools';

// Object class that can be toggled on and off.
class TranscriptToolsToggle: TranscriptToolsObject
	active = true

	getActive() { return(active == true); }
	setActive(v) { active = (v ? true : nil); }
;

// Extend the toggle class (above) to include processing lifecycle methods.
class TranscriptToolsWidget: TranscriptToolsToggle
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


// Abstract class for tools that operate on (group, sort, or whatever)
// the entire transcript.
// You shouldn't directly create instances of this class, but instead
// use one of the subclasses immediately below it.
class _TranscriptToolBase: TranscriptToolsWidget
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
		location.addTranscriptTool(self, true);
	}
;

// A couple of subclasses for transcript parsing widgets.  These are
// the classes that should be instantiated.

// "Normal" tool.  Runs more or less in the middle of transcript processing.
class TranscriptTool: _TranscriptToolBase;

// Tool that runs before any other transcript processing.
class TranscriptPreprocessor: _TranscriptToolBase;

// Tool that runs after all other transcript processing.
class TranscriptPostprocessor: _TranscriptToolBase;

// Base class for transcript-rewriting logic.
// In theory this is an abstract class so we can create pre-transcript
// instances that do different things.  But in practice all you probably
// want is the stock transcriptTools instance declared below.
transcriptTools: TranscriptToolsWidget
	// Optional list of TranscriptTool classes to add instances of
	// to ourselves at preinit
	defaultTools = nil

	// List of tools we're using
	_transcriptTools = perInstance(new Vector())

	getActive() {
		if(!inherited())
			return(nil);
		return(true);
	}

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
	addTranscriptTool(obj, skipSort?) {
		if((obj == nil) || !obj.ofKind(_TranscriptToolBase))
			return(nil);

		_transcriptTools.append(obj);

		if(!skipSort)
			sortTranscriptTools();

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
	preprocessEntry(t, v) {
		if(!getActive() || t.noSummary) return;
		forEachTool({ x: x._preprocess(t, v) }, TranscriptPreprocessor);
	}
	runEntry(t, v) {
		if(!getActive() || t.noSummary) return;
		forEachTool({ x: x._run(t, v) }, TranscriptTool);
	}
	postprocessEntry(t, v) {
		if(!getActive() || t.noSummary) return;
		forEachTool({ x: x._postprocess(t, v) },
			TranscriptPostprocessor);
	}
	clear() { forEachTool({ x: x.clear() }); }

	forEachTool(fn, cls) {
		if(cls) {
			_transcriptTools.forEach(function(o) {
				if(!o.ofKind(cls)) return;
				(fn)(o);
			});
			return;
		}
		_transcriptTools.forEach({ x: (fn)(x) });
	}

	_extraSummaryReport(data, txt) {
		local idx, l, t;

		if((t = data.transcript_) == nil)
			return;

		l = t.reports_.subset({ x: x.iter_ == data.iter_ });
		if(l.length < 1)
			return;

		idx = t.reports_.indexOf(l[l.length]);
		t.reports_.insertAt(idx, new CommandSepAnnouncement());
		idx += 1;
		t.reports_.insertAt(idx, new AfterCommandReport(txt));
		idx += 1;
		t.reports_.insertAt(idx, new CommandSepAnnouncement());
	}
;
