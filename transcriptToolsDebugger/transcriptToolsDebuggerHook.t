#charset "us-ascii"
//
// transcriptToolsDebuggerHook.t
//
//	Interactive debugger hooks.  This is where we attach ourselves
//	to normal TADS3 processing to drop into the debugger.
//
//	In a separate source file because it's getting fiddled around
//	with a lot.
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

#ifdef __DEBUG
#ifdef TRANSCRIPT_TOOLS_DEBUGGER

modify Action
	transcriptToolsDebuggerAfterActionMain() {
		if(ofKind(EventAction) || ofKind(SystemAction)
			|| (parentAction != nil))
			__transcriptToolDebugger.setActionFlag(nil);
		else
			__transcriptToolDebugger.setActionFlag(true);
	}

	afterActionMain() {
		inherited();
		transcriptToolsDebuggerAfterActionMain();
	}
;

modify transcriptTools
	_checkDebugger(t, v) {
		if((v.length == 0) || !__transcriptToolDebugger.getActionFlag())
			return(nil);
		return(true);
	}
	preprocessEntry(t, v) {
		if(!_checkDebugger(t, v)) return;
		__transcriptToolDebugger.preprocess(t, v);
		inherited(t, v);
	}
	runEntry(t, v) {
		if(!_checkDebugger(t, v)) return;
		__transcriptToolDebugger.run(t, v);
		inherited(t, v);
	}
	postprocessEntry(t, v) {
		if(!_checkDebugger(t, v)) return;
		__transcriptToolDebugger.postprocess(t, v);
		inherited(t, v);
	}
;

#endif // TRANSCRIPT_TOOLS_DEBUGGER
#endif // __DEBUG
