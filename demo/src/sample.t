#charset "us-ascii"
//
// sample.t
// Version 1.0
// Copyright 2022 Diegesis & Mimesis
//
// This is a very simple demonstration "game" for the transcriptTools library.
//
// It can be compiled via the included makefile with
//
//	# t3make -f makefile.t3m
//
// ...or the equivalent, depending on what TADS development environment
// you're using.
//
// This "game" is distributed under the MIT License, see LICENSE.txt
// for details.
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

versionInfo: GameID;
gameMain: GameMainDef initialPlayerChar = me;

function inlineCommand(cmd) {
	return('<b>&gt;<<toString(cmd).toUpper()>></b>');
}

flowerReportManager: ReportManager reportManagerFor = Flower;
+ReportSummary @ExamineAction
	summarize(data) {
		return('It\'s <<data.listDobjs()>>. ');
	}
	summarizeAnnouncement(r) {
		return(inherited(r));
	}
;

class Flower: Thing 'flower*flowers' 'flower'
	"A <<color>> flower. "

	isEquivalent = true
	reportName = 'flower'
	color = nil

	initializeThing() {
		setColor();
		inherited();
	}

	setColor() {
		if(color == nil) color = 'colorless';
		cmdDict.addWord(self, color, &adjective);
		name = color + ' flower';
	}
;

class RedFlower: Flower color = 'red';
class BlueFlower: Flower color = 'blue';
class GreenFlower: Flower color = 'green';

class ShortFlower: Thing '(short) flower*flowers' 'flower'
	"A short <<color>> flower. "

	isEquivalent = true
	reportName = 'flower'
	color = nil

	initializeThing() {
		setColor();
		inherited();
	}

	setColor() {
		if(color == nil) color = 'colorless';
		cmdDict.addWord(self, color, &adjective);
		name = 'short ' + color + ' flower';
	}

	dobjFor(Examine) {
		summarize(data) {
			return('It\'s <<data.listDobjs()>>. ');
		}
	}
;

class RedShortFlower: ShortFlower color = 'red';
class BlueShortFlower: ShortFlower color = 'blue';
class GreenShortFlower: ShortFlower color = 'green';

class TakeToggle: Thing
	takeFailureMsg = &cannotTakeThatMsg
	takeable = true
	dobjFor(Take) {
		verify() {
			if(takeable != true)
				illogical(takeFailureMsg);
		}
	}
;

