#charset "us-ascii"
//
// transcriptToolsPatch.t
//
//	Modifies all the stock adv3 TAction classes to have a
//	summarizeDobjProp property, required for self-summaries.
//
//	THIS FILE IS GENERATED AUTOMAGICALLY
//
//	Changes shouldn't be made here, but instead to
//	transcriptToolsGenerate.t.  See the comments there for more details.
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

modify StarboardAction
	summarizeDobjProp = &summarizeDobjStarboard
	summarizeImplicitDobjProp = &summarizeImplicitDobjStarboard
	summarizeExtraDobjProp = &summarizeExtraDobjStarboard
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjStarboard;
modify WestAction
	summarizeDobjProp = &summarizeDobjWest
	summarizeImplicitDobjProp = &summarizeImplicitDobjWest
	summarizeExtraDobjProp = &summarizeExtraDobjWest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjWest;
modify PortAction
	summarizeDobjProp = &summarizeDobjPort
	summarizeImplicitDobjProp = &summarizeImplicitDobjPort
	summarizeExtraDobjProp = &summarizeExtraDobjPort
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPort;
modify PourAction
	summarizeDobjProp = &summarizeDobjPour
	summarizeImplicitDobjProp = &summarizeImplicitDobjPour
	summarizeExtraDobjProp = &summarizeExtraDobjPour
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPour;
modify TurnAction
	summarizeDobjProp = &summarizeDobjTurn
	summarizeImplicitDobjProp = &summarizeImplicitDobjTurn
	summarizeExtraDobjProp = &summarizeExtraDobjTurn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTurn;
modify ListenImplicitAction
	summarizeDobjProp = &summarizeDobjListenImplicit
	summarizeImplicitDobjProp = &summarizeImplicitDobjListenImplicit
	summarizeExtraDobjProp = &summarizeExtraDobjListenImplicit
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjListenImplicit;
modify PushNorthAction
	summarizeDobjProp = &summarizeDobjPushNorth
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushNorth
	summarizeExtraDobjProp = &summarizeExtraDobjPushNorth
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushNorth;
modify PushSouthAction
	summarizeDobjProp = &summarizeDobjPushSouth
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushSouth
	summarizeExtraDobjProp = &summarizeExtraDobjPushSouth
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushSouth;
modify NortheastAction
	summarizeDobjProp = &summarizeDobjNortheast
	summarizeImplicitDobjProp = &summarizeImplicitDobjNortheast
	summarizeExtraDobjProp = &summarizeExtraDobjNortheast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjNortheast;
modify SoutheastAction
	summarizeDobjProp = &summarizeDobjSoutheast
	summarizeImplicitDobjProp = &summarizeImplicitDobjSoutheast
	summarizeExtraDobjProp = &summarizeExtraDobjSoutheast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSoutheast;
modify InventoryAction
	summarizeDobjProp = &summarizeDobjInventory
	summarizeImplicitDobjProp = &summarizeImplicitDobjInventory
	summarizeExtraDobjProp = &summarizeExtraDobjInventory
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjInventory;
modify NorthwestAction
	summarizeDobjProp = &summarizeDobjNorthwest
	summarizeImplicitDobjProp = &summarizeImplicitDobjNorthwest
	summarizeExtraDobjProp = &summarizeExtraDobjNorthwest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjNorthwest;
modify SouthwestAction
	summarizeDobjProp = &summarizeDobjSouthwest
	summarizeImplicitDobjProp = &summarizeImplicitDobjSouthwest
	summarizeExtraDobjProp = &summarizeExtraDobjSouthwest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSouthwest;
modify LieOnAction
	summarizeDobjProp = &summarizeDobjLieOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjLieOn
	summarizeExtraDobjProp = &summarizeExtraDobjLieOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLieOn;
