//
// transcriptTools.h
//

#include "syslog.h"
#ifndef SYSLOG_H
#error "This module requires the syslog module."
#error "https://github.com/diegesisandmimesis/syslog"
#error "It should be in the same parent directory as this module.  So if"
#error "transcriptTools is in /home/user/tads/transcriptTools, then"
#error "syslog should be in /home/user/tads/syslog ."
#endif // SYSLOG_H

#ifdef __DEBUG
#ifdef TRANSCRIPT_TOOLS_DEBUGGER

#ifndef DTK
#error "Compiling with -D TRANSCRIPT_TOOLS_DEBUGGER requires also using"
#error "-D DTK (and this module can't force that, because the dependencies"
#error "need to be compiled with it as well."
#endif // DTK

#include "bufferedOutputFilter.h"
#ifndef BUFFERED_OUTPUT_FILTER_H
#error "This module requires the bufferedOutputFilter module."
#error "https://github.com/diegesisandmimesis/bufferedOutputFilter"
#error "It should be in the same parent directory as this module.  So if"
#error "transcriptTools is in /home/user/tads/transcriptTools, then"
#error "bufferedOutputFilter should be in /home/user/tads/bufferedOutputFilter ."
#endif // BUFFERED_OUTPUT_FILTER_H

#include "debugToolKit.h"
#ifndef DEBUG_TOOL_KIT_H
#error "This module requires the debugToolKit module."
#error "https://github.com/diegesisandmimesis/debugToolKit"
#error "It should be in the same parent directory as this module.  So if"
#error "transcriptTools is in /home/user/tads/transcriptTools, then"
#error "debugToolKit should be in /home/user/tads/debugToolKit ."
#endif // DEBUG_TOOL_KIT_H

#endif // TRANSCRIPT_TOOLS_DEBUGGER
#endif // __DEBUG

#define gIsReport(r) (((r != nil) && r.ofKind(CommandReport)) ? true : nil)
#define gReportObject(r) (gIsReport(r) ? r.dobj_ : nil)
#define gReportObjectOfKind(r, cls) \
	(gIsReport(r) ? (r.dobj_ ? r.dobj_.ofKind(cls) : nil) : nil)
#define gReportAction(r) (gIsReport(r) ? r.action_ : nil)

// Patches for action definition macros.
// Identical to stock plus the summary-specific properties
#undef DefineTActionSub
#define DefineTActionSub(name, cls) \
	DefineAction(name, cls) \
	verDobjProp = &verifyDobj##name \
	remapDobjProp = &remapDobj##name \
	preCondDobjProp = &preCondDobj##name \
	checkDobjProp = &checkDobj##name \
	actionDobjProp  = &actionDobj##name \
	summarizeDobjProp = &summarizeDobj##name \
	summarizeImplicitDobjProp = &summarizeImplicitDobj##name \
	summarizeExtraDobjProp = &summarizeExtraDobj##name \
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobj##name \
	whenSummarizedDobjProp = &whenSummarizedDobj##name \

#undef DefineTIActionSub
#define DefineTIActionSub(name, cls) \
	DefineAction(name, cls) \
	verDobjProp = &verifyDobj##name \
	verIobjProp = &verifyIobj##name \
	remapDobjProp = &remapDobj##name \
	remapIobjProp = &remapIobj##name \
	preCondDobjProp = &preCondDobj##name \
	preCondIobjProp = &preCondIobj##name \
	checkDobjProp = &checkDobj##name \
	checkIobjProp = &checkIobj##name \
	actionDobjProp  = &actionDobj##name \
	actionIobjProp = &actionIobj##name \
	summarizeDobjProp = &summarizeDobj##name \
	summarizeImplicitDobjProp = &summarizeImplicitDobj##name \
	summarizeExtraDobjProp = &summarizeExtraDobj##name \
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobj##name \
	whenSummarizedDobjProp = &whenSummarizedDobj##name

ReportSummary template @action;

// Macro to add an extra summary.  Used by e.g. whenSummarized() methods.
#define extraSummaryReport(d, txt) \
	(transcriptTools._extraSummaryReport(d, txt))

#ifdef __DEBUG
TTICommand template 'id' 'help'? "longHelp"?;
#endif // __DEBUG

#define TRANSCRIPT_TOOLS_H
