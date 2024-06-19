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

class TTIOutputStream: OutputStream
	writeFromStream(txt) { aioSay(txt); }
;

// Data structure for handling debugger operators and args
class TTIParseResult: object
	cmd = nil
	arg = nil

	construct(v0, v1?) {
		cmd = v0;
		arg = v1;
	}
;

class TTIObject: object
	// pointer to the debugger
	_tt = __transcriptToolDebugger
	output(msg, svc?, ind?) { _tt.output(msg, svc, ind); }
;

// Class for individual debugger commands
class TTICommand: TTIObject
	// command keyword.  that's the actual typed command, like "exit"
	id = nil

	// short help message.  used in the list displayed by the "help" command
	help = '[this space intentionally left blank]'

	// long help message.  displayed for "help [command]"
	longHelp = "[this space intentionally left blank]"


	cmd(arg?) { return(true); }			// command method

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
;

// The debugger itself
__transcriptToolDebugger: PreinitObject
	active = nil			// boolean flag. if set, run next turn

	_actionFlag = nil

	_activePreprocess = nil		// do we run during preprocessing
	_activeRun = nil		// do we run during main processing
	_activePostprocess = true	// do we run during postprocessing

	prompt = '&gt;&gt;&gt; '	// debugger prompt
	prefix = ''			// output prefix
	spacer = '====='		// output spacer.  nil for none
	padding = '==='			// padding for debug banners
	_indentChr = '\t'		// indentation character

	transcript = nil		// saved "real" transcript
	stream = nil			// saved "real" output stream

	// Lookup table for the debugger command objects
	commands = perInstance(new LookupTable())

	// Rexen for command parsing
	_skipRexen = static [ '^$', '^<space>*$' ]
	_helpRex = '^<space>*<question><space>*$'
	_niladicRex = '^<space>*(<alpha>+)<space>*$'
	_unaryRex = '^<space>*(<alpha>+)<space>+(<AlphaNum>+)<space>*$'

	// Debugger lock.  Probably not needed
	_debuggerLock = nil

	// Convenience method for valToSymbol
	v2s(v) { return(reflectionServices.valToSymbol(v)); }

	// Output formatter.  Mostly for handling indentation
	formatOutput(msg, svc?, ind?) {
		local i, r;

		if(msg == nil)
			return('');

		r = new StringBuffer();
		if(svc == nil)
			svc = prefix;

		if(svc.length > 0) {
			r.append(svc);
			r.append(': ');
		}

		if(ind) {
			for(i = 0; i < ind; i++)
				r.append(_indentChr);
		}
		r.append(msg);

		return(toString(r));
	}

	// Generic output method
	output(msg, svc?, ind?)
		{ aioSay('\n<<formatOutput(msg, svc, ind)>>\n '); }

	// Preinit method.  Sets up command objects
	execute() {
		forEachInstance(TTICommand, function(o) {
			self.addCommand(o);
		});
	}

	addCommand(obj) {
		if((obj == nil) || !obj.ofKind(TTICommand))
			return(nil);

		commands[obj.id] = obj;

		return(true);
	}

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
		debugger(t, v, 'preprocessing');
	}

	run(t, v) {
		if(!_activeRun || !getActive())
			return;
		if(!runThisTurn(_activeRun))
			return;
		debugger(t, v, 'processing');
	}

	postprocess(t, v) {
		if(!runThisTurn(_activePostprocess))
			return;
		debugger(t, v, 'postprocessing');
	}

