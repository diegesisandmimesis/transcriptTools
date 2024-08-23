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
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjStarboard
	whenSummarizedDobjProp = &whenSummarizedDobjStarboard;
modify WestAction
	summarizeDobjProp = &summarizeDobjWest
	summarizeImplicitDobjProp = &summarizeImplicitDobjWest
	summarizeExtraDobjProp = &summarizeExtraDobjWest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjWest
	whenSummarizedDobjProp = &whenSummarizedDobjWest;
modify PortAction
	summarizeDobjProp = &summarizeDobjPort
	summarizeImplicitDobjProp = &summarizeImplicitDobjPort
	summarizeExtraDobjProp = &summarizeExtraDobjPort
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPort
	whenSummarizedDobjProp = &whenSummarizedDobjPort;
modify PourAction
	summarizeDobjProp = &summarizeDobjPour
	summarizeImplicitDobjProp = &summarizeImplicitDobjPour
	summarizeExtraDobjProp = &summarizeExtraDobjPour
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPour
	whenSummarizedDobjProp = &whenSummarizedDobjPour;
modify TurnAction
	summarizeDobjProp = &summarizeDobjTurn
	summarizeImplicitDobjProp = &summarizeImplicitDobjTurn
	summarizeExtraDobjProp = &summarizeExtraDobjTurn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTurn
	whenSummarizedDobjProp = &whenSummarizedDobjTurn;
modify ListenImplicitAction
	summarizeDobjProp = &summarizeDobjListenImplicit
	summarizeImplicitDobjProp = &summarizeImplicitDobjListenImplicit
	summarizeExtraDobjProp = &summarizeExtraDobjListenImplicit
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjListenImplicit
	whenSummarizedDobjProp = &whenSummarizedDobjListenImplicit;
modify PushNorthAction
	summarizeDobjProp = &summarizeDobjPushNorth
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushNorth
	summarizeExtraDobjProp = &summarizeExtraDobjPushNorth
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushNorth
	whenSummarizedDobjProp = &whenSummarizedDobjPushNorth;
modify PushSouthAction
	summarizeDobjProp = &summarizeDobjPushSouth
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushSouth
	summarizeExtraDobjProp = &summarizeExtraDobjPushSouth
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushSouth
	whenSummarizedDobjProp = &whenSummarizedDobjPushSouth;
modify NortheastAction
	summarizeDobjProp = &summarizeDobjNortheast
	summarizeImplicitDobjProp = &summarizeImplicitDobjNortheast
	summarizeExtraDobjProp = &summarizeExtraDobjNortheast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjNortheast
	whenSummarizedDobjProp = &whenSummarizedDobjNortheast;
modify SoutheastAction
	summarizeDobjProp = &summarizeDobjSoutheast
	summarizeImplicitDobjProp = &summarizeImplicitDobjSoutheast
	summarizeExtraDobjProp = &summarizeExtraDobjSoutheast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSoutheast
	whenSummarizedDobjProp = &whenSummarizedDobjSoutheast;
modify InventoryAction
	summarizeDobjProp = &summarizeDobjInventory
	summarizeImplicitDobjProp = &summarizeImplicitDobjInventory
	summarizeExtraDobjProp = &summarizeExtraDobjInventory
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjInventory
	whenSummarizedDobjProp = &whenSummarizedDobjInventory;
modify NorthwestAction
	summarizeDobjProp = &summarizeDobjNorthwest
	summarizeImplicitDobjProp = &summarizeImplicitDobjNorthwest
	summarizeExtraDobjProp = &summarizeExtraDobjNorthwest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjNorthwest
	whenSummarizedDobjProp = &whenSummarizedDobjNorthwest;
modify SouthwestAction
	summarizeDobjProp = &summarizeDobjSouthwest
	summarizeImplicitDobjProp = &summarizeImplicitDobjSouthwest
	summarizeExtraDobjProp = &summarizeExtraDobjSouthwest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSouthwest
	whenSummarizedDobjProp = &whenSummarizedDobjSouthwest;
modify LieOnAction
	summarizeDobjProp = &summarizeDobjLieOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjLieOn
	summarizeExtraDobjProp = &summarizeExtraDobjLieOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLieOn
	whenSummarizedDobjProp = &whenSummarizedDobjLieOn;
modify DetachFromAction
	summarizeDobjProp = &summarizeDobjDetachFrom
	summarizeImplicitDobjProp = &summarizeImplicitDobjDetachFrom
	summarizeExtraDobjProp = &summarizeExtraDobjDetachFrom
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDetachFrom
	whenSummarizedDobjProp = &whenSummarizedDobjDetachFrom;
modify LookBehindAction
	summarizeDobjProp = &summarizeDobjLookBehind
	summarizeImplicitDobjProp = &summarizeImplicitDobjLookBehind
	summarizeExtraDobjProp = &summarizeExtraDobjLookBehind
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLookBehind
	whenSummarizedDobjProp = &whenSummarizedDobjLookBehind;
modify CleanAction
	summarizeDobjProp = &summarizeDobjClean
	summarizeImplicitDobjProp = &summarizeImplicitDobjClean
	summarizeExtraDobjProp = &summarizeExtraDobjClean
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjClean
	whenSummarizedDobjProp = &whenSummarizedDobjClean;
modify BreakAction
	summarizeDobjProp = &summarizeDobjBreak
	summarizeImplicitDobjProp = &summarizeImplicitDobjBreak
	summarizeExtraDobjProp = &summarizeExtraDobjBreak
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjBreak
	whenSummarizedDobjProp = &whenSummarizedDobjBreak;
modify DebugAction
	summarizeDobjProp = &summarizeDobjDebug
	summarizeImplicitDobjProp = &summarizeImplicitDobjDebug
	summarizeExtraDobjProp = &summarizeExtraDobjDebug
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDebug
	whenSummarizedDobjProp = &whenSummarizedDobjDebug;