modify DetachFromAction
	summarizeDobjProp = &summarizeDobjDetachFrom
	summarizeImplicitDobjProp = &summarizeImplicitDobjDetachFrom
	summarizeExtraDobjProp = &summarizeExtraDobjDetachFrom
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDetachFrom;
modify LookBehindAction
	summarizeDobjProp = &summarizeDobjLookBehind
	summarizeImplicitDobjProp = &summarizeImplicitDobjLookBehind
	summarizeExtraDobjProp = &summarizeExtraDobjLookBehind
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLookBehind;
modify ParseDebugAction
	summarizeDobjProp = &summarizeDobjParseDebug
	summarizeImplicitDobjProp = &summarizeImplicitDobjParseDebug
	summarizeExtraDobjProp = &summarizeExtraDobjParseDebug
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjParseDebug;
modify CleanAction
	summarizeDobjProp = &summarizeDobjClean
	summarizeImplicitDobjProp = &summarizeImplicitDobjClean
	summarizeExtraDobjProp = &summarizeExtraDobjClean
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjClean;
modify BreakAction
	summarizeDobjProp = &summarizeDobjBreak
	summarizeImplicitDobjProp = &summarizeImplicitDobjBreak
	summarizeExtraDobjProp = &summarizeExtraDobjBreak
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjBreak;
modify DebugAction
	summarizeDobjProp = &summarizeDobjDebug
	summarizeImplicitDobjProp = &summarizeImplicitDobjDebug
	summarizeExtraDobjProp = &summarizeExtraDobjDebug
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDebug;
modify ClimbAction
	summarizeDobjProp = &summarizeDobjClimb
	summarizeImplicitDobjProp = &summarizeImplicitDobjClimb
	summarizeExtraDobjProp = &summarizeExtraDobjClimb
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjClimb;
modify BoardAction
	summarizeDobjProp = &summarizeDobjBoard
	summarizeImplicitDobjProp = &summarizeImplicitDobjBoard
	summarizeExtraDobjProp = &summarizeExtraDobjBoard
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjBoard;
modify OopsIAction
	summarizeDobjProp = &summarizeDobjOopsI
	summarizeImplicitDobjProp = &summarizeImplicitDobjOopsI
	summarizeExtraDobjProp = &summarizeExtraDobjOopsI
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjOopsI;
modify SitOnAction
	summarizeDobjProp = &summarizeDobjSitOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjSitOn
	summarizeExtraDobjProp = &summarizeExtraDobjSitOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSitOn;
modify PutInAction
	summarizeDobjProp = &summarizeDobjPutIn
	summarizeImplicitDobjProp = &summarizeImplicitDobjPutIn
	summarizeExtraDobjProp = &summarizeExtraDobjPutIn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPutIn;
modify HelloAction
	summarizeDobjProp = &summarizeDobjHello
	summarizeImplicitDobjProp = &summarizeImplicitDobjHello
	summarizeExtraDobjProp = &summarizeExtraDobjHello
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjHello;
modify AttackWithAction
	summarizeDobjProp = &summarizeDobjAttackWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjAttackWith
	summarizeExtraDobjProp = &summarizeExtraDobjAttackWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjAttackWith;
modify PutOnAction
	summarizeDobjProp = &summarizeDobjPutOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjPutOn
	summarizeExtraDobjProp = &summarizeExtraDobjPutOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPutOn;
modify CloseAction
	summarizeDobjProp = &summarizeDobjClose
	summarizeImplicitDobjProp = &summarizeImplicitDobjClose
	summarizeExtraDobjProp = &summarizeExtraDobjClose
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjClose;
modify LightAction
	summarizeDobjProp = &summarizeDobjLight
	summarizeImplicitDobjProp = &summarizeImplicitDobjLight
	summarizeExtraDobjProp = &summarizeExtraDobjLight
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLight;
modify DrinkAction
	summarizeDobjProp = &summarizeDobjDrink
	summarizeImplicitDobjProp = &summarizeImplicitDobjDrink
	summarizeExtraDobjProp = &summarizeExtraDobjDrink
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDrink;
modify SleepAction
	summarizeDobjProp = &summarizeDobjSleep
	summarizeImplicitDobjProp = &summarizeImplicitDobjSleep
	summarizeExtraDobjProp = &summarizeExtraDobjSleep
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSleep;
modify StandAction
	summarizeDobjProp = &summarizeDobjStand
	summarizeImplicitDobjProp = &summarizeImplicitDobjStand
	summarizeExtraDobjProp = &summarizeExtraDobjStand
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjStand;
modify SmellAction
	summarizeDobjProp = &summarizeDobjSmell
	summarizeImplicitDobjProp = &summarizeImplicitDobjSmell
	summarizeExtraDobjProp = &summarizeExtraDobjSmell
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSmell;
modify EnterAction
	summarizeDobjProp = &summarizeDobjEnter
	summarizeImplicitDobjProp = &summarizeImplicitDobjEnter
	summarizeExtraDobjProp = &summarizeExtraDobjEnter
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjEnter;
modify TasteAction
	summarizeDobjProp = &summarizeDobjTaste
	summarizeImplicitDobjProp = &summarizeImplicitDobjTaste
	summarizeExtraDobjProp = &summarizeExtraDobjTaste
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTaste;
modify ScrewAction
	summarizeDobjProp = &summarizeDobjScrew
	summarizeImplicitDobjProp = &summarizeImplicitDobjScrew
	summarizeExtraDobjProp = &summarizeExtraDobjScrew
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjScrew;
modify UnlockWithAction
	summarizeDobjProp = &summarizeDobjUnlockWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnlockWith
	summarizeExtraDobjProp = &summarizeExtraDobjUnlockWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnlockWith;
