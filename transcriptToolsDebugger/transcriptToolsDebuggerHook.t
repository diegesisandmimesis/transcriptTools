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

/*
// Action-based hook
// This works, but has the disadvantage that the debugger can only
// be stated at one point in the turn lifecycle.
// Another idea is to use the preprocess(), run(), and postprocess()
// methods on TranscriptToolsTransform.  This is where we really
// want the hooks to be, but those methods get fired whenever the
// transcript is processed, which we DON'T want.
// Maybe some kind of fancy locking mechanism?
modify Action
	transcriptToolsDebuggerAfterActionMain() {
		if(ofKind(EventAction) || ofKind(SystemAction)
			|| (parentAction != nil))
			return;

		__transcriptToolDebugger.afterActionMain();
	}

	afterActionMain() {
		inherited();
		transcriptToolsDebuggerAfterActionMain();
	}
;
*/

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

#endif // __DEBUG
