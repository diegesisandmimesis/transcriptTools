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

// Base report manager class
class ReportManager: TranscriptToolsWidget
	// If set, we only manage reports for the given object type.
	reportManagerFor = nil

	// Only summarize when we have at least this many matching reports.
	minSummaryLength = 2

	// List of summarizers to add at startup.  Configured in
	// transcriptToolsConfig.t
	defaultReportSummaries = nil

	// List of our summarizers.
	_reportManagerSummaries = perInstance(new Vector())

	// PreinitMethod.
	initializeReportManager() {
		initializeReportManagerFor();
		initializeReportManagerDefaultSummaries();
	}

	// Handle object-specific setup stuff.
	initializeReportManagerFor() {
		// If we're not report manager for an object type, nothing
		// to do.
		if(reportManagerFor == nil)
			return;

		if(!reportManagerFor.ofKind(Collection))
			reportManagerFor = [ reportManagerFor ];

		reportManagerFor.forEach(function(cls) {
			// Let all instances of the class know we're
			// their report manager.
			forEachInstance(cls, function(o) {
				o.reportManager = self;
			});
		});
	}

	// Returns boolean true if we're a report manager for the given object.
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

	// Main lifecycle method.  Ping our summarizers to run on the
	// current transcript.
	run(t, v) { forEachSummary({ x: x._run(t, v) }); }

	// Utility method to iterate over our summarizers.
	forEachSummary(fn) {  _reportManagerSummaries.forEach({ x: fn(x) }); }
;

// General non-object-specific report manager.
class ActionReportManager: ReportManager
	// We match any non-nil object.
	matchReportDobj(obj) { return(obj != nil); }
;

// Report manager that handles dobjFor(Action) { summarize(data) {} }
// logic.
class SelfReportManager: ReportManager
	// This is a list of bespoke summarizers designed to be used
	// by us.  They live in reportManager/selfSummaries.t
	defaultReportSummaries = static [
		SelfSummary,
		SelfSummaryImplicit,
		SelfSummaryExtra,
		SelfSummaryAnnouncement
	]
;