modify NorthAction
	summarizeDobjProp = &summarizeDobjNorth
	summarizeImplicitDobjProp = &summarizeImplicitDobjNorth
	summarizeExtraDobjProp = &summarizeExtraDobjNorth
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjNorth;
modify PushTravelEnterAction
	summarizeDobjProp = &summarizeDobjPushTravelEnter
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelEnter
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelEnter
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelEnter;
modify ExitsAction
	summarizeDobjProp = &summarizeDobjExits
	summarizeImplicitDobjProp = &summarizeImplicitDobjExits
	summarizeExtraDobjProp = &summarizeExtraDobjExits
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjExits;
modify PushTravelAction
	summarizeDobjProp = &summarizeDobjPushTravel
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravel
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravel
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravel;
modify UnplugFromAction
	summarizeDobjProp = &summarizeDobjUnplugFrom
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnplugFrom
	summarizeExtraDobjProp = &summarizeExtraDobjUnplugFrom
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnplugFrom;
modify SouthAction
	summarizeDobjProp = &summarizeDobjSouth
	summarizeImplicitDobjProp = &summarizeImplicitDobjSouth
	summarizeExtraDobjProp = &summarizeExtraDobjSouth
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSouth;
modify ThrowAction
	summarizeDobjProp = &summarizeDobjThrow
	summarizeImplicitDobjProp = &summarizeImplicitDobjThrow
	summarizeExtraDobjProp = &summarizeExtraDobjThrow
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjThrow;
modify GoBackAction
	summarizeDobjProp = &summarizeDobjGoBack
	summarizeImplicitDobjProp = &summarizeImplicitDobjGoBack
	summarizeExtraDobjProp = &summarizeExtraDobjGoBack
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGoBack;
modify ExtinguishAction
	summarizeDobjProp = &summarizeDobjExtinguish
	summarizeImplicitDobjProp = &summarizeImplicitDobjExtinguish
	summarizeExtraDobjProp = &summarizeExtraDobjExtinguish
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjExtinguish;
modify DetachAction
	summarizeDobjProp = &summarizeDobjDetach
	summarizeImplicitDobjProp = &summarizeImplicitDobjDetach
	summarizeExtraDobjProp = &summarizeExtraDobjDetach
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDetach;
modify LookInAction
	summarizeDobjProp = &summarizeDobjLookIn
	summarizeImplicitDobjProp = &summarizeImplicitDobjLookIn
	summarizeExtraDobjProp = &summarizeExtraDobjLookIn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLookIn;
modify GiveToAction
	summarizeDobjProp = &summarizeDobjGiveTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjGiveTo
	summarizeExtraDobjProp = &summarizeExtraDobjGiveTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGiveTo;
modify TalkToAction
	summarizeDobjProp = &summarizeDobjTalkTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjTalkTo
	summarizeExtraDobjProp = &summarizeExtraDobjTalkTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTalkTo;
modify PlugInAction
	summarizeDobjProp = &summarizeDobjPlugIn
	summarizeImplicitDobjProp = &summarizeImplicitDobjPlugIn
	summarizeExtraDobjProp = &summarizeExtraDobjPlugIn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPlugIn;
modify SearchAction
	summarizeDobjProp = &summarizeDobjSearch
	summarizeImplicitDobjProp = &summarizeImplicitDobjSearch
	summarizeExtraDobjProp = &summarizeExtraDobjSearch
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSearch;
modify PushInAction
	summarizeDobjProp = &summarizeDobjPushIn
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushIn
	summarizeExtraDobjProp = &summarizeExtraDobjPushIn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushIn;
modify AttackAction
	summarizeDobjProp = &summarizeDobjAttack
	summarizeImplicitDobjProp = &summarizeImplicitDobjAttack
	summarizeExtraDobjProp = &summarizeExtraDobjAttack
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjAttack;
modify GetOutAction
	summarizeDobjProp = &summarizeDobjGetOut
	summarizeImplicitDobjProp = &summarizeImplicitDobjGetOut
	summarizeExtraDobjProp = &summarizeExtraDobjGetOut
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGetOut;
modify MoveToAction
	summarizeDobjProp = &summarizeDobjMoveTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjMoveTo
	summarizeExtraDobjProp = &summarizeExtraDobjMoveTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjMoveTo;
