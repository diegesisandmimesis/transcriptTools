#charset "us-ascii"
//
// transcriptReportManager.t
//
//	Base report manager-manager.  This is the widget that keeps track
//	of all the report managers and pings them to manipulate the transcript.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class TranscriptReportManager: TranscriptTool
	toolPriority = 500

	// Optional list of report managers to add at preinit.
	defaultReportManagers = nil

	// List of our report managers.
	_reportManagers = nil

	// Preinit method.
	initializeTranscriptTool() {
		inherited();
		addDefaultReportManagers();
	}

	// Add a report manager to our list.
	// IMPORTANT:  We DO NOT do this for every report manager we
	// 	use.  This is ONLY for ones we've created for our own
	//	use.
	addReportManager(obj) {
		if((obj == nil) || !obj.ofKind(ReportManager))
			return;

		if(_reportManagers == nil)
			_reportManagers = new Vector();

		_reportManagers.append(obj);
	}

	// Returns the report manager, if any, matching the given class.
	getReportManager(cls) {
		local i;

		if(_reportManagers == nil)
			return(nil);

		for(i = 1; i <= _reportManagers.length; i++) {
			if(_reportManagers[i].ofKind(cls))
				return(_reportManagers[i]);
		}

		return(nil);
	}

	// Make sure we have instances of all the report manager types
	// in our default list
	addDefaultReportManagers() {
		local obj;

		if(defaultReportManagers == nil)
			return;

		if(!defaultReportManagers.ofKind(Collection))
			defaultReportManagers = [ defaultReportManagers ];

		defaultReportManagers.forEach(function(o) {
			if(getReportManager(o))
				return;
			obj = o.createInstance();
			obj.location = self;
			obj.initializeReportManager();
			addReportManager(obj);
		});
	}

	// Entry point turning the turn.
	// First arg is the transcript, second is the vector of reports.
	run(t, v) {
		local l;

		// Generate a list of the per-object report managers that
		// need to run.
		l = new Vector();
		t.forEachReport(function(o) {
			if(o.dobj_ && o.dobj_.reportManager) {
				l.append(o.dobj_.reportManager);
			}
		});

		// Run them.
		l.forEach({ x: x._run(t, v) });

		// Now run all the "built-in" report managers.
		forEachReportManager({ x: x._run(t, v) });
	}

	// Convenience method to iterate over all the "built-in" report
	// managers.
	forEachReportManager(fn) {
		if(_reportManagers == nil)
			return;
		_reportManagers.forEach({ x: (fn)(x) });
	}
;
