#charset "us-ascii"
//
// transcriptToolsDebuggerAction.t
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

#ifdef __DEBUG

DefineSystemAction(TranscriptToolsDebuggerStatus)
	execSystemAction() {
		local d;

		d = __transcriptToolDebugger;

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