modify TypeOnAction
	summarizeDobjProp = &summarizeDobjTypeOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjTypeOn
	summarizeExtraDobjProp = &summarizeExtraDobjTypeOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTypeOn;
modify FastenAction
	summarizeDobjProp = &summarizeDobjFasten
	summarizeImplicitDobjProp = &summarizeImplicitDobjFasten
	summarizeExtraDobjProp = &summarizeExtraDobjFasten
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFasten;
modify ShowToAction
	summarizeDobjProp = &summarizeDobjShowTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjShowTo
	summarizeExtraDobjProp = &summarizeExtraDobjShowTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjShowTo;
modify PushUpAction
	summarizeDobjProp = &summarizeDobjPushUp
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushUp
	summarizeExtraDobjProp = &summarizeExtraDobjPushUp
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushUp;
modify TurnOnAction
	summarizeDobjProp = &summarizeDobjTurnOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjTurnOn
	summarizeExtraDobjProp = &summarizeExtraDobjTurnOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTurnOn;
modify VagueTravelAction
	summarizeDobjProp = &summarizeDobjVagueTravel
	summarizeImplicitDobjProp = &summarizeImplicitDobjVagueTravel
	summarizeExtraDobjProp = &summarizeExtraDobjVagueTravel
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjVagueTravel;
modify UnlockAction
	summarizeDobjProp = &summarizeDobjUnlock
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnlock
	summarizeExtraDobjProp = &summarizeExtraDobjUnlock
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnlock;
modify RemoveAction
	summarizeDobjProp = &summarizeDobjRemove
	summarizeImplicitDobjProp = &summarizeImplicitDobjRemove
	summarizeExtraDobjProp = &summarizeExtraDobjRemove
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjRemove;
modify TravelAction
	summarizeDobjProp = &summarizeDobjTravel
	summarizeImplicitDobjProp = &summarizeImplicitDobjTravel
	summarizeExtraDobjProp = &summarizeExtraDobjTravel
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTravel;
modify SwitchAction
	summarizeDobjProp = &summarizeDobjSwitch
	summarizeImplicitDobjProp = &summarizeImplicitDobjSwitch
	summarizeExtraDobjProp = &summarizeExtraDobjSwitch
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSwitch;
modify FollowAction
	summarizeDobjProp = &summarizeDobjFollow
	summarizeImplicitDobjProp = &summarizeImplicitDobjFollow
	summarizeExtraDobjProp = &summarizeExtraDobjFollow
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFollow;
modify LookThroughAction
	summarizeDobjProp = &summarizeDobjLookThrough
	summarizeImplicitDobjProp = &summarizeImplicitDobjLookThrough
	summarizeExtraDobjProp = &summarizeExtraDobjLookThrough
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLookThrough;
modify UnplugAction
	summarizeDobjProp = &summarizeDobjUnplug
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnplug
	summarizeExtraDobjProp = &summarizeExtraDobjUnplug
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnplug;
modify UnscrewWithAction
	summarizeDobjProp = &summarizeDobjUnscrewWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnscrewWith
	summarizeExtraDobjProp = &summarizeExtraDobjUnscrewWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnscrewWith;
modify ClimbUpAction
	summarizeDobjProp = &summarizeDobjClimbUp
	summarizeImplicitDobjProp = &summarizeImplicitDobjClimbUp
	summarizeExtraDobjProp = &summarizeExtraDobjClimbUp
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjClimbUp;
modify DigWithAction
	summarizeDobjProp = &summarizeDobjDigWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjDigWith
	summarizeExtraDobjProp = &summarizeExtraDobjDigWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDigWith;
modify PushTravelViaIobjAction
	summarizeDobjProp = &summarizeDobjPushTravelViaIobj
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelViaIobj
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelViaIobj
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelViaIobj;
modify JumpOffAction
	summarizeDobjProp = &summarizeDobjJumpOff
	summarizeImplicitDobjProp = &summarizeImplicitDobjJumpOff
	summarizeExtraDobjProp = &summarizeExtraDobjJumpOff
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjJumpOff;
modify StandOnAction
	summarizeDobjProp = &summarizeDobjStandOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjStandOn
	summarizeExtraDobjProp = &summarizeExtraDobjStandOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjStandOn;