class AlarmItem: Thing
	alarmReport = 'As {you/he} pick{s} up {a dobj/him}, an alarm sounds
		in the distance. '

	dobjFor(Take) {
		action() {
			inherited();
			// The normal action report.
			mainReport(&alarmReport);
		}

		// This method will be called whenever one of our >TAKE
		// action reports is summarized away.
		whenSummarized(data) {
			if(data.report.messageProp_ != &alarmReport)
				return;
			// We add an special kind of extra report that's
			// only used for important information removed by
			// summaries.  This will get stuck into the
			// report group the >TAKE action is in.
			extraSummaryReport(data, 'As {you/he} pick{s} up
				<<data.summary.listDobjSubset(Stone)>>, an alarm
				sounds in the distance. ');
		}
	}
;

class Pebble: TakeToggle '(small) (round) pebble*pebbles' 'pebble'
	"A small, round pebble. "
	isEquivalent = true
;
class Rock: TakeToggle '(ordinary) rock*rocks' 'rock'
	"An ordinary rock. "
	isEquivalent = true
;
class Stone: AlarmItem, TakeToggle '(unremarkable) stone*stones' 'stone'
	"An unremarkable stone. "
	isEquivalent = true
;
class Brick: AlarmItem, TakeToggle '(red) brick*bricks' 'brick'
	"A red brick. "
	isEquivalent = true
	takeable = nil
	takeFailureMsg = 'The brick somehow or other evades {your/his} grasp. '
;

class Anchor: Thing '(rusty) anchor' 'rusty anchor'
	"Hm. Rusty anchor?  Rusty anchor!  Yeah, I think I know that one. "
	dobjFor(Take) { verify() { illogical(&cannotTakeThatMsg); } }
;

class Box: OpenableContainer '(wooden) box' 'box'
	"A wooden box. "
	dobjFor(Take) { verify() { illogical(&cannotTakeThatMsg); } }
;
class Vase: Container '(delicate) vase' 'vase'
	"A delicate vase. "
/*
	//dobjFor(Take) { verify() { illogical(&cannotTakeThatMsg); } }
	dobjFor(Take) {
		action() {
			inherited();
			mainReport('{You/He} gingerly take{s} <<theName>>. ');
		}
	}
*/
;
class Sign: Fixture 'sign' 'sign'
	"[This space intentionally left blank] "
	specialDesc = "There's a sign on the wall. "
;

Sign template "desc";

roomZero: Room 'Room Zero'
	"This is the central room zero.  Exits to rooms one through four are
	in the cardinal directions, clockwise from the north. "
	north = roomOne
	east = roomTwo
	south = roomThree
	west = roomFour
;
+me: Person;
+Sign "Each room in this demo is set up to test some part of the transcriptTool
	module.  There's a sign in each room describing one or more actions
	and their expected output.
	<.p>Basic usage of this demo is to move to the various rooms, doing
	the actions described on the sign, and then using
	<<inlineCommand('undo')>> to reset the game state. ";
	

roomOne: Room 'Room One'
	"This is room one.  Room zero is to the south and
	room 1B is to the north. "
	north = roomOneB
	south = roomZero
;
+Sign "If you <<inlineCommand('take all')>> you should get
	a single report for both objects, instead of a report for each. ";
+Pebble;
+Rock;

roomOneB: Room 'Room 1B'
	"This is room 1B.  Room one is to the south and room 1C is to
	the north. "
	north = roomOneC
	south = roomOne
;
+Sign "If you <<inlineCommand('take all')>> you should get a single
	failure report for both objects, instead of a separate failure report
	for each one. ";
+Pebble takeable = nil;
+Pebble takeable = nil;
+Rock takeable = nil;

roomOneC: Room 'Room 1C'
	"This is room 1C.  Room 1B is to the south. "
	south = roomOneB
;
+Sign "If you <<inlineCommand('take all')>> you should get a single
	failure report for both objects, instead of a separate failure report
	for each one. ";
+Brick;
+Brick;

roomTwo: Room 'Room Two'
	"This is room two.  Room zero is to the west. "
	west = roomZero
;
+Sign "If you <<inlineCommand('examine all')>> the flowers should all be
	grouped by their locations instead of their colors. ";
+GreenFlower;
+RedFlower;
+Pebble;
+GreenFlower;
+Vase;
++RedFlower;
++Pebble;
++BlueFlower;
++RedFlower;
+GreenFlower;

roomThree: Room 'Room Three'
	"This is room three.  Room zero is to the north and room 3B is
	to the south. "
	north = roomZero
	east = roomThreeA
	south = roomThreeB
;
+Sign "If you <<inlineCommand('put pebbles in box')>> you should get one
	implicit action report (describing opening the box and taking the
	pebbles) and a one action report (putting the pebbles in the box). ";
+Pebble;
+Pebble;
+Box;

roomThreeA: Room 'Room 3A'
	"This is room 3A.  Room three is to the west. "
	west = roomThree
;
+Sign "If you try <<inlineCommand('put all in box')>> you should get:
	an implicit action line describing taking the stones and opening
	the box; an extra action report describing an alarm going off;
	and the action report for putting the stones in the box. ";
+Pebble;
+Pebble;
+Box;
+Vase;
++Pebble;
++Pebble;

roomThreeB: Room 'Room 3B'
	"This is room 3B.  Room three is to the north, 3C is to the south,
		and 3B2 is to the east. "
	north = roomThree
	east = roomThreeB2
	south = roomThreeC
;
+Sign "If you try <<inlineCommand('put all in box')>> you should get:
	an implicit action line describing taking the stones and opening
	the box; an extra action report describing an alarm going off;
	and the action report for putting the stones in the box. ";
+Stone;
+Stone;
+Box;

roomThreeB2: Room 'Room 3B2'
	"This is room 3B.  Room 3B is to the west. "
	west = roomThreeB
;
+Sign "This is currently just a duplicate of room 3B, ignore it. ";
+Stone;
+Stone;
+Box;

roomThreeC: Room 'Room 3C'
	"This is room 3C.  Room 3B is to the north, 3D is to the south. "
	north = roomThreeB
	south = roomThreeD
;
+Sign "Like in room 3B, if you try <<inlineCommand('put all in box')>>
	you should get a bunch of unsummarized action reports&mdash;the
	summary logic should be disabled for the command. ";
+Pebble;
+Pebble;
+Stone;
+Stone;
+Box;

roomThreeD: Room 'Room 3D'
	"This is room 3D.  Room 3C is to the north. "
	north = roomThreeC
;
+Sign "More or less identical test to room 3C, with different objects. ";
+Pebble;
+Stone;
+Anchor;
+Box;


roomFour: Room 'Room Four'
	"This is room four.  Room zero is to the east. "
	east = roomZero
;
+Sign "The parent class of the flowers in this room uses a self-summarizer.  If
you do a <<inlineCommand('examine flowers')>> you'll get a single summary
report.  The only interesting thing (as opposed to the similar stuff that
happens in room two) is the underlying mechanism used to do the summary. ";
+RedShortFlower;
+GreenShortFlower;
+BlueShortFlower;

modify transcriptTools active = true;
//modify syslog initFlags = 'assignSummarizer';
//modify syslog initFlags = 'transcript';