modify ClimbAction
	summarizeDobjProp = &summarizeDobjClimb
	summarizeImplicitDobjProp = &summarizeImplicitDobjClimb
	summarizeExtraDobjProp = &summarizeExtraDobjClimb
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjClimb
	whenSummarizedDobjProp = &whenSummarizedDobjClimb;
modify BoardAction
	summarizeDobjProp = &summarizeDobjBoard
	summarizeImplicitDobjProp = &summarizeImplicitDobjBoard
	summarizeExtraDobjProp = &summarizeExtraDobjBoard
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjBoard
	whenSummarizedDobjProp = &whenSummarizedDobjBoard;
modify OopsIAction
	summarizeDobjProp = &summarizeDobjOopsI
	summarizeImplicitDobjProp = &summarizeImplicitDobjOopsI
	summarizeExtraDobjProp = &summarizeExtraDobjOopsI
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjOopsI
	whenSummarizedDobjProp = &whenSummarizedDobjOopsI;
modify SitOnAction
	summarizeDobjProp = &summarizeDobjSitOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjSitOn
	summarizeExtraDobjProp = &summarizeExtraDobjSitOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSitOn
	whenSummarizedDobjProp = &whenSummarizedDobjSitOn;
modify PutInAction
	summarizeDobjProp = &summarizeDobjPutIn
	summarizeImplicitDobjProp = &summarizeImplicitDobjPutIn
	summarizeExtraDobjProp = &summarizeExtraDobjPutIn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPutIn
	whenSummarizedDobjProp = &whenSummarizedDobjPutIn;
modify HelloAction
	summarizeDobjProp = &summarizeDobjHello
	summarizeImplicitDobjProp = &summarizeImplicitDobjHello
	summarizeExtraDobjProp = &summarizeExtraDobjHello
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjHello
	whenSummarizedDobjProp = &whenSummarizedDobjHello;
modify AttackWithAction
	summarizeDobjProp = &summarizeDobjAttackWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjAttackWith
	summarizeExtraDobjProp = &summarizeExtraDobjAttackWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjAttackWith
	whenSummarizedDobjProp = &whenSummarizedDobjAttackWith;
modify PutOnAction
	summarizeDobjProp = &summarizeDobjPutOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjPutOn
	summarizeExtraDobjProp = &summarizeExtraDobjPutOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPutOn
	whenSummarizedDobjProp = &whenSummarizedDobjPutOn;
modify CloseAction
	summarizeDobjProp = &summarizeDobjClose
	summarizeImplicitDobjProp = &summarizeImplicitDobjClose
	summarizeExtraDobjProp = &summarizeExtraDobjClose
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjClose
	whenSummarizedDobjProp = &whenSummarizedDobjClose;
modify LightAction
	summarizeDobjProp = &summarizeDobjLight
	summarizeImplicitDobjProp = &summarizeImplicitDobjLight
	summarizeExtraDobjProp = &summarizeExtraDobjLight
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLight
	whenSummarizedDobjProp = &whenSummarizedDobjLight;
modify DrinkAction
	summarizeDobjProp = &summarizeDobjDrink
	summarizeImplicitDobjProp = &summarizeImplicitDobjDrink
	summarizeExtraDobjProp = &summarizeExtraDobjDrink
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDrink
	whenSummarizedDobjProp = &whenSummarizedDobjDrink;
modify SleepAction
	summarizeDobjProp = &summarizeDobjSleep
	summarizeImplicitDobjProp = &summarizeImplicitDobjSleep
	summarizeExtraDobjProp = &summarizeExtraDobjSleep
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSleep
	whenSummarizedDobjProp = &whenSummarizedDobjSleep;
modify StandAction
	summarizeDobjProp = &summarizeDobjStand
	summarizeImplicitDobjProp = &summarizeImplicitDobjStand
	summarizeExtraDobjProp = &summarizeExtraDobjStand
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjStand
	whenSummarizedDobjProp = &whenSummarizedDobjStand;
modify SmellAction
	summarizeDobjProp = &summarizeDobjSmell
	summarizeImplicitDobjProp = &summarizeImplicitDobjSmell
	summarizeExtraDobjProp = &summarizeExtraDobjSmell
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSmell
	whenSummarizedDobjProp = &whenSummarizedDobjSmell;
modify EnterAction
	summarizeDobjProp = &summarizeDobjEnter
	summarizeImplicitDobjProp = &summarizeImplicitDobjEnter
	summarizeExtraDobjProp = &summarizeExtraDobjEnter
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjEnter
	whenSummarizedDobjProp = &whenSummarizedDobjEnter;
modify TasteAction
	summarizeDobjProp = &summarizeDobjTaste
	summarizeImplicitDobjProp = &summarizeImplicitDobjTaste
	summarizeExtraDobjProp = &summarizeExtraDobjTaste
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTaste
	whenSummarizedDobjProp = &whenSummarizedDobjTaste;
modify ScrewAction
	summarizeDobjProp = &summarizeDobjScrew
	summarizeImplicitDobjProp = &summarizeImplicitDobjScrew
	summarizeExtraDobjProp = &summarizeExtraDobjScrew
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjScrew
	whenSummarizedDobjProp = &whenSummarizedDobjScrew;
modify UnlockWithAction
	summarizeDobjProp = &summarizeDobjUnlockWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnlockWith
	summarizeExtraDobjProp = &summarizeExtraDobjUnlockWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnlockWith
	whenSummarizedDobjProp = &whenSummarizedDobjUnlockWith;
modify NorthAction
	summarizeDobjProp = &summarizeDobjNorth
	summarizeImplicitDobjProp = &summarizeImplicitDobjNorth
	summarizeExtraDobjProp = &summarizeExtraDobjNorth
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjNorth
	whenSummarizedDobjProp = &whenSummarizedDobjNorth;
modify PushTravelEnterAction
	summarizeDobjProp = &summarizeDobjPushTravelEnter
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelEnter
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelEnter
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelEnter
	whenSummarizedDobjProp = &whenSummarizedDobjPushTravelEnter;
