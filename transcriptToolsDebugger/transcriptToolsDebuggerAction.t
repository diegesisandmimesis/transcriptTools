#charset "us-ascii"
//
// transcriptToolsDebuggerAction.t
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

#ifdef __DEBUG

DefineSystemAction(TranscriptToolsDebuggerStatus)
	_cmd(v) { return('<b>&gt;<<toString(v).toUpper()>></b>'); }
	execSystemAction() {
		local d;

		d = __transcriptToolDebugger;
		"TRANSCRIPT TOOL INTERACTIVE DEBUGGER STATUS\n ";
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
		if(usage.ofKind(Collection)) {
			usage.forEach(function(o) {
				"\n\t\t<<o>>\n ";
			});
		} else {
			"\n\t\t<<usage>>\n ";
		}
	}
	execSystemAction() {
		"\ntranscriptTools interactive debugger commands:\n<.p>\n ";
		_listCmd('tti on', [ 'turns interactive debugger on',
			'debugger will run after every command' ]);
		_listCmd('tti off', 'turns interactive debugger off');
		_listCmd('tti pre', 'toggles preprocess flag');
		_listCmd('tti run', 'toggles run flag');
		_listCmd('tti post', 'toggles postprocess flag');
		_listCmd('tti status', 'shows current debugger status');
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
