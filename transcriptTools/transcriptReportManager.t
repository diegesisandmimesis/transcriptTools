#charset "us-ascii"
//
// transcriptReportManager.t
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class TranscriptReportManager: TranscriptTool
	toolPriority = 500

	defaultReportManagers = nil
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

	run(t, v) {
		local l;

		l = new Vector();
		t.forEachReport(function(o) {
			if(o.dobj_ && o.dobj_.reportManager) {
				l.append(o.dobj_.reportManager);
			}
		});
		l.forEach({ x: x._run(t, v) });

		forEachReportManager({ x: x._run(t, v) });
	}

	forEachReportManager(fn) {
		if(_reportManagers == nil)
			return;
		_reportManagers.forEach({ x: (fn)(x) });
	}
;