modify ExitsAction
	summarizeDobjProp = &summarizeDobjExits
	summarizeImplicitDobjProp = &summarizeImplicitDobjExits
	summarizeExtraDobjProp = &summarizeExtraDobjExits
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjExits
	whenSummarizedDobjProp = &whenSummarizedDobjExits;
modify PushTravelAction
	summarizeDobjProp = &summarizeDobjPushTravel
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravel
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravel
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravel
	whenSummarizedDobjProp = &whenSummarizedDobjPushTravel;
modify UnplugFromAction
	summarizeDobjProp = &summarizeDobjUnplugFrom
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnplugFrom
	summarizeExtraDobjProp = &summarizeExtraDobjUnplugFrom
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnplugFrom
	whenSummarizedDobjProp = &whenSummarizedDobjUnplugFrom;
modify SouthAction
	summarizeDobjProp = &summarizeDobjSouth
	summarizeImplicitDobjProp = &summarizeImplicitDobjSouth
	summarizeExtraDobjProp = &summarizeExtraDobjSouth
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSouth
	whenSummarizedDobjProp = &whenSummarizedDobjSouth;
modify ThrowAction
	summarizeDobjProp = &summarizeDobjThrow
	summarizeImplicitDobjProp = &summarizeImplicitDobjThrow
	summarizeExtraDobjProp = &summarizeExtraDobjThrow
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjThrow
	whenSummarizedDobjProp = &whenSummarizedDobjThrow;
modify GoBackAction
	summarizeDobjProp = &summarizeDobjGoBack
	summarizeImplicitDobjProp = &summarizeImplicitDobjGoBack
	summarizeExtraDobjProp = &summarizeExtraDobjGoBack
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGoBack
	whenSummarizedDobjProp = &whenSummarizedDobjGoBack;
modify ExtinguishAction
	summarizeDobjProp = &summarizeDobjExtinguish
	summarizeImplicitDobjProp = &summarizeImplicitDobjExtinguish
	summarizeExtraDobjProp = &summarizeExtraDobjExtinguish
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjExtinguish
	whenSummarizedDobjProp = &whenSummarizedDobjExtinguish;
modify DetachAction
	summarizeDobjProp = &summarizeDobjDetach
	summarizeImplicitDobjProp = &summarizeImplicitDobjDetach
	summarizeExtraDobjProp = &summarizeExtraDobjDetach
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDetach
	whenSummarizedDobjProp = &whenSummarizedDobjDetach;
modify LookInAction
	summarizeDobjProp = &summarizeDobjLookIn
	summarizeImplicitDobjProp = &summarizeImplicitDobjLookIn
	summarizeExtraDobjProp = &summarizeExtraDobjLookIn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLookIn
	whenSummarizedDobjProp = &whenSummarizedDobjLookIn;
modify GiveToAction
	summarizeDobjProp = &summarizeDobjGiveTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjGiveTo
	summarizeExtraDobjProp = &summarizeExtraDobjGiveTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGiveTo
	whenSummarizedDobjProp = &whenSummarizedDobjGiveTo;
modify TalkToAction
	summarizeDobjProp = &summarizeDobjTalkTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjTalkTo
	summarizeExtraDobjProp = &summarizeExtraDobjTalkTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTalkTo
	whenSummarizedDobjProp = &whenSummarizedDobjTalkTo;
modify PlugInAction
	summarizeDobjProp = &summarizeDobjPlugIn
	summarizeImplicitDobjProp = &summarizeImplicitDobjPlugIn
	summarizeExtraDobjProp = &summarizeExtraDobjPlugIn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPlugIn
	whenSummarizedDobjProp = &whenSummarizedDobjPlugIn;
modify SearchAction
	summarizeDobjProp = &summarizeDobjSearch
	summarizeImplicitDobjProp = &summarizeImplicitDobjSearch
	summarizeExtraDobjProp = &summarizeExtraDobjSearch
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSearch
	whenSummarizedDobjProp = &whenSummarizedDobjSearch;
modify PushInAction
	summarizeDobjProp = &summarizeDobjPushIn
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushIn
	summarizeExtraDobjProp = &summarizeExtraDobjPushIn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushIn
	whenSummarizedDobjProp = &whenSummarizedDobjPushIn;
modify AttackAction
	summarizeDobjProp = &summarizeDobjAttack
	summarizeImplicitDobjProp = &summarizeImplicitDobjAttack
	summarizeExtraDobjProp = &summarizeExtraDobjAttack
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjAttack
	whenSummarizedDobjProp = &whenSummarizedDobjAttack;
modify GetOutAction
	summarizeDobjProp = &summarizeDobjGetOut
	summarizeImplicitDobjProp = &summarizeImplicitDobjGetOut
	summarizeExtraDobjProp = &summarizeExtraDobjGetOut
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGetOut
	whenSummarizedDobjProp = &whenSummarizedDobjGetOut;
modify MoveToAction
	summarizeDobjProp = &summarizeDobjMoveTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjMoveTo
	summarizeExtraDobjProp = &summarizeExtraDobjMoveTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjMoveTo
	whenSummarizedDobjProp = &whenSummarizedDobjMoveTo;
modify TypeOnAction
	summarizeDobjProp = &summarizeDobjTypeOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjTypeOn
	summarizeExtraDobjProp = &summarizeExtraDobjTypeOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTypeOn
	whenSummarizedDobjProp = &whenSummarizedDobjTypeOn;
modify FastenAction
	summarizeDobjProp = &summarizeDobjFasten
	summarizeImplicitDobjProp = &summarizeImplicitDobjFasten
	summarizeExtraDobjProp = &summarizeExtraDobjFasten
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFasten
	whenSummarizedDobjProp = &whenSummarizedDobjFasten;
modify ShowToAction
	summarizeDobjProp = &summarizeDobjShowTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjShowTo
	summarizeExtraDobjProp = &summarizeExtraDobjShowTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjShowTo
	whenSummarizedDobjProp = &whenSummarizedDobjShowTo;
modify PushUpAction
	summarizeDobjProp = &summarizeDobjPushUp
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushUp
	summarizeExtraDobjProp = &summarizeExtraDobjPushUp
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushUp
	whenSummarizedDobjProp = &whenSummarizedDobjPushUp;
