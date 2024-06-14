#charset "us-ascii"
//
// reportManagerMods.t
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

modify CommandReport
	dobjList_ = nil
	iobjList_ = nil

	addDobj(obj) {
		if(obj == nil)
			return(nil);
		if(dobjList_ == nil)
			dobjList_ = new Vector();
		dobjList_.appendUnique(obj);

		return(true);
	}

	addIobj(obj) {
		if(obj == nil)
			return(nil);
		if(iobjList_ == nil)
			iobjList_ = new Vector();
		iobjList_.appendUnique(obj);

		return(true);
	}

	_andList(lst)
		{ return(lst ? equivalentLister.makeSimpleList(lst) : nil); }
	_orList(lst)
		{ return(lst ? equivalentLister.makeSimpleList(lst) : nil); }

	listDobjsWithAnd() { return(_andList(dobjList_)); }
	listDobjsWithOr() { return(_orList(dobjList_)); }
	listDobjs() { return(listDobjsWithAnd()); }

	listIobjsWithAnd() { return(_andList(iobjList_)); }
	listIobjsWithOr() { return(_orList(iobjList_)); }
	listIobjs() { return(listIobjsWithAnd()); }

	_actionClause(dList, iList) {
		local a;

		if((a = getAction()) == nil)
			return(nil);

		return(a.actionClause(dList, iList));
	}

	actionClauseWithAnd() {
		return(_actionClause(listDobjsWithAnd(), listIobjsWithAnd()));
	}

	actionClauseWithOr() {
		return(_actionClause(listDobjsWithOr(), listIobjsWithOr()));
	}

	actionClause() { return(actionClauseWithAnd()); }
;