/*
	afterActionMain() {
		if(!getActive())
			return;
		if(gAction.ofKind(TranscriptToolsDebuggerOffAction))
			return;
		debugger(gTranscript, gTranscript.reports_);
	}
*/

	// Handle the debugger lock
	_setDebuggerLock(v) {
		if(_debuggerLock == v)
			return(nil);
		_debuggerLock = v;
		return(true);
	}

	banner(txt) {
		output('<<padding>><<txt>><<padding>>');
	}

	// Main debugger loop
	debugger(t, v, lbl) {
		// See if we can set the lock; bail if we can't
		if(!_setDebuggerLock(true))
			return;

		// Switch from the game output stream/transcript to
		// the debugger stream/transcript
		setDebugOutput(t, v);

		if(lbl == nil)
			lbl = 'unknown';

		// Startup banner
		banner('breakpoint in <<lbl>>');
		banner('type HELP or ? for information on the interactive
			debugger');

		// Input/command loop
		for(;;) {
			// Display our command prompt
			// IMPORTANT:  we can't use output() here because
			//	that would put a newline after the prompt
			aioSay('\n<<prompt>>');

			// Keep accepting and processing commands until
			// the command handler returns nil
			cmd = inputManager.getInputLine(nil, nil);
			if(handleDebuggerCommand(cmd) != true) {
				// Switch the output stream and transcript
				// back to where they were before we started
				unsetDebugOutput(t, v);

				// Clear our lock
				_setDebuggerLock(nil);

				// Return to the game
				return;
			}
		}
	}

	// Turn off the game's main transcript and output stream, substituting
	// our own.
	setDebugOutput(t, v) {
		// Remember the current settings, so we can restore them later
		stream = outputManager.curOutputStream;
		transcript = t;
		
		// Set our new stream and transcript
		outputManager.setOutputStream(new TTIOutputStream);
		gTranscript = new CommandTranscript();
	}

	// Undo the stuff we did in setDebugOutput() above
	unsetDebugOutput(t, v) {
		outputManager.setOutputStream(stream);
		outputManager.curTranscript = transcript;
		gTranscript = transcript;

		transcript = nil;
	}

	// Command execution cycle, such as it is
	handleDebuggerCommand(txt) {
		local r;

		if((r = parseDebuggerCommand(txt)) == nil)
			return(true);

		return(execDebuggerCommand(r));
	}

	// Attempt to parse the input string as a debugger command, possibly
	// with an argument
	// We return either nil (do nothing) or a TTIParseResult instance
	// (holding the command and maybe arg)
	parseDebuggerCommand(txt) {
		local i;

		// No command, nothing to do
		if(txt == nil)
			return(nil);

		// Check our various "no command in input" regexen
		for(i = 1; i <= _skipRexen.length; i++)
			if(rexMatch(_skipRexen[i], txt) != nil)
				return(nil);

		// Special case:  see if the input is "?", and handle it
		// as if the input was "help" if so
		if(rexMatch(_helpRex, txt) != nil) {
			ttiHelp.cmd();
			return(nil);
		}

		// See if we have a command with no arg
		if(rexMatch(_niladicRex, txt) != nil)
			return(new TTIParseResult(rexGroup(1)[3].toLower()));

		// See if we have a command and an arg
		if(rexMatch(_unaryRex, txt) != nil)
			return(new TTIParseResult(rexGroup(1)[3].toLower(),
				rexGroup(2)[3].toLower()));

		// Dunno what we got, complain
		"\nUnknown debugger command.\n ";
		return(nil);
	}

	// Try to execute the command
	// Arg is a TTIParseResult instance
	execDebuggerCommand(op) {
		local i, k;

		k = commands.keysToList();
		for(i = 1; i <= k.length; i++) {
			if(k[i] == op.cmd)
				return(commands[k[i]].cmd(op.arg));
		}

		// Didn't match anything, complain
		"\nUnknown debugger command.\n ";

		return(true);
	}

	isNumber(v)
		{ return(rexMatch('^<space>*(<Digit>+)<space>*$', v) != nil); }
;
// Exit the debugger
+TTICommand 'exit' 'exit the debugger'
	"Use <q>exit</q> to exit the debugger and return to the game. "
	cmd(arg?) {
		"\nExiting debugger.\n ";
		return(nil);
	}
;
// Display the help message
+ttiHelp: TTICommand 'help'
	'display this message. use <q>help [command]</q> for more information'
	"The <q>help</q> command displays a short help message, like this one. "
	cmd(arg?) {
		if(arg == nil)
			return(genericHelp());

		return(commandHelp(arg));
	}
	genericHelp() {
		_tt.commands.forEachAssoc(function(k, v) {
			"\n<b><<k>></b>\t<<v.help>>\n ";
		});

		return(true);
	}
	commandHelp(arg) {
		local c;

		if((c = _tt.commands[arg]) == nil) {
			"\n<q><b>arg</b></q>: Unknown debugger command.\n ";
			return(true);
		}

		c.longHelp();
		return(true);
	}
;
+TTICommand 'iter' 'list reports with a specific iter_ value'
	"Use <q>iter [number]</q> to list the reports with the given
	numeric iter_ value.  The iter_ value is automatically assigned by
	adv3, and is used to group reports related to a specific action or
	sub-action. "
	cmd(arg) {
		local max;

		if((arg == nil) || !_tt.isNumber(arg)) {
			"\nInvalid iter number.\n ";
			return(true);
		}

		arg = toInteger(arg);

		max = 0;
		_tt.transcript.reports_.forEach(function(o) {
			if(o.iter_ > max) max = o.iter_;
		});

		if((arg < 0) || (arg > max)) {
			"\nInvalid iter number.\n ";
			return(true);
		}

		_tt.transcript.reports_.forEach(function(o) {
			if(o.iter_ == arg)
				_listReport(o);
		});

		return(true);
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
	cmd(arg?) {
		local i;

		i = nil;
		_tt.transcript.reports_.forEach(function(o) {
			if((i != nil) && (o.iter_ != i) && (_tt.spacer != nil))
				output(_tt.spacer);
			_listReport(o);
			i = o.iter_;
		});

		return(true);
	}
;
+TTICommand 'out' 'output the reports in transcript'
	"Use <q>out</q> to output the reports in the transcript.  This will
	display the message text for each report.  Note that the debugger
	will <b>not</b> use any output filters while displaying reports,
	so the text won't be formatted the same way it is in-game. "
	cmd(arg?) {
		_tt.transcript.showReports(true);
		return(true);
	}
;
+TTICommand 'show' 'show the numbered report'
	"Use <q>show</q> to display the details of a single numbered report. "
	cmd(arg?) {
		if((arg == nil) || !_tt.isNumber(arg)) {
			"\nInvalid report number.\n ";
			return(true);
		}

		arg = toInteger(arg);

		if((arg < 1) || (arg > _tt.transcript.reports_.length)) {
			"\nInvalid report number.\n ";
			return(true);
		}

		_listReport(_tt.transcript.reports_[arg]);

		return(true);
	}
;

#endif // __DEBUG