modify TurnOnAction
	summarizeDobjProp = &summarizeDobjTurnOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjTurnOn
	summarizeExtraDobjProp = &summarizeExtraDobjTurnOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTurnOn
	whenSummarizedDobjProp = &whenSummarizedDobjTurnOn;
modify VagueTravelAction
	summarizeDobjProp = &summarizeDobjVagueTravel
	summarizeImplicitDobjProp = &summarizeImplicitDobjVagueTravel
	summarizeExtraDobjProp = &summarizeExtraDobjVagueTravel
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjVagueTravel
	whenSummarizedDobjProp = &whenSummarizedDobjVagueTravel;
modify UnlockAction
	summarizeDobjProp = &summarizeDobjUnlock
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnlock
	summarizeExtraDobjProp = &summarizeExtraDobjUnlock
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnlock
	whenSummarizedDobjProp = &whenSummarizedDobjUnlock;
modify RemoveAction
	summarizeDobjProp = &summarizeDobjRemove
	summarizeImplicitDobjProp = &summarizeImplicitDobjRemove
	summarizeExtraDobjProp = &summarizeExtraDobjRemove
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjRemove
	whenSummarizedDobjProp = &whenSummarizedDobjRemove;
modify TravelAction
	summarizeDobjProp = &summarizeDobjTravel
	summarizeImplicitDobjProp = &summarizeImplicitDobjTravel
	summarizeExtraDobjProp = &summarizeExtraDobjTravel
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTravel
	whenSummarizedDobjProp = &whenSummarizedDobjTravel;
modify SwitchAction
	summarizeDobjProp = &summarizeDobjSwitch
	summarizeImplicitDobjProp = &summarizeImplicitDobjSwitch
	summarizeExtraDobjProp = &summarizeExtraDobjSwitch
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSwitch
	whenSummarizedDobjProp = &whenSummarizedDobjSwitch;
modify FollowAction
	summarizeDobjProp = &summarizeDobjFollow
	summarizeImplicitDobjProp = &summarizeImplicitDobjFollow
	summarizeExtraDobjProp = &summarizeExtraDobjFollow
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFollow
	whenSummarizedDobjProp = &whenSummarizedDobjFollow;
modify LookThroughAction
	summarizeDobjProp = &summarizeDobjLookThrough
	summarizeImplicitDobjProp = &summarizeImplicitDobjLookThrough
	summarizeExtraDobjProp = &summarizeExtraDobjLookThrough
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLookThrough
	whenSummarizedDobjProp = &whenSummarizedDobjLookThrough;
modify UnplugAction
	summarizeDobjProp = &summarizeDobjUnplug
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnplug
	summarizeExtraDobjProp = &summarizeExtraDobjUnplug
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnplug
	whenSummarizedDobjProp = &whenSummarizedDobjUnplug;
modify UnscrewWithAction
	summarizeDobjProp = &summarizeDobjUnscrewWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnscrewWith
	summarizeExtraDobjProp = &summarizeExtraDobjUnscrewWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnscrewWith
	whenSummarizedDobjProp = &whenSummarizedDobjUnscrewWith;
modify ClimbUpAction
	summarizeDobjProp = &summarizeDobjClimbUp
	summarizeImplicitDobjProp = &summarizeImplicitDobjClimbUp
	summarizeExtraDobjProp = &summarizeExtraDobjClimbUp
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjClimbUp
	whenSummarizedDobjProp = &whenSummarizedDobjClimbUp;
modify DigWithAction
	summarizeDobjProp = &summarizeDobjDigWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjDigWith
	summarizeExtraDobjProp = &summarizeExtraDobjDigWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDigWith
	whenSummarizedDobjProp = &whenSummarizedDobjDigWith;
modify PushTravelViaIobjAction
	summarizeDobjProp = &summarizeDobjPushTravelViaIobj
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelViaIobj
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelViaIobj
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelViaIobj
	whenSummarizedDobjProp = &whenSummarizedDobjPushTravelViaIobj;
modify JumpOffAction
	summarizeDobjProp = &summarizeDobjJumpOff
	summarizeImplicitDobjProp = &summarizeImplicitDobjJumpOff
	summarizeExtraDobjProp = &summarizeExtraDobjJumpOff
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjJumpOff
	whenSummarizedDobjProp = &whenSummarizedDobjJumpOff;
modify StandOnAction
	summarizeDobjProp = &summarizeDobjStandOn
	summarizeImplicitDobjProp = &summarizeImplicitDobjStandOn
	summarizeExtraDobjProp = &summarizeExtraDobjStandOn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjStandOn
	whenSummarizedDobjProp = &whenSummarizedDobjStandOn;
modify PushTravelClimbUpAction
	summarizeDobjProp = &summarizeDobjPushTravelClimbUp
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelClimbUp
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelClimbUp
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelClimbUp
	whenSummarizedDobjProp = &whenSummarizedDobjPushTravelClimbUp;
modify PushAftAction
	summarizeDobjProp = &summarizeDobjPushAft
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushAft
	summarizeExtraDobjProp = &summarizeExtraDobjPushAft
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushAft
	whenSummarizedDobjProp = &whenSummarizedDobjPushAft;
modify TurnOffAction
	summarizeDobjProp = &summarizeDobjTurnOff
	summarizeImplicitDobjProp = &summarizeImplicitDobjTurnOff
	summarizeExtraDobjProp = &summarizeExtraDobjTurnOff
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTurnOff
	whenSummarizedDobjProp = &whenSummarizedDobjTurnOff;
modify ExamineAction
	summarizeDobjProp = &summarizeDobjExamine
	summarizeImplicitDobjProp = &summarizeImplicitDobjExamine
	summarizeExtraDobjProp = &summarizeExtraDobjExamine
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjExamine
	whenSummarizedDobjProp = &whenSummarizedDobjExamine;
modify CutWithAction
	summarizeDobjProp = &summarizeDobjCutWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjCutWith
	summarizeExtraDobjProp = &summarizeExtraDobjCutWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjCutWith
	whenSummarizedDobjProp = &whenSummarizedDobjCutWith;
