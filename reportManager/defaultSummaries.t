#charset "us-ascii"
//
// defaultReports.t
//
//	Class declarations of default summaries
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class TakeSummary: ActionSummary action = TakeAction;
class TakeFromSummary: ActionSummary action = TakeFromAction;
class DropSummary: ActionSummary action = DropAction;
class PutOnSummary: ActionSummary action = PutOnAction;
class PutInSummary: ActionSummary action = PutInAction;
class PutUnderSummary: ActionSummary action = PutUnderAction;
class PutBehindSummary: ActionSummary action = PutBehindAction;

class TakeFailureSummary: ActionFailureSummary action = TakeAction;

class ImplicitTakeSummary: ImplicitSummary action = TakeAction;
