#charset "us-ascii"
//
// transcriptToolsDebuggerAction.t
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

#ifdef __DEBUG

DefineSystemAction(TranscriptToolsStatus)
	execSystemAction() {
		local t;

		t = transcriptTools;
		"Transcript processing is <<(t.getActive ? 'enabled'
			: 'disabled')>>. ";
	}
;
VerbRule(TranscriptToolsStatus)
	'tt' ( '?' | 'status' ) : TranscriptToolsStatusAction
;

DefineSystemAction(TranscriptToolsOn)
	execSystemAction() {
		local t;

		t = transcriptTools;
		if(t.getActive()) {
			reportFailure('Transcript processing is already
				enabled. ');
			exit;
		}

		t.setActive(true);
		"Transcript processing is now enabled. ";
	}
;
VerbRule(TranscriptToolsOn)
	'tt' ( 'on' ) : TranscriptToolsOnAction
;

DefineSystemAction(TranscriptToolsOff)
	execSystemAction() {
		local t;

		t = transcriptTools;
		if(!t.getActive()) {
			reportFailure('Transcript processing is already
				disabled. ');
			exit;
		}

		t.setActive(nil);
		"Transcript processing is now disabled. ";
	}
;
VerbRule(TranscriptToolsOFF) 'tt' ( 'off' ) : TranscriptToolsOffAction;

DefineSystemAction(TranscriptToolsDebuggerStatus)
	_cmd(v) { return('<b>&gt;<<toString(v).toUpper()>></b>'); }
	execSystemAction() {
		local d;

		d = __transcriptToolDebugger;
		"Transcript debugger status:\n ";
		"(use <<_cmd('tti help')>> for help)\n<.p>\n ";

		"\nactive = <<toString(d.getActive())>>\n ";
		"\npreprocess = <<toString(d._activePreprocess)>>\n ";
		"\nrun = <<toString(d._activeRun)>>\n ";
		"\npostprocess = <<toString(d._activePostprocess)>>\n ";
	}
;
VerbRule(TranscriptToolsDebuggerStatus)
	'tti' ( 'status' | '?' ) : TranscriptToolsDebuggerStatusAction
	verbPhrase = 'transcript tools status'
;

DefineSystemAction(TTDPre)
	execSystemAction() {
		local d;

		d = __transcriptToolDebugger;
		d._activePreprocess = !d._activePreprocess;
		"Preprocess flag is now <<(d._activePreprocess ? '' : 'not')>>
			set. ";
	}
;
VerbRule(TTDPre)
	'tti' ( 'preprocess' | 'pre' ) : TTDPreAction
	verbPhrase = 'transcript tools preprocess'
;

DefineSystemAction(TTDRun)
	execSystemAction() {
		local d;

		d = __transcriptToolDebugger;
		d._activeRun = !d._activeRun;
		"Run flag is now <<(d._activeRun ? '' : 'not')>> set. ";
	}
;
VerbRule(TTDRun)
	'tti' 'run' : TTDRunAction
	verbPhrase = 'transcript tools run'
;

DefineSystemAction(TTDPost)
	execSystemAction() {
		local d;

		d = __transcriptToolDebugger;
		d._activePostprocess = !d._activePostprocess;
		"Postprocess flag is now <<(d._activePostprocess ? '' : 'not')>>
			set. ";
	}
;
VerbRule(TTDPost)
	'tti' ( 'postprocess' | 'post' ) : TTDPostAction
	verbPhrase = 'transcript tools postprocess'
;

DefineSystemAction(TranscriptToolsDebuggerHelp)
	_cmd(v) { return('<b>&gt;<<toString(v).toUpper()>></b>'); }
	_listCmd(cmd, usage) {
			"\n\t<<_cmd(cmd)>>";
		usage = '<QUOTE>' + usage + '</QUOTE>';
		"<<usage>> ";
	}
	execSystemAction() {
		"\ntranscriptTools interactive debugger commands:\n<.p>\n ";
		_listCmd('tti on',
			'Turns the interactive debugger on.  When on,
			the debugger will run after every command.'
		);
		_listCmd('tti off', 'Turns the interactive debugger off.');
		_listCmd('tti pre',
			'Toggles the <q>preprocess</q> flag.  When enabled,
			the debugger will run before any processing of the
			transcript.'
		);
		_listCmd('tti run',
			'Toggles the <q>run</q> flag.  When enabled, the
			debugger will run after <q>main</q> transcript
			processing, but before post-processing.'
		);
		_listCmd('tti post',
			'Toggles the <q>postprocess</q> flag.  When enabled,
			the debugger will run after all processing of the
			transcript, before output.'
		);
		_listCmd('tti status', 'Shows current the debugger status.');
	}
;
VerbRule(TranscriptToolsDebuggerHelp)
	'tti'  'help': TranscriptToolsDebuggerHelpAction
	verbPhrase = 'transcript help'
;


DefineSystemAction(TranscriptToolsDebuggerOn)
	execSystemAction() {
		if(__transcriptToolDebugger.getActive() == true) {
			reportFailure('Transcript debugger already on. ');
			exit;
		}
		__transcriptToolDebugger.setActive(true);
		defaultReport('Transcript debugger on. ');
	}
;
VerbRule(TranscriptToolsDebuggerOn)
	'tti' 'on' : TranscriptToolsDebuggerOnAction
	verbPhrase = 'transcript tools on'
;

DefineSystemAction(TranscriptToolsDebuggerOff)
	execSystemAction() {
		if(__transcriptToolDebugger.getActive() == nil) {
			reportFailure('Transcript debugger already off. ');
			exit;
		}
		__transcriptToolDebugger.setActive(nil);
		defaultReport('Transcript debugger off. ');
	}
;
VerbRule(TranscriptToolsDebuggerOff)
	'tti' 'off' : TranscriptToolsDebuggerOffAction
	verbPhrase = 'transcript tools off'
;

#endif // __DEBUG