modify GoodbyeAction
	summarizeDobjProp = &summarizeDobjGoodbye
	summarizeImplicitDobjProp = &summarizeImplicitDobjGoodbye
	summarizeExtraDobjProp = &summarizeExtraDobjGoodbye
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGoodbye
	whenSummarizedDobjProp = &whenSummarizedDobjGoodbye;
modify ThrowAtAction
	summarizeDobjProp = &summarizeDobjThrowAt
	summarizeImplicitDobjProp = &summarizeImplicitDobjThrowAt
	summarizeExtraDobjProp = &summarizeExtraDobjThrowAt
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjThrowAt
	whenSummarizedDobjProp = &whenSummarizedDobjThrowAt;
modify NoteDarknessAction
	summarizeDobjProp = &summarizeDobjNoteDarkness
	summarizeImplicitDobjProp = &summarizeImplicitDobjNoteDarkness
	summarizeExtraDobjProp = &summarizeExtraDobjNoteDarkness
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjNoteDarkness
	whenSummarizedDobjProp = &whenSummarizedDobjNoteDarkness;
modify ThrowToAction
	summarizeDobjProp = &summarizeDobjThrowTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjThrowTo
	summarizeExtraDobjProp = &summarizeExtraDobjThrowTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjThrowTo
	whenSummarizedDobjProp = &whenSummarizedDobjThrowTo;
modify UnfastenFromAction
	summarizeDobjProp = &summarizeDobjUnfastenFrom
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnfastenFrom
	summarizeExtraDobjProp = &summarizeExtraDobjUnfastenFrom
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnfastenFrom
	whenSummarizedDobjProp = &whenSummarizedDobjUnfastenFrom;
modify PushOutAction
	summarizeDobjProp = &summarizeDobjPushOut
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushOut
	summarizeExtraDobjProp = &summarizeExtraDobjPushOut
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushOut
	whenSummarizedDobjProp = &whenSummarizedDobjPushOut;
modify UnscrewAction
	summarizeDobjProp = &summarizeDobjUnscrew
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnscrew
	summarizeExtraDobjProp = &summarizeExtraDobjUnscrew
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnscrew
	whenSummarizedDobjProp = &whenSummarizedDobjUnscrew;
modify ConsultAction
	summarizeDobjProp = &summarizeDobjConsult
	summarizeImplicitDobjProp = &summarizeImplicitDobjConsult
	summarizeExtraDobjProp = &summarizeExtraDobjConsult
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjConsult
	whenSummarizedDobjProp = &whenSummarizedDobjConsult;
modify PushTravelThroughAction
	summarizeDobjProp = &summarizeDobjPushTravelThrough
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelThrough
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelThrough
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelThrough
	whenSummarizedDobjProp = &whenSummarizedDobjPushTravelThrough;
modify GetOffOfAction
	summarizeDobjProp = &summarizeDobjGetOffOf
	summarizeImplicitDobjProp = &summarizeImplicitDobjGetOffOf
	summarizeExtraDobjProp = &summarizeExtraDobjGetOffOf
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGetOffOf
	whenSummarizedDobjProp = &whenSummarizedDobjGetOffOf;
modify JumpOffIAction
	summarizeDobjProp = &summarizeDobjJumpOffI
	summarizeImplicitDobjProp = &summarizeImplicitDobjJumpOffI
	summarizeExtraDobjProp = &summarizeExtraDobjJumpOffI
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjJumpOffI
	whenSummarizedDobjProp = &whenSummarizedDobjJumpOffI;
modify GetOutOfAction
	summarizeDobjProp = &summarizeDobjGetOutOf
	summarizeImplicitDobjProp = &summarizeImplicitDobjGetOutOf
	summarizeExtraDobjProp = &summarizeExtraDobjGetOutOf
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGetOutOf
	whenSummarizedDobjProp = &whenSummarizedDobjGetOutOf;
modify AttachToAction
	summarizeDobjProp = &summarizeDobjAttachTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjAttachTo
	summarizeExtraDobjProp = &summarizeExtraDobjAttachTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjAttachTo
	whenSummarizedDobjProp = &whenSummarizedDobjAttachTo;
modify TakeFromAction
	summarizeDobjProp = &summarizeDobjTakeFrom
	summarizeImplicitDobjProp = &summarizeImplicitDobjTakeFrom
	summarizeExtraDobjProp = &summarizeExtraDobjTakeFrom
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTakeFrom
	whenSummarizedDobjProp = &whenSummarizedDobjTakeFrom;
modify PushTravelGetOutOfAction
	summarizeDobjProp = &summarizeDobjPushTravelGetOutOf
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelGetOutOf
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelGetOutOf
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelGetOutOf
	whenSummarizedDobjProp = &whenSummarizedDobjPushTravelGetOutOf;
modify FastenToAction
	summarizeDobjProp = &summarizeDobjFastenTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjFastenTo
	summarizeExtraDobjProp = &summarizeExtraDobjFastenTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFastenTo
	whenSummarizedDobjProp = &whenSummarizedDobjFastenTo;
modify LockWithAction
	summarizeDobjProp = &summarizeDobjLockWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjLockWith
	summarizeExtraDobjProp = &summarizeExtraDobjLockWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLockWith
	whenSummarizedDobjProp = &whenSummarizedDobjLockWith;
modify PushForeAction
	summarizeDobjProp = &summarizeDobjPushFore
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushFore
	summarizeExtraDobjProp = &summarizeExtraDobjPushFore
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushFore
	whenSummarizedDobjProp = &whenSummarizedDobjPushFore;
modify PushTravelDirAction
	summarizeDobjProp = &summarizeDobjPushTravelDir
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelDir
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelDir
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelDir
	whenSummarizedDobjProp = &whenSummarizedDobjPushTravelDir;
modify PushEastAction
	summarizeDobjProp = &summarizeDobjPushEast
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushEast
	summarizeExtraDobjProp = &summarizeExtraDobjPushEast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushEast
	whenSummarizedDobjProp = &whenSummarizedDobjPushEast;