modify PushTravelClimbUpAction
	summarizeDobjProp = &summarizeDobjPushTravelClimbUp
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelClimbUp
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelClimbUp
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelClimbUp;
modify PushAftAction
	summarizeDobjProp = &summarizeDobjPushAft
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushAft
	summarizeExtraDobjProp = &summarizeExtraDobjPushAft
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushAft;
modify TurnOffAction
	summarizeDobjProp = &summarizeDobjTurnOff
	summarizeImplicitDobjProp = &summarizeImplicitDobjTurnOff
	summarizeExtraDobjProp = &summarizeExtraDobjTurnOff
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTurnOff;
modify ExamineAction
	summarizeDobjProp = &summarizeDobjExamine
	summarizeImplicitDobjProp = &summarizeImplicitDobjExamine
	summarizeExtraDobjProp = &summarizeExtraDobjExamine
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjExamine;
modify CutWithAction
	summarizeDobjProp = &summarizeDobjCutWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjCutWith
	summarizeExtraDobjProp = &summarizeExtraDobjCutWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjCutWith;
modify GoodbyeAction
	summarizeDobjProp = &summarizeDobjGoodbye
	summarizeImplicitDobjProp = &summarizeImplicitDobjGoodbye
	summarizeExtraDobjProp = &summarizeExtraDobjGoodbye
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGoodbye;
modify ThrowAtAction
	summarizeDobjProp = &summarizeDobjThrowAt
	summarizeImplicitDobjProp = &summarizeImplicitDobjThrowAt
	summarizeExtraDobjProp = &summarizeExtraDobjThrowAt
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjThrowAt;
modify NoteDarknessAction
	summarizeDobjProp = &summarizeDobjNoteDarkness
	summarizeImplicitDobjProp = &summarizeImplicitDobjNoteDarkness
	summarizeExtraDobjProp = &summarizeExtraDobjNoteDarkness
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjNoteDarkness;
modify ThrowToAction
	summarizeDobjProp = &summarizeDobjThrowTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjThrowTo
	summarizeExtraDobjProp = &summarizeExtraDobjThrowTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjThrowTo;
modify UnfastenFromAction
	summarizeDobjProp = &summarizeDobjUnfastenFrom
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnfastenFrom
	summarizeExtraDobjProp = &summarizeExtraDobjUnfastenFrom
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnfastenFrom;
modify PushOutAction
	summarizeDobjProp = &summarizeDobjPushOut
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushOut
	summarizeExtraDobjProp = &summarizeExtraDobjPushOut
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushOut;
modify UnscrewAction
	summarizeDobjProp = &summarizeDobjUnscrew
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnscrew
	summarizeExtraDobjProp = &summarizeExtraDobjUnscrew
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnscrew;
modify ConsultAction
	summarizeDobjProp = &summarizeDobjConsult
	summarizeImplicitDobjProp = &summarizeImplicitDobjConsult
	summarizeExtraDobjProp = &summarizeExtraDobjConsult
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjConsult;
modify PushTravelThroughAction
	summarizeDobjProp = &summarizeDobjPushTravelThrough
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelThrough
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelThrough
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelThrough;
modify GetOffOfAction
	summarizeDobjProp = &summarizeDobjGetOffOf
	summarizeImplicitDobjProp = &summarizeImplicitDobjGetOffOf
	summarizeExtraDobjProp = &summarizeExtraDobjGetOffOf
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGetOffOf;
modify JumpOffIAction
	summarizeDobjProp = &summarizeDobjJumpOffI
	summarizeImplicitDobjProp = &summarizeImplicitDobjJumpOffI
	summarizeExtraDobjProp = &summarizeExtraDobjJumpOffI
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjJumpOffI;
modify GetOutOfAction
	summarizeDobjProp = &summarizeDobjGetOutOf
	summarizeImplicitDobjProp = &summarizeImplicitDobjGetOutOf
	summarizeExtraDobjProp = &summarizeExtraDobjGetOutOf
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGetOutOf;
modify AttachToAction
	summarizeDobjProp = &summarizeDobjAttachTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjAttachTo
	summarizeExtraDobjProp = &summarizeExtraDobjAttachTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjAttachTo;
modify TakeFromAction
	summarizeDobjProp = &summarizeDobjTakeFrom
	summarizeImplicitDobjProp = &summarizeImplicitDobjTakeFrom
	summarizeExtraDobjProp = &summarizeExtraDobjTakeFrom
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTakeFrom;
modify PushTravelGetOutOfAction
	summarizeDobjProp = &summarizeDobjPushTravelGetOutOf
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelGetOutOf
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelGetOutOf
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelGetOutOf;
modify FastenToAction
	summarizeDobjProp = &summarizeDobjFastenTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjFastenTo
	summarizeExtraDobjProp = &summarizeExtraDobjFastenTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFastenTo;
modify LockWithAction
	summarizeDobjProp = &summarizeDobjLockWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjLockWith
	summarizeExtraDobjProp = &summarizeExtraDobjLockWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLockWith;
