#charset "us-ascii"
//
// transcriptToolsDebuggerAction.t
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

#ifdef __DEBUG

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

modify Action
	transcriptToolsDebuggerAfterActionMain() {
		if(ofKind(SystemAction))
			return;
		if(parentAction != nil)
			return;
		__transcriptToolDebugger.afterActionMain();
	}

	afterActionMain() {
		inherited();
		transcriptToolsDebuggerAfterActionMain();
	}
;

#endif // __DEBUG