modify ListenToAction
	summarizeDobjProp = &summarizeDobjListenTo
	summarizeImplicitDobjProp = &summarizeImplicitDobjListenTo
	summarizeExtraDobjProp = &summarizeExtraDobjListenTo
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjListenTo
	whenSummarizedDobjProp = &whenSummarizedDobjListenTo;
modify PlugIntoAction
	summarizeDobjProp = &summarizeDobjPlugInto
	summarizeImplicitDobjProp = &summarizeImplicitDobjPlugInto
	summarizeExtraDobjProp = &summarizeExtraDobjPlugInto
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPlugInto
	whenSummarizedDobjProp = &whenSummarizedDobjPlugInto;
modify ThrowDirAction
	summarizeDobjProp = &summarizeDobjThrowDir
	summarizeImplicitDobjProp = &summarizeImplicitDobjThrowDir
	summarizeExtraDobjProp = &summarizeExtraDobjThrowDir
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjThrowDir
	whenSummarizedDobjProp = &whenSummarizedDobjThrowDir;
modify MoveWithAction
	summarizeDobjProp = &summarizeDobjMoveWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjMoveWith
	summarizeExtraDobjProp = &summarizeExtraDobjMoveWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjMoveWith
	whenSummarizedDobjProp = &whenSummarizedDobjMoveWith;
modify BurnWithAction
	summarizeDobjProp = &summarizeDobjBurnWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjBurnWith
	summarizeExtraDobjProp = &summarizeExtraDobjBurnWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjBurnWith
	whenSummarizedDobjProp = &whenSummarizedDobjBurnWith;
modify PutUnderAction
	summarizeDobjProp = &summarizeDobjPutUnder
	summarizeImplicitDobjProp = &summarizeImplicitDobjPutUnder
	summarizeExtraDobjProp = &summarizeExtraDobjPutUnder
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPutUnder
	whenSummarizedDobjProp = &whenSummarizedDobjPutUnder;
modify SmellImplicitAction
	summarizeDobjProp = &summarizeDobjSmellImplicit
	summarizeImplicitDobjProp = &summarizeImplicitDobjSmellImplicit
	summarizeExtraDobjProp = &summarizeExtraDobjSmellImplicit
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSmellImplicit
	whenSummarizedDobjProp = &whenSummarizedDobjSmellImplicit;
modify JumpOverAction
	summarizeDobjProp = &summarizeDobjJumpOver
	summarizeImplicitDobjProp = &summarizeImplicitDobjJumpOver
	summarizeExtraDobjProp = &summarizeExtraDobjJumpOver
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjJumpOver
	whenSummarizedDobjProp = &whenSummarizedDobjJumpOver;
modify PushDownAction
	summarizeDobjProp = &summarizeDobjPushDown
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushDown
	summarizeExtraDobjProp = &summarizeExtraDobjPushDown
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushDown
	whenSummarizedDobjProp = &whenSummarizedDobjPushDown;
modify SenseImplicitAction
	summarizeDobjProp = &summarizeDobjSenseImplicit
	summarizeImplicitDobjProp = &summarizeImplicitDobjSenseImplicit
	summarizeExtraDobjProp = &summarizeExtraDobjSenseImplicit
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjSenseImplicit
	whenSummarizedDobjProp = &whenSummarizedDobjSenseImplicit;
modify PourIntoAction
	summarizeDobjProp = &summarizeDobjPourInto
	summarizeImplicitDobjProp = &summarizeImplicitDobjPourInto
	summarizeExtraDobjProp = &summarizeExtraDobjPourInto
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPourInto
	whenSummarizedDobjProp = &whenSummarizedDobjPourInto;
modify PushStarboardAction
	summarizeDobjProp = &summarizeDobjPushStarboard
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushStarboard
	summarizeExtraDobjProp = &summarizeExtraDobjPushStarboard
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushStarboard
	whenSummarizedDobjProp = &whenSummarizedDobjPushStarboard;
modify PushWestAction
	summarizeDobjProp = &summarizeDobjPushWest
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushWest
	summarizeExtraDobjProp = &summarizeExtraDobjPushWest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushWest
	whenSummarizedDobjProp = &whenSummarizedDobjPushWest;
modify UnfastenAction
	summarizeDobjProp = &summarizeDobjUnfasten
	summarizeImplicitDobjProp = &summarizeImplicitDobjUnfasten
	summarizeExtraDobjProp = &summarizeExtraDobjUnfasten
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjUnfasten
	whenSummarizedDobjProp = &whenSummarizedDobjUnfasten;
modify TurnWithAction
	summarizeDobjProp = &summarizeDobjTurnWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjTurnWith
	summarizeExtraDobjProp = &summarizeExtraDobjTurnWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTurnWith
	whenSummarizedDobjProp = &whenSummarizedDobjTurnWith;
modify PushPortAction
	summarizeDobjProp = &summarizeDobjPushPort
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushPort
	summarizeExtraDobjProp = &summarizeExtraDobjPushPort
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushPort
	whenSummarizedDobjProp = &whenSummarizedDobjPushPort;
modify PourOntoAction
	summarizeDobjProp = &summarizeDobjPourOnto
	summarizeImplicitDobjProp = &summarizeImplicitDobjPourOnto
	summarizeExtraDobjProp = &summarizeExtraDobjPourOnto
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPourOnto
	whenSummarizedDobjProp = &whenSummarizedDobjPourOnto;
modify InventoryWideAction
	summarizeDobjProp = &summarizeDobjInventoryWide
	summarizeImplicitDobjProp = &summarizeImplicitDobjInventoryWide
	summarizeExtraDobjProp = &summarizeExtraDobjInventoryWide
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjInventoryWide
	whenSummarizedDobjProp = &whenSummarizedDobjInventoryWide;
modify PushNortheastAction
	summarizeDobjProp = &summarizeDobjPushNortheast
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushNortheast
	summarizeExtraDobjProp = &summarizeExtraDobjPushNortheast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushNortheast
	whenSummarizedDobjProp = &whenSummarizedDobjPushNortheast;