modify PushForeAction
	summarizeDobjProp = &summarizeDobjPushFore
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushFore
	summarizeExtraDobjProp = &summarizeExtraDobjPushFore
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushFore;
modify PushTravelDirAction
	summarizeDobjProp = &summarizeDobjPushTravelDir
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelDir
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelDir
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelDir;
modify PushEastAction
	summarizeDobjProp = &summarizeDobjPushEast
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushEast
	summarizeExtraDobjProp = &summarizeExtraDobjPushEast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushEast;
modify ListenToAction
	summarizeDobjProp = &summarizeDobjListenTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjListenTo
	summarizeExtraDobjProp = &summarizeExtraDobjListenTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjListenTo;
modify PlugIntoAction
	summarizeDobjProp = &summarizeDobjPlugInto
	summarizeImplicitDobjProp = &summarizeImplicitDobjPlugInto
	summarizeExtraDobjProp = &summarizeExtraDobjPlugInto
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPlugInto;
modify ThrowDirAction
	summarizeDobjProp = &summarizeDobjThrowDir
	summarizeImplicitDobjProp = &summarizeImplicitDobjThrowDir
	summarizeExtraDobjProp = &summarizeExtraDobjThrowDir
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjThrowDir;
modify MoveWithAction
	summarizeDobjProp = &summarizeDobjMoveWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjMoveWith
	summarizeExtraDobjProp = &summarizeExtraDobjMoveWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjMoveWith;
modify BurnWithAction
	summarizeDobjProp = &summarizeDobjBurnWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjBurnWith
	summarizeExtraDobjProp = &summarizeExtraDobjBurnWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjBurnWith;
modify PutUnderAction
	summarizeDobjProp = &summarizeDobjPutUnder
	summarizeImplicitDobjProp = &summarizeImplicitDobjPutUnder
	summarizeExtraDobjProp = &summarizeExtraDobjPutUnder
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPutUnder;
modify SmellImplicitAction
	summarizeDobjProp = &summarizeDobjSmellImplicit
	summarizeImplicitDobjProp = &summarizeImplicitDobjSmellImplicit
	summarizeExtraDobjProp = &summarizeExtraDobjSmellImplicit
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSmellImplicit;
modify JumpOverAction
	summarizeDobjProp = &summarizeDobjJumpOver
	summarizeImplicitDobjProp = &summarizeImplicitDobjJumpOver
	summarizeExtraDobjProp = &summarizeExtraDobjJumpOver
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjJumpOver;
modify PushDownAction
	summarizeDobjProp = &summarizeDobjPushDown
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushDown
	summarizeExtraDobjProp = &summarizeExtraDobjPushDown
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushDown;
modify SenseImplicitAction
	summarizeDobjProp = &summarizeDobjSenseImplicit
	summarizeImplicitDobjProp = &summarizeImplicitDobjSenseImplicit
	summarizeExtraDobjProp = &summarizeExtraDobjSenseImplicit
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSenseImplicit;
modify PourIntoAction
	summarizeDobjProp = &summarizeDobjPourInto
	summarizeImplicitDobjProp = &summarizeImplicitDobjPourInto
	summarizeExtraDobjProp = &summarizeExtraDobjPourInto
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPourInto;
modify PushStarboardAction
	summarizeDobjProp = &summarizeDobjPushStarboard
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushStarboard
	summarizeExtraDobjProp = &summarizeExtraDobjPushStarboard
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushStarboard;
modify PushWestAction
	summarizeDobjProp = &summarizeDobjPushWest
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushWest
	summarizeExtraDobjProp = &summarizeExtraDobjPushWest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushWest;
modify UnfastenAction
	summarizeDobjProp = &summarizeDobjUnfasten
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnfasten
	summarizeExtraDobjProp = &summarizeExtraDobjUnfasten
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnfasten;
modify TurnWithAction
	summarizeDobjProp = &summarizeDobjTurnWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjTurnWith
	summarizeExtraDobjProp = &summarizeExtraDobjTurnWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTurnWith;
modify PushPortAction
	summarizeDobjProp = &summarizeDobjPushPort
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushPort
	summarizeExtraDobjProp = &summarizeExtraDobjPushPort
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushPort;
modify PourOntoAction
	summarizeDobjProp = &summarizeDobjPourOnto
	summarizeImplicitDobjProp = &summarizeImplicitDobjPourOnto
	summarizeExtraDobjProp = &summarizeExtraDobjPourOnto
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPourOnto;
modify InventoryWideAction
	summarizeDobjProp = &summarizeDobjInventoryWide
	summarizeImplicitDobjProp = &summarizeImplicitDobjInventoryWide
	summarizeExtraDobjProp = &summarizeExtraDobjInventoryWide
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjInventoryWide;
modify PushNortheastAction
	summarizeDobjProp = &summarizeDobjPushNortheast
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushNortheast
	summarizeExtraDobjProp = &summarizeExtraDobjPushNortheast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushNortheast;
