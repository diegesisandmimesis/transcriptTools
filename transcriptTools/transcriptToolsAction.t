#charset "us-ascii"
//
// transcriptToolsAction.t
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

modify Action defaultMessageProp = nil;

modify TakeAction defaultMessageProp = &okayTakeMsg;
modify DropAction defaultMessageProp = &okayDropMsg;

