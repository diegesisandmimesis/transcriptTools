#charset "us-ascii"
//
// transcriptToolsDebuggerMods.t
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

#ifdef __DEBUG

modify Thing
	_output(msg, svc?, ind?)
		{ __transcriptToolDebugger.output(msg, svc, ind); }

	_debugDobj(ind?) {
		if(ind == nil)
			ind = 0;

		_output('dobj_ = <<name>> @
			<<toString(location ? location.name : nil)>>', nil,
			ind);
	}
;

modify CommandReport
	_output(msg, svc?, ind?)
		{ __transcriptToolDebugger.output(msg, svc, ind); }

	_debugReport(ind?) {
		if(ind == nil)
			ind = 0;

		ind += 1;
		_output(toString(self), nil, ind);

		ind += 1;
		_output('iter = <<toString(iter_)>>', nil, ind);
		_output('action = <<toString(action_)>>', nil, ind);
		_output('isFailure = <<toString(isFailure)>>', nil, ind);
		_output('isActionImplicit = <<toString(isActionImplicit)>>',
			nil, ind);
		if(dobj_)
			dobj_._debugDobj(ind);
	}
;

modify CommandTranscript
	_output(msg, svc?, ind?)
		{ __transcriptToolDebugger.output(msg, svc, ind); }

	_debugTranscript(ind?) {
		if(ind == nil)
			ind = 0;
		
		reports_.forEach({ x: x._debugReport(ind) });
	}
;

modify transcriptToolsPreinit
	execute() {
		inherited();
		mainOutputStream.addOutputFilter(quoteOutputFilter);
			//typographicalOutputFilter);
	}
;

modify quoteOutputFilter
	lineBufferWidth = 50
;

#endif // __DEBUG
