#charset "us-ascii"
//
// transcriptToolsConjugation.t
//
//	Conjugations for irregular verbs used by the default report
//	summaries.
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

modify TAction
	conjugation = nil

	verbPattern = static new RexPattern('(.*)(?=/)')

	verbName() {
		rexMatch(verbPattern, verbPhrase);
		return(rexGroup(1)[3]);
	}

	conjugateVerb(str) {
		if(conjugation != nil)
			return(conjugation);

		return(gActor.conjugateRegularVerb(str));
	}

	conjugateVerbPhrase(str) {
		local cName, vName;

		vName = verbName();
		cName = conjugateVerb(vName);

		if(vName != cName)
			str = rexReplace('%<' + vName + '%>', str,
				cName, ReplaceAll);

		return(str);
	}

	_actionClause(dobjStr, iobjStr?, inf?) {
		return(getVerbPhrase1(!inf, verbPhrase, dobjStr, nil));
	}

	actionClause(dobjStr, iobjStr?, inf?) {
		return(conjugateVerbPhrase(_actionClause(dobjStr, iobjStr,
			inf)));
	}
;

modify TIAction
	_actionClause(dobjStr, iobjStr, inf?) {
		return(getVerbPhrase2(!inf, verbPhrase, dobjStr, nil, iobjStr));
	}
;

modify TakeAction conjugation = '{take[s]|took}';
modify TakeFromAction conjugation = '{take[s]|took}';
modify DropAction conjugation = 'drop{s/ped}';
modify PutOnAction conjugation = '{put[s]|put}';
modify PutInAction conjugation = '{put[s]|put}';
modify PutUnderAction conjugation = '{put[s]|put}';
modify PutBehindAction conjugation = '{put[s]|put}';