modify InventoryTallAction
	summarizeDobjProp = &summarizeDobjInventoryTall
	summarizeImplicitDobjProp = &summarizeImplicitDobjInventoryTall
	summarizeExtraDobjProp = &summarizeExtraDobjInventoryTall
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjInventoryTall
	whenSummarizedDobjProp = &whenSummarizedDobjInventoryTall;
modify PushSoutheastAction
	summarizeDobjProp = &summarizeDobjPushSoutheast
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushSoutheast
	summarizeExtraDobjProp = &summarizeExtraDobjPushSoutheast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushSoutheast
	whenSummarizedDobjProp = &whenSummarizedDobjPushSoutheast;
modify PushNorthwestAction
	summarizeDobjProp = &summarizeDobjPushNorthwest
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushNorthwest
	summarizeExtraDobjProp = &summarizeExtraDobjPushNorthwest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushNorthwest
	whenSummarizedDobjProp = &whenSummarizedDobjPushNorthwest;
modify PushSouthwestAction
	summarizeDobjProp = &summarizeDobjPushSouthwest
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushSouthwest
	summarizeExtraDobjProp = &summarizeExtraDobjPushSouthwest
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushSouthwest
	whenSummarizedDobjProp = &whenSummarizedDobjPushSouthwest;
modify ReadAction
	summarizeDobjProp = &summarizeDobjRead
	summarizeImplicitDobjProp = &summarizeImplicitDobjRead
	summarizeExtraDobjProp = &summarizeExtraDobjRead
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjRead
	whenSummarizedDobjProp = &whenSummarizedDobjRead;
modify FeelAction
	summarizeDobjProp = &summarizeDobjFeel
	summarizeImplicitDobjProp = &summarizeImplicitDobjFeel
	summarizeExtraDobjProp = &summarizeExtraDobjFeel
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFeel
	whenSummarizedDobjProp = &whenSummarizedDobjFeel;
modify DoffAction
	summarizeDobjProp = &summarizeDobjDoff
	summarizeImplicitDobjProp = &summarizeImplicitDobjDoff
	summarizeExtraDobjProp = &summarizeExtraDobjDoff
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDoff
	whenSummarizedDobjProp = &whenSummarizedDobjDoff;
modify ClimbDownAction
	summarizeDobjProp = &summarizeDobjClimbDown
	summarizeImplicitDobjProp = &summarizeImplicitDobjClimbDown
	summarizeExtraDobjProp = &summarizeExtraDobjClimbDown
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjClimbDown
	whenSummarizedDobjProp = &whenSummarizedDobjClimbDown;
modify CleanWithAction
	summarizeDobjProp = &summarizeDobjCleanWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjCleanWith
	summarizeExtraDobjProp = &summarizeExtraDobjCleanWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjCleanWith
	whenSummarizedDobjProp = &whenSummarizedDobjCleanWith;
modify PutBehindAction
	summarizeDobjProp = &summarizeDobjPutBehind
	summarizeImplicitDobjProp = &summarizeImplicitDobjPutBehind
	summarizeExtraDobjProp = &summarizeExtraDobjPutBehind
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPutBehind
	whenSummarizedDobjProp = &whenSummarizedDobjPutBehind;
modify TakeAction
	summarizeDobjProp = &summarizeDobjTake
	summarizeImplicitDobjProp = &summarizeImplicitDobjTake
	summarizeExtraDobjProp = &summarizeExtraDobjTake
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTake
	whenSummarizedDobjProp = &whenSummarizedDobjTake;
modify LockAction
	summarizeDobjProp = &summarizeDobjLock
	summarizeImplicitDobjProp = &summarizeImplicitDobjLock
	summarizeExtraDobjProp = &summarizeExtraDobjLock
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLock
	whenSummarizedDobjProp = &whenSummarizedDobjLock;
modify FlipAction
	summarizeDobjProp = &summarizeDobjFlip
	summarizeImplicitDobjProp = &summarizeImplicitDobjFlip
	summarizeExtraDobjProp = &summarizeExtraDobjFlip
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFlip
	whenSummarizedDobjProp = &whenSummarizedDobjFlip;
modify ForeAction
	summarizeDobjProp = &summarizeDobjFore
	summarizeImplicitDobjProp = &summarizeImplicitDobjFore
	summarizeExtraDobjProp = &summarizeExtraDobjFore
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjFore
	whenSummarizedDobjProp = &whenSummarizedDobjFore;
modify TravelDirAction
	summarizeDobjProp = &summarizeDobjTravelDir
	summarizeImplicitDobjProp = &summarizeImplicitDobjTravelDir
	summarizeExtraDobjProp = &summarizeExtraDobjTravelDir
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTravelDir
	whenSummarizedDobjProp = &whenSummarizedDobjTravelDir;
modify EastAction
	summarizeDobjProp = &summarizeDobjEast
	summarizeImplicitDobjProp = &summarizeImplicitDobjEast
	summarizeExtraDobjProp = &summarizeExtraDobjEast
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjEast
	whenSummarizedDobjProp = &whenSummarizedDobjEast;
modify PushTravelClimbDownAction
	summarizeDobjProp = &summarizeDobjPushTravelClimbDown
	summarizeImplicitDobjProp = &summarizeImplicitDobjPushTravelClimbDown
	summarizeExtraDobjProp = &summarizeExtraDobjPushTravelClimbDown
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPushTravelClimbDown
	whenSummarizedDobjProp = &whenSummarizedDobjPushTravelClimbDown;
modify TravelViaAction
	summarizeDobjProp = &summarizeDobjTravelVia
	summarizeImplicitDobjProp = &summarizeImplicitDobjTravelVia
	summarizeExtraDobjProp = &summarizeExtraDobjTravelVia
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjTravelVia
	whenSummarizedDobjProp = &whenSummarizedDobjTravelVia;
