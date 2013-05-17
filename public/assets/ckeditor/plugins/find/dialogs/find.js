/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){function e(e){return e.type==CKEDITOR.NODE_TEXT&&0<e.getLength()&&(!n||!e.isReadOnly())}function t(e){return e.type!=CKEDITOR.NODE_ELEMENT||!e.isBlockBoundary(CKEDITOR.tools.extend({},CKEDITOR.dtd.$empty,CKEDITOR.dtd.$nonEditable))}var n,r=function(){return{textNode:this.textNode,offset:this.offset,character:this.textNode?this.textNode.getText().charAt(this.offset):null,hitMatchBoundary:this._.matchBoundary}},i=["find","replace"],s=[["txtFindFind","txtFindReplace"],["txtFindCaseChk","txtReplaceCaseChk"],["txtFindWordChk","txtReplaceWordChk"],["txtFindCyclic","txtReplaceCyclic"]],o=function(o,a){function f(e,t){var n=o.createRange();return n.setStart(e.textNode,t?e.offset:e.offset+1),n.setEndAt(o.editable(),CKEDITOR.POSITION_BEFORE_END),n}function l(e){var t=o.getSelection(),n=o.editable();return t&&!e?(e=t.getRanges()[0].clone(),e.collapse(!0)):(e=o.createRange(),e.setStartAt(n,CKEDITOR.POSITION_AFTER_START)),e.setEndAt(n,CKEDITOR.POSITION_BEFORE_END),e}var c=new CKEDITOR.style(CKEDITOR.tools.extend({attributes:{"data-cke-highlight":1},fullMatch:1,ignoreReadonly:1,childRule:function(){return 0}},o.config.find_highlight,!0)),h=function(n,r){var i=this,s=new CKEDITOR.dom.walker(n);s.guard=r?t:function(e){!t(e)&&(i._.matchBoundary=!0)},s.evaluator=e,s.breakOnFalse=1,n.startContainer.type==CKEDITOR.NODE_TEXT&&(this.textNode=n.startContainer,this.offset=n.startOffset-1),this._={matchWord:r,walker:s,matchBoundary:!1}};h.prototype={next:function(){return this.move()},back:function(){return this.move(!0)},move:function(e){var t=this.textNode;if(null===t)return r.call(this);this._.matchBoundary=!1;if(t&&e&&0<this.offset)this.offset--;else if(t&&this.offset<t.getLength()-1)this.offset++;else{for(t=null;!t&&!(t=this._.walker[e?"previous":"next"].call(this._.walker),this._.matchWord&&!t||this._.walker._.end););this.offset=(this.textNode=t)?e?t.getLength()-1:0:0}return r.call(this)}};var d=function(e,t){this._={walker:e,cursors:[],rangeLength:t,highlightRange:null,isMatched:0}};d.prototype={toDomRange:function(){var e=o.createRange(),t=this._.cursors;if(1>t.length){var n=this._.walker.textNode;if(!n)return null;e.setStartAfter(n)}else n=t[0],t=t[t.length-1],e.setStart(n.textNode,n.offset),e.setEnd(t.textNode,t.offset+1);return e},updateFromDomRange:function(e){var t=new h(e);this._.cursors=[];do e=t.next(),e.character&&this._.cursors.push(e);while(e.character);this._.rangeLength=this._.cursors.length},setMatched:function(){this._.isMatched=!0},clearMatched:function(){this._.isMatched=!1},isMatched:function(){return this._.isMatched},highlight:function(){if(!(1>this._.cursors.length)){this._.highlightRange&&this.removeHighlight();var e=this.toDomRange(),t=e.createBookmark();c.applyToRange(e),e.moveToBookmark(t),this._.highlightRange=e,t=e.startContainer,t.type!=CKEDITOR.NODE_ELEMENT&&(t=t.getParent()),t.scrollIntoView(),this.updateFromDomRange(e)}},removeHighlight:function(){if(this._.highlightRange){var e=this._.highlightRange.createBookmark();c.removeFromRange(this._.highlightRange),this._.highlightRange.moveToBookmark(e),this.updateFromDomRange(this._.highlightRange),this._.highlightRange=null}},isReadOnly:function(){return this._.highlightRange?this._.highlightRange.startContainer.isReadOnly():0},moveBack:function(){var e=this._.walker.back(),t=this._.cursors;return e.hitMatchBoundary&&(this._.cursors=t=[]),t.unshift(e),t.length>this._.rangeLength&&t.pop(),e},moveNext:function(){var e=this._.walker.next(),t=this._.cursors;return e.hitMatchBoundary&&(this._.cursors=t=[]),t.push(e),t.length>this._.rangeLength&&t.shift(),e},getEndCharacter:function(){var e=this._.cursors;return 1>e.length?null:e[e.length-1].character},getNextCharacterRange:function(e){var t,n;return n=this._.cursors,n=(t=n[n.length-1])&&t.textNode?new h(f(t)):this._.walker,new d(n,e)},getCursors:function(){return this._.cursors}};var v=function(e,t){var n=[-1];t&&(e=e.toLowerCase());for(var r=0;r<e.length;r++)for(n.push(n[r]+1);0<n[r+1]&&e.charAt(r)!=e.charAt(n[r+1]-1);)n[r+1]=n[n[r+1]-1]+1;this._={overlap:n,state:0,ignoreCase:!!t,pattern:e}};v.prototype={feedCharacter:function(e){for(this._.ignoreCase&&(e=e.toLowerCase());;){if(e==this._.pattern.charAt(this._.state))return this._.state++,this._.state==this._.pattern.length?(this._.state=0,2):1;if(!this._.state)return 0;this._.state=this._.overlap[this._.state]}return null},reset:function(){this._.state=0}};var m=/[.,"'?!;: \u0085\u00a0\u1680\u280e\u2028\u2029\u202f\u205f\u3000]/,g=function(e){if(!e)return!0;var t=e.charCodeAt(0);return 9<=t&&13>=t||8192<=t&&8202>=t||m.test(e)},b={searchRange:null,matchRange:null,find:function(e,t,n,r,i,s){this.matchRange?(this.matchRange.removeHighlight(),this.matchRange=this.matchRange.getNextCharacterRange(e.length)):this.matchRange=new d(new h(this.searchRange),e.length);for(var u=new v(e,!t),a=0,c="%";null!==c;){for(this.matchRange.moveNext();c=this.matchRange.getEndCharacter();){a=u.feedCharacter(c);if(2==a)break;this.matchRange.moveNext().hitMatchBoundary&&u.reset()}if(2==a){if(n){var p=this.matchRange.getCursors(),m=p[p.length-1],p=p[0],y=o.createRange();y.setStartAt(o.editable(),CKEDITOR.POSITION_AFTER_START),y.setEnd(p.textNode,p.offset),p=y,m=f(m),p.trim(),m.trim(),p=new h(p,!0),m=new h(m,!0);if(!g(p.back().character)||!g(m.next().character))continue}return this.matchRange.setMatched(),!1!==i&&this.matchRange.highlight(),!0}}return this.matchRange.clearMatched(),this.matchRange.removeHighlight(),r&&!s?(this.searchRange=l(1),this.matchRange=null,arguments.callee.apply(this,Array.prototype.slice.call(arguments).concat([!0]))):!1},replaceCounter:0,replace:function(e,t,r,i,s,u,a){n=1,e=0;if(this.matchRange&&this.matchRange.isMatched()&&!this.matchRange._.isReplaced&&!this.matchRange.isReadOnly()){this.matchRange.removeHighlight(),t=this.matchRange.toDomRange(),r=o.document.createText(r);if(!a){var f=o.getSelection();f.selectRanges([t]),o.fire("saveSnapshot")}t.deleteContents(),t.insertNode(r),a||(f.selectRanges([t]),o.fire("saveSnapshot")),this.matchRange.updateFromDomRange(t),a||this.matchRange.highlight(),this.matchRange._.isReplaced=!0,this.replaceCounter++,e=1}else e=this.find(t,i,s,u,!a);return n=0,e}},w=o.lang.find;return{title:w.title,resizable:CKEDITOR.DIALOG_RESIZE_NONE,minWidth:350,minHeight:170,buttons:[CKEDITOR.dialog.cancelButton],contents:[{id:"find",label:w.find,title:w.find,accessKey:"",elements:[{type:"hbox",widths:["230px","90px"],children:[{type:"text",id:"txtFindFind",label:w.findWhat,isChanged:!1,labelLayout:"horizontal",accessKey:"F"},{type:"button",id:"btnFind",align:"left",style:"width:100%",label:w.find,onClick:function(){var e=this.getDialog();b.find(e.getValueOf("find","txtFindFind"),e.getValueOf("find","txtFindCaseChk"),e.getValueOf("find","txtFindWordChk"),e.getValueOf("find","txtFindCyclic"))||alert(w.notFoundMsg)}}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(w.findOptions),style:"margin-top:29px",children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"txtFindCaseChk",isChanged:!1,label:w.matchCase},{type:"checkbox",id:"txtFindWordChk",isChanged:!1,label:w.matchWord},{type:"checkbox",id:"txtFindCyclic",isChanged:!1,"default":!0,label:w.matchCyclic}]}]}]},{id:"replace",label:w.replace,accessKey:"M",elements:[{type:"hbox",widths:["230px","90px"],children:[{type:"text",id:"txtFindReplace",label:w.findWhat,isChanged:!1,labelLayout:"horizontal",accessKey:"F"},{type:"button",id:"btnFindReplace",align:"left",style:"width:100%",label:w.replace,onClick:function(){var e=this.getDialog();b.replace(e,e.getValueOf("replace","txtFindReplace"),e.getValueOf("replace","txtReplace"),e.getValueOf("replace","txtReplaceCaseChk"),e.getValueOf("replace","txtReplaceWordChk"),e.getValueOf("replace","txtReplaceCyclic"))||alert(w.notFoundMsg)}}]},{type:"hbox",widths:["230px","90px"],children:[{type:"text",id:"txtReplace",label:w.replaceWith,isChanged:!1,labelLayout:"horizontal",accessKey:"R"},{type:"button",id:"btnReplaceAll",align:"left",style:"width:100%",label:w.replaceAll,isChanged:!1,onClick:function(){var e=this.getDialog();b.replaceCounter=0,b.searchRange=l(1),b.matchRange&&(b.matchRange.removeHighlight(),b.matchRange=null);for(o.fire("saveSnapshot");b.replace(e,e.getValueOf("replace","txtFindReplace"),e.getValueOf("replace","txtReplace"),e.getValueOf("replace","txtReplaceCaseChk"),e.getValueOf("replace","txtReplaceWordChk"),!1,!0););b.replaceCounter?(alert(w.replaceSuccessMsg.replace(/%1/,b.replaceCounter)),o.fire("saveSnapshot")):alert(w.notFoundMsg)}}]},{type:"fieldset",label:CKEDITOR.tools.htmlEncode(w.findOptions),children:[{type:"vbox",padding:0,children:[{type:"checkbox",id:"txtReplaceCaseChk",isChanged:!1,label:w.matchCase},{type:"checkbox",id:"txtReplaceWordChk",isChanged:!1,label:w.matchWord},{type:"checkbox",id:"txtReplaceCyclic",isChanged:!1,"default":!0,label:w.matchCyclic}]}]}]}],onLoad:function(){var e=this,t,n=0;this.on("hide",function(){n=0}),this.on("show",function(){n=1}),this.selectPage=CKEDITOR.tools.override(this.selectPage,function(r){return function(o){r.call(e,o);var a=e._.tabs[o],f;f="find"===o?"txtFindWordChk":"txtReplaceWordChk",t=e.getContentElement(o,"find"===o?"txtFindFind":"txtFindReplace"),e.getContentElement(o,f),a.initialized||(CKEDITOR.document.getById(t._.inputId),a.initialized=!0);if(n){var l,o="find"===o?1:0,a=1-o,c,h=s.length;for(c=0;c<h;c++)f=this.getContentElement(i[o],s[c][o]),l=this.getContentElement(i[a],s[c][a]),l.setValue(f.getValue())}}})},onShow:function(){b.searchRange=l();var e=this.getParentEditor().getSelection().getSelectedText(),t=this.getContentElement(a,"find"==a?"txtFindFind":"txtFindReplace");t.setValue(e),t.select(),this.selectPage(a),this[("find"==a&&this._.editor.readOnly?"hide":"show")+"Page"]("replace")},onHide:function(){var e;b.matchRange&&b.matchRange.isMatched()&&(b.matchRange.removeHighlight(),o.focus(),(e=b.matchRange.toDomRange())&&o.getSelection().selectRanges([e])),delete b.matchRange},onFocus:function(){return"replace"==a?this.getContentElement("replace","txtFindReplace"):this.getContentElement("find","txtFindFind")}}};CKEDITOR.dialog.add("find",function(e){return o(e,"find")}),CKEDITOR.dialog.add("replace",function(e){return o(e,"replace")})})();