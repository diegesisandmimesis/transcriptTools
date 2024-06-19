#charset "us-ascii"
//
// reportManagerMods.t
//
//	Modifications to TADS3/adv3 stuff used by report managers and
//	report summaries.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

modify playerActionMessages 
	cannotTakeThatMsg = '{You/he} {can\'t} take {that dobj/him}. '
;

// Tweak the CommandReport class to handle multiple dobjs and iobjs.
// By default if a command involves taking three objects, adv3 will generate
// at least three reports for the command...one report for each object.
// When we summarize this, we find the first report for a group of
// related actions, add all the objects to the first report, and then
// delete the other reports.
// These modifications provide the methods for adding the extra objects
// to a report.
// We also provide convenience methods for generating the summary text
// from the dobj and iobj lists.
modify CommandReport
	dobjList_ = nil		// list of dobjs summarized by this report
	iobjList_ = nil		// list of iobjs summarized by this report

	transcript_ = nil	// our transcript

	// Add a direct object to the report
	addDobj(obj) {
		if(obj == nil)
			return(nil);
		if(dobjList_ == nil)
			dobjList_ = new Vector();
		dobjList_.appendUnique(obj);

		return(true);
	}

	// Add an indirect object to the report
	addIobj(obj) {
		if(obj == nil)
			return(nil);
		if(iobjList_ == nil)
			iobjList_ = new Vector();
		iobjList_.appendUnique(obj);

		return(true);
	}

	// Returns the given list using "and" as the conjunction.
	_andList(lst)
		{ return(lst ? equivalentLister.makeSimpleList(lst) : nil); }

	// Same as above, but use "or" as the conjunction.
	_orList(lst)
		{ return(lst ? equivalentOrLister.makeSimpleList(lst) : nil); }

	// Direct object listing methods
	listDobjsWithAnd(l?) { return(_andList(l ? l : dobjList_)); }
	listDobjsWithOr(l?) { return(_orList(l ? l : dobjList_)); }
	listDobjs(l?) { return(listDobjsWithAnd(l)); }

	// Indirect object listing methods
	listIobjsWithAnd() { return(_andList(iobjList_)); }
	listIobjsWithOr() { return(_orList(iobjList_)); }
	listIobjs() { return(listIobjsWithAnd()); }

	// Utility method, returns all the dobjs that match the given class.
	_dobjSubset(c) { return(dobjList_.subset({ x: x.ofKind(c) })); }

	// Dobj subset listing methods.  listDobjSubset(Pebble) returns
	// a text list of all the objects in the dobj list that are instances
	// of Pebble.
	listDobjSubset(c) { return(listDobjSubsetWithAnd(c)); }
	listDobjSubsetWithAnd(c) { return(listDobjsWithAnd(_dobjSubset(c))); }
	listDobjSubsetWithOr(c) { return(listDobjsWithOr(_dobjSubset(c))); }

	// The actionClause() methods return the conjugated verb phrase
	// with the given noun phrases.  
	// dList is the direct object list; iList is the indirect object
	// list; ger is a flag, verb will be the gerund (-ing) form if true
	_actionClause(dList, iList, ger?) {
		local a;

		if((a = getAction()) == nil)
			return(nil);

		return(a.actionClause(dList, iList, ger));
	}

	actionClauseWithAnd(ger?) {
		return(_actionClause(listDobjsWithAnd(), listIobjsWithAnd(),
			ger));
	}

	actionClauseWithOr(ger?) {
		return(_actionClause(listDobjsWithOr(), listIobjsWithOr(),
			ger));
	}

	actionClause(ger?) { return(actionClauseWithAnd(ger)); }

;
