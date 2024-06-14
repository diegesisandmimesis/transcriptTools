#charset "us-ascii"
//
// transcriptGrouper.t
//
//
#include <adv3.h>
#include <en_us.h>

#include "transcriptTools.h"

class TranscriptGrouper: TranscriptPostprocessor
	toolPriority = 400
;

// Go through and mark all reports in a group as failures if the group
// itself is marked as a failure
class ImplicitGrouper: TranscriptGrouper
	postprocess(t, vec) {
		_handleNotes(vec);
		_handleGroups(vec);
	}

	_handleNotes(vec) {
		vec.forEach(function(o) {
			if(!o.ofKind(ImplicitActionAnnouncement))
				return;

			// We don't have to iterate through the vector looking
			// for failures (like implicitGroupTransform from
			// adv3 does) because we've already marked all reports
			// for failed actions with isFailure.
			if(o.isFailure)
				o.noteJustTrying();
			else if(o.isQuestion)
				o.noteQuestion();
		});
	}

	_handleGroups(vec) {
		local i, r, v;

		v = vec.subset({ x: x.ofKind(ImplicitActionAnnouncement) });
		for(i = 1; i <= v.length; i++) {
			if((r = _checkReport(v[i], vec)) != nil)
				i = r;
		}
	}

	_checkReport(report, vec) {
		local g, i, idx;

		if((idx = vec.indexOf(report)) == nil)
			return(nil);

		if(idx == vec.length)
			return(nil);

		idx += 1;
		g = new Vector(vec.length - idx);

		g.append(report);

		while(_canGroupWith(report, vec[idx])) {
			g.append(vec[idx]);
			idx += 1;
		}

		if(g.length > 1) {
			_reverseVector(g);
			for(i = 2; i <= g.length; i++) {
				g[i].messageText_ = '';
			}
			g[1].messageText_ = _summarize(g);
		}

		return(idx);
	}

	_summarize(lst) {
		local ctx, cur, curTxt, i, len, txt;

		ctx = new ListImpCtx();

		len = lst.length;
		txt = '';

		for(i = 1; i <= len; i++) {
			cur = lst[i];
			ctx.isInSublist = nil;
			ctx.setBaseCtx(cur);
			if(cur._summaryText != nil) {
				curTxt = cur._summaryText;
			} else {
				curTxt = cur.getMessageText(cur.getAction()
					.getOriginalAction(), ctx);
			}

			while((cur.justTrying && i < len && lst[i+1].justTrying)
				|| (cur.justAsking && i < len && lst[i+1].justAsking)) {
				i += 1;
				cur = lst[i];
				ctx.isInSublist = true;
			}

			if(txt != '' && curTxt != '')
				txt += ', then ';
			txt += curTxt;
		}
		if(txt == '')
			return '';

		return standardImpCtx.buildImplicitAnnouncement(txt);
	}

	_reverseVector(lst) {
		local i, t;

		for(i = 1; i <= (lst.length / 2); i++) {
			t = lst[i];
			lst[i] = lst[lst.length - i + 1];
			lst[lst.length - i + 1] = t;
		}

	}

	_handleGroup(r0, r1) {
		
	}

	_canGroupWith(r0, r1) {
		if((r0 == nil) || !r0.ofKind(ImplicitActionAnnouncement))
			return(nil);

		if(r1.ofKind(ImplicitActionAnnouncement))
			return(true);

		return(r1.ofKind(DefaultObjectAnnouncement)
			&& r1.action_.parentAction == r0.action_);
			
	}
;