modify WearAction
	summarizeDobjProp = &summarizeDobjWear
	summarizeImplicitDobjProp = &summarizeImplicitDobjWear
	summarizeExtraDobjProp = &summarizeExtraDobjWear
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjWear
	whenSummarizedDobjProp = &whenSummarizedDobjWear;
modify OpenAction
	summarizeDobjProp = &summarizeDobjOpen
	summarizeImplicitDobjProp = &summarizeImplicitDobjOpen
	summarizeExtraDobjProp = &summarizeExtraDobjOpen
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjOpen
	whenSummarizedDobjProp = &whenSummarizedDobjOpen;
modify LookUnderAction
	summarizeDobjProp = &summarizeDobjLookUnder
	summarizeImplicitDobjProp = &summarizeImplicitDobjLookUnder
	summarizeExtraDobjProp = &summarizeExtraDobjLookUnder
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLookUnder
	whenSummarizedDobjProp = &whenSummarizedDobjLookUnder;
modify WaitAction
	summarizeDobjProp = &summarizeDobjWait
	summarizeImplicitDobjProp = &summarizeImplicitDobjWait
	summarizeExtraDobjProp = &summarizeExtraDobjWait
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjWait
	whenSummarizedDobjProp = &whenSummarizedDobjWait;
modify LookAction
	summarizeDobjProp = &summarizeDobjLook
	summarizeImplicitDobjProp = &summarizeImplicitDobjLook
	summarizeExtraDobjProp = &summarizeExtraDobjLook
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjLook
	whenSummarizedDobjProp = &whenSummarizedDobjLook;
modify DropAction
	summarizeDobjProp = &summarizeDobjDrop
	summarizeImplicitDobjProp = &summarizeImplicitDobjDrop
	summarizeExtraDobjProp = &summarizeExtraDobjDrop
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDrop
	whenSummarizedDobjProp = &whenSummarizedDobjDrop;
modify YellAction
	summarizeDobjProp = &summarizeDobjYell
	summarizeImplicitDobjProp = &summarizeImplicitDobjYell
	summarizeExtraDobjProp = &summarizeExtraDobjYell
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjYell
	whenSummarizedDobjProp = &whenSummarizedDobjYell;
modify MoveAction
	summarizeDobjProp = &summarizeDobjMove
	summarizeImplicitDobjProp = &summarizeImplicitDobjMove
	summarizeExtraDobjProp = &summarizeExtraDobjMove
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjMove
	whenSummarizedDobjProp = &whenSummarizedDobjMove;
modify BurnAction
	summarizeDobjProp = &summarizeDobjBurn
	summarizeImplicitDobjProp = &summarizeImplicitDobjBurn
	summarizeExtraDobjProp = &summarizeExtraDobjBurn
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjBurn
	whenSummarizedDobjProp = &whenSummarizedDobjBurn;
modify GoThroughAction
	summarizeDobjProp = &summarizeDobjGoThrough
	summarizeImplicitDobjProp = &summarizeImplicitDobjGoThrough
	summarizeExtraDobjProp = &summarizeExtraDobjGoThrough
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjGoThrough
	whenSummarizedDobjProp = &whenSummarizedDobjGoThrough;
modify DownAction
	summarizeDobjProp = &summarizeDobjDown
	summarizeImplicitDobjProp = &summarizeImplicitDobjDown
	summarizeExtraDobjProp = &summarizeExtraDobjDown
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjDown
	whenSummarizedDobjProp = &whenSummarizedDobjDown;
modify KissAction
	summarizeDobjProp = &summarizeDobjKiss
	summarizeImplicitDobjProp = &summarizeImplicitDobjKiss
	summarizeExtraDobjProp = &summarizeExtraDobjKiss
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjKiss
	whenSummarizedDobjProp = &whenSummarizedDobjKiss;
modify JumpAction
	summarizeDobjProp = &summarizeDobjJump
	summarizeImplicitDobjProp = &summarizeImplicitDobjJump
	summarizeExtraDobjProp = &summarizeExtraDobjJump
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjJump
	whenSummarizedDobjProp = &whenSummarizedDobjJump;
modify PullAction
	summarizeDobjProp = &summarizeDobjPull
	summarizeImplicitDobjProp = &summarizeImplicitDobjPull
	summarizeExtraDobjProp = &summarizeExtraDobjPull
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPull
	whenSummarizedDobjProp = &whenSummarizedDobjPull;
modify PushAction
	summarizeDobjProp = &summarizeDobjPush
	summarizeImplicitDobjProp = &summarizeImplicitDobjPush
	summarizeExtraDobjProp = &summarizeExtraDobjPush
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjPush
	whenSummarizedDobjProp = &whenSummarizedDobjPush;
modify ScrewWithAction
	summarizeDobjProp = &summarizeDobjScrewWith
	summarizeImplicitDobjProp = &summarizeImplicitDobjScrewWith
	summarizeExtraDobjProp = &summarizeExtraDobjScrewWith
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjScrewWith
	whenSummarizedDobjProp = &whenSummarizedDobjScrewWith;
modify EventAction
	summarizeDobjProp = &summarizeDobjEvent
	summarizeImplicitDobjProp = &summarizeImplicitDobjEvent
	summarizeExtraDobjProp = &summarizeExtraDobjEvent
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjEvent
	whenSummarizedDobjProp = &whenSummarizedDobjEvent;
modify CommandActorAction
	summarizeDobjProp = &summarizeDobjCommandActor
	summarizeImplicitDobjProp = &summarizeImplicitDobjCommandActor
	summarizeExtraDobjProp = &summarizeExtraDobjCommandActor
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjCommandActor
	whenSummarizedDobjProp = &whenSummarizedDobjCommandActor;
modify StrikeAction
	summarizeDobjProp = &summarizeDobjStrike
	summarizeImplicitDobjProp = &summarizeImplicitDobjStrike
	summarizeExtraDobjProp = &summarizeExtraDobjStrike
	summarizeAnnouncementDobjProp = &summarizeAnnouncementDobjStrike
	whenSummarizedDobjProp = &whenSummarizedDobjStrike;
