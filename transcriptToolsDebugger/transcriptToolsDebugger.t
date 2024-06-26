#charset "us-ascii"
//
// transcriptToolsDebugger.t
//
//	Interactive debugger for the transcript.
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

#ifdef __DEBUG
#ifdef TRANSCRIPT_TOOLS_DEBUGGER

class TTICommand: DtkCommand
	_tt = (_dtk)
	_indexOf(v) { return(_tt.transcript.reports_.indexOf(v)); }
	_listReport(v, ind?) {
		if(ind == nil) ind = 0;
		output('<<toString(_indexOf(v))>>:<<toString(v.iter_)>>\t'
			+ '<<toString(v)>>', nil, ind);
		ind += 2;
		if(v.action_)
			output('action = <<toString(v.action_)>>', nil, ind);
		if(v.isFailure)
			output('isFailure = <<toString(v.isFailure)>>',
				nil, ind);
		if(v.isActionImplicit)
			output('isActionImplicit = <<toString(v
				.isActionImplicit)>>', nil, ind);
		if(v.dobj_)
			v.dobj_._debugDobj(ind);
		if(v.messageProp_)
			output('messageProp_:
				&amp;<<toString(v.messageProp_)>>', nil, ind);
		if(v.messageText_ && (v.messageText_.length > 0))
			output('<<_tt.v2s(v.messageText_).htmlify()>>',
				nil, ind + 1);
	}
	forEachReport(fn) {
		if(!_tt || !_tt.transcript || !_tt.transcript.reports_) return;
		_tt.transcript.forEachReport(fn);
	}
;

__transcriptToolDebugger: DtkDebugger
	active = nil			// boolean flag. if set, run next turn

	_actionFlag = nil

	_activePreprocess = nil		// do we run during preprocessing
	_activeRun = nil		// do we run during main processing
	_activePostprocess = true	// do we run during postprocessing

	// Convenience method for valToSymbol
	v2s(v) { return(reflectionServices.valToSymbol(v)); }

	// Active flag getter and setter
	getActive() { return(active == true); }
	setActive(v) { active = v; }

	getActionFlag() { return(_actionFlag == true); }
	setActionFlag(v) { _actionFlag = (v ? true : nil); }

	runThisTurn(v) {
		if(gAction.ofKind(SystemAction))
			return(nil);
		return(v && getActive);
	}

	preprocess(t, v) {
		if(!runThisTurn(_activePreprocess))
			return;
		debugger(v, t, 'preprocessing');
	}

	run(t, v) {
		if(!_activeRun || !getActive())
			return;
		if(!runThisTurn(_activeRun))
			return;
		debugger(v, t, 'processing');
	}

	postprocess(t, v) {
		if(!runThisTurn(_activePostprocess))
			return;
		debugger(v, t, 'postprocessing');
	}
;
+TTICommand 'iter' 'list reports with a specific iter_ value'
	"Use <q>iter [number]</q> to list the reports with the given
	numeric iter_ value.  The iter_ value is automatically assigned by
	adv3, and is used to group reports related to a specific action or
	sub-action. "
	argCount = 1
	cmd(n) {
		local max;

		if((n == nil) || !isNumber(n)) {
			"\nInvalid iter number.\n ";
			return;
		}

		n = toInteger(n);

		max = 0;
		forEachReport(function(o) {
			if(o.iter_ > max) max = o.iter_;
		});

		if((n < 0) || (n > max)) {
			"\nInvalid iter number.\n ";
			return;
		}

		forEachReport(function(o) {
			if(o.iter_ == n)
				_listReport(o);
		});
	}
;
// List the reports in the transcript
+TTICommand 'list' 'list reports in transcript'
	"Use <q>list</q> to list all the reports in the transcript.  In the
	displayed output, each report will be indexed by two numbers separated
	by a colon, like <q>2:1</q>.  The first number is the index of the
	report in the transcript (<q>2</q> in this case).  The second number
	is the iter_ value for the report (<q>1</q> in this case).  Note that
	the report index counts from 1 and the iter_ value counts from 0. "
	cmd() {
		local i;

		i = nil;

		forEachReport(function(o) {
			if((i != nil) && (o.iter_ != i) && (_tt.spacer != nil))
				output(_tt.spacer);
			_listReport(o);
			i = o.iter_;
		});
	}
;
+TTICommand 'out' 'output the reports in transcript'
	"Use <q>out</q> to output the reports in the transcript.  This will
	display the message text for each report.  Note that the debugger
	will <b>not</b> use any output filters while displaying reports,
	so the text won't be formatted the same way it is in-game. "
	cmd() {
		_tt.transcript.showReports(true);
	}
;
+TTICommand 'show' 'show the numbered report'
	"Use <q>show</q> to display the details of a single numbered report. "
	argCount = 1
	cmd(n) {
		if((n == nil) || !isNumber(n)) {
			"\nInvalid report number.\n ";
			return;
		}

		n = toInteger(n);

		if((n < 1) || (n > _tt.transcript.reports_.length)) {
			"\nInvalid report number.\n ";
			return;
		}

		_listReport(_tt.transcript.reports_[n]);
	}
;

#endif // TRANSCRIPT_TOOLS_DEBUGGER
#endif // __DEBUG