modify InventoryTallAction
	summarizeDobjProp = &summarizeDobjInventoryTall
	summarizeImplicitDobjProp = &summarizeImplicitDobjInventoryTall
	summarizeExtraDobjProp = &summarizeExtraDobjInventoryTall
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjInventoryTall;
modify PushSoutheastAction
	summarizeDobjProp = &summarizeDobjPushSoutheast
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushSoutheast
	summarizeExtraDobjProp = &summarizeExtraDobjPushSoutheast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushSoutheast;
modify PushNorthwestAction
	summarizeDobjProp = &summarizeDobjPushNorthwest
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushNorthwest
	summarizeExtraDobjProp = &summarizeExtraDobjPushNorthwest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushNorthwest;
modify PushSouthwestAction
	summarizeDobjProp = &summarizeDobjPushSouthwest
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushSouthwest
	summarizeExtraDobjProp = &summarizeExtraDobjPushSouthwest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushSouthwest;
modify ReadAction
	summarizeDobjProp = &summarizeDobjRead
	summarizeImplicitDobjProp = &summarizeImplicitDobjRead
	summarizeExtraDobjProp = &summarizeExtraDobjRead
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjRead;
modify FeelAction
	summarizeDobjProp = &summarizeDobjFeel
	summarizeImplicitDobjProp = &summarizeImplicitDobjFeel
	summarizeExtraDobjProp = &summarizeExtraDobjFeel
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFeel;
modify DoffAction
	summarizeDobjProp = &summarizeDobjDoff
	summarizeImplicitDobjProp = &summarizeImplicitDobjDoff
	summarizeExtraDobjProp = &summarizeExtraDobjDoff
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDoff;
modify ClimbDownAction
	summarizeDobjProp = &summarizeDobjClimbDown
	summarizeImplicitDobjProp = &summarizeImplicitDobjClimbDown
	summarizeExtraDobjProp = &summarizeExtraDobjClimbDown
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjClimbDown;
modify CleanWithAction
	summarizeDobjProp = &summarizeDobjCleanWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjCleanWith
	summarizeExtraDobjProp = &summarizeExtraDobjCleanWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjCleanWith;
modify PutBehindAction
	summarizeDobjProp = &summarizeDobjPutBehind
	summarizeImplicitDobjProp = &summarizeImplicitDobjPutBehind
	summarizeExtraDobjProp = &summarizeExtraDobjPutBehind
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPutBehind;
modify TakeAction
	summarizeDobjProp = &summarizeDobjTake
	summarizeImplicitDobjProp = &summarizeImplicitDobjTake
	summarizeExtraDobjProp = &summarizeExtraDobjTake
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTake;
modify LockAction
	summarizeDobjProp = &summarizeDobjLock
	summarizeImplicitDobjProp = &summarizeImplicitDobjLock
	summarizeExtraDobjProp = &summarizeExtraDobjLock
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLock;
modify FlipAction
	summarizeDobjProp = &summarizeDobjFlip
	summarizeImplicitDobjProp = &summarizeImplicitDobjFlip
	summarizeExtraDobjProp = &summarizeExtraDobjFlip
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFlip;
modify ForeAction
	summarizeDobjProp = &summarizeDobjFore
	summarizeImplicitDobjProp = &summarizeImplicitDobjFore
	summarizeExtraDobjProp = &summarizeExtraDobjFore
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFore;
modify TravelDirAction
	summarizeDobjProp = &summarizeDobjTravelDir
	summarizeImplicitDobjProp = &summarizeImplicitDobjTravelDir
	summarizeExtraDobjProp = &summarizeExtraDobjTravelDir
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTravelDir;
modify EastAction
	summarizeDobjProp = &summarizeDobjEast
	summarizeImplicitDobjProp = &summarizeImplicitDobjEast
	summarizeExtraDobjProp = &summarizeExtraDobjEast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjEast;
