#charset "us-ascii"
//
// reportManager.t
//
//	Report manager class declarations.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class ReportManager: TranscriptToolsWidget
	reportManagerFor = nil
	minSummaryLength = 2

	defaultReportSummaries = nil
	_reportManagerSummaries = perInstance(new Vector())

	initializeReportManager() {
		initializeReportManagerFor();
		initializeReportManagerDefaultSummaries();
	}

	initializeReportManagerFor() {
		if(reportManagerFor == nil)
			return;

		if(!reportManagerFor.ofKind(Collection))
			reportManagerFor = [ reportManagerFor ];

		reportManagerFor.forEach(function(cls) {
			forEachInstance(cls, function(o) {
				o.reportManager = self;
			});
		});
	}

	isReportManagerFor(obj) {
		local i;

		if(reportManagerFor == nil)
			return(nil);

		for(i = 1; i <= reportManagerFor.length; i++) {
			if(obj.ofKind(reportManagerFor[i]))
				return(true);
		}

		return(nil);
	}

	// Check to see if there are any default summaries that we don't
	// already have copies of.
	initializeReportManagerDefaultSummaries() {
		local l;

		// No default summaries, nothing to do.
		if(defaultReportSummaries == nil)
			return;

		// Make sure the list of defaults is list-ish.
		if(!defaultReportSummaries.ofKind(Collection))
			defaultReportSummaries = [ defaultReportSummaries ];

		// This will hold the summaries we need to add.
		l = new Vector(defaultReportSummaries.length);

		// Go through the list of defaults, checking to see
		// if we already have a summary for its action.
		defaultReportSummaries.forEach(function(o) {
			if(_checkForDuplicateSummary(o))
				return;
			l.appendUnique(o);
		});

		// Go through our list of defaults we don't have,
		// adding them.
		l.forEach({ x: addReportManagerSummary(x.createInstance()) });
	}

	_checkForDuplicateSummary(cls) {
		local i;

		for(i = 1; i <= _reportManagerSummaries.length; i++) {
			if(_reportManagerSummaries[i].matchSummary(cls))
				return(true);
		}

		return(nil);
	}

	// Add a summary to our list.
	addReportManagerSummary(obj) {
		// Make sure it's valid.
		if((obj == nil) || !obj.ofKind(ReportSummary))
			return(nil);

		// Add it.
		_reportManagerSummaries.appendUnique(obj);

		// Have it remember us.
		obj.reportManager = self;

		return(true);
	}

	run(t, v) { forEachSummary({ x: x._run(t, v) }); }

	forEachSummary(fn) {  _reportManagerSummaries.forEach({ x: fn(x) }); }
;

// General non-object-specific report manager.
class ActionReportManager: ReportManager
	matchReportDobj(obj) { return(obj != nil); }
;

// Report manager that handles dobjFor(Action) { summarize(data) {} }
// logic.
class SelfReportManager: ReportManager
	// SelfSummary is a bespoke summarizer designed for use with
	// this report manager.
	defaultReportSummaries = static [
		SelfSummary,
		SelfSummaryImplicit,
		SelfSummaryExtra
	]
;