modify PushTravelClimbDownAction
	summarizeDobjProp = &summarizeDobjPushTravelClimbDown
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelClimbDown
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelClimbDown
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelClimbDown;
modify TravelViaAction
	summarizeDobjProp = &summarizeDobjTravelVia
	summarizeImplicitDobjProp = &summarizeImplicitDobjTravelVia
	summarizeExtraDobjProp = &summarizeExtraDobjTravelVia
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTravelVia;
modify WearAction
	summarizeDobjProp = &summarizeDobjWear
	summarizeImplicitDobjProp = &summarizeImplicitDobjWear
	summarizeExtraDobjProp = &summarizeExtraDobjWear
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjWear;
modify OpenAction
	summarizeDobjProp = &summarizeDobjOpen
	summarizeImplicitDobjProp = &summarizeImplicitDobjOpen
	summarizeExtraDobjProp = &summarizeExtraDobjOpen
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjOpen;
modify LookUnderAction
	summarizeDobjProp = &summarizeDobjLookUnder
	summarizeImplicitDobjProp = &summarizeImplicitDobjLookUnder
	summarizeExtraDobjProp = &summarizeExtraDobjLookUnder
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLookUnder;
modify WaitAction
	summarizeDobjProp = &summarizeDobjWait
	summarizeImplicitDobjProp = &summarizeImplicitDobjWait
	summarizeExtraDobjProp = &summarizeExtraDobjWait
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjWait;
modify LookAction
	summarizeDobjProp = &summarizeDobjLook
	summarizeImplicitDobjProp = &summarizeImplicitDobjLook
	summarizeExtraDobjProp = &summarizeExtraDobjLook
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLook;
modify DropAction
	summarizeDobjProp = &summarizeDobjDrop
	summarizeImplicitDobjProp = &summarizeImplicitDobjDrop
	summarizeExtraDobjProp = &summarizeExtraDobjDrop
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDrop;
modify YellAction
	summarizeDobjProp = &summarizeDobjYell
	summarizeImplicitDobjProp = &summarizeImplicitDobjYell
	summarizeExtraDobjProp = &summarizeExtraDobjYell
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjYell;
modify MoveAction
	summarizeDobjProp = &summarizeDobjMove
	summarizeImplicitDobjProp = &summarizeImplicitDobjMove
	summarizeExtraDobjProp = &summarizeExtraDobjMove
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjMove;
modify BurnAction
	summarizeDobjProp = &summarizeDobjBurn
	summarizeImplicitDobjProp = &summarizeImplicitDobjBurn
	summarizeExtraDobjProp = &summarizeExtraDobjBurn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjBurn;
modify GoThroughAction
	summarizeDobjProp = &summarizeDobjGoThrough
	summarizeImplicitDobjProp = &summarizeImplicitDobjGoThrough
	summarizeExtraDobjProp = &summarizeExtraDobjGoThrough
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGoThrough;
modify DownAction
	summarizeDobjProp = &summarizeDobjDown
	summarizeImplicitDobjProp = &summarizeImplicitDobjDown
	summarizeExtraDobjProp = &summarizeExtraDobjDown
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDown;
modify KissAction
	summarizeDobjProp = &summarizeDobjKiss
	summarizeImplicitDobjProp = &summarizeImplicitDobjKiss
	summarizeExtraDobjProp = &summarizeExtraDobjKiss
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjKiss;
modify JumpAction
	summarizeDobjProp = &summarizeDobjJump
	summarizeImplicitDobjProp = &summarizeImplicitDobjJump
	summarizeExtraDobjProp = &summarizeExtraDobjJump
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjJump;
modify PullAction
	summarizeDobjProp = &summarizeDobjPull
	summarizeImplicitDobjProp = &summarizeImplicitDobjPull
	summarizeExtraDobjProp = &summarizeExtraDobjPull
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPull;
modify PushAction
	summarizeDobjProp = &summarizeDobjPush
	summarizeImplicitDobjProp = &summarizeImplicitDobjPush
	summarizeExtraDobjProp = &summarizeExtraDobjPush
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPush;
modify ScrewWithAction
	summarizeDobjProp = &summarizeDobjScrewWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjScrewWith
	summarizeExtraDobjProp = &summarizeExtraDobjScrewWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjScrewWith;
modify EventAction
	summarizeDobjProp = &summarizeDobjEvent
	summarizeImplicitDobjProp = &summarizeImplicitDobjEvent
	summarizeExtraDobjProp = &summarizeExtraDobjEvent
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjEvent;
modify CommandActorAction
	summarizeDobjProp = &summarizeDobjCommandActor
	summarizeImplicitDobjProp = &summarizeImplicitDobjCommandActor
	summarizeExtraDobjProp = &summarizeExtraDobjCommandActor
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjCommandActor;
modify StrikeAction
	summarizeDobjProp = &summarizeDobjStrike
	summarizeImplicitDobjProp = &summarizeImplicitDobjStrike
	summarizeExtraDobjProp = &summarizeExtraDobjStrike
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjStrike;
