(function(e){function n(e,t){var n=t.ownerDocument,r=n.createRange(),i;return r.setStartBefore(t),r.setEnd(e.endContainer,e.endOffset),i=n.createElement("body"),i.appendChild(r.cloneContents()),i.innerHTML.replace(/<(br|img|object|embed|input|textarea)[^>]*>/gi,"-").replace(/<[^>]+>/g,"").length==0}function r(e,t){return parseInt(e.getAttribute(t)||1)}function s(n,s,o){function h(e,t){return e=e.cloneNode(t),e.removeAttribute("id"),e}function p(){var e=0;u=[],t(["thead","tbody","tfoot"],function(i){var o=s.select("> "+i+" tr",n);t(o,function(n,o){o+=e,t(s.select("> td, > th",n),function(e,t){var n,s,f,l;if(u[o])while(u[o][t])t++;f=r(e,"rowspan"),l=r(e,"colspan");for(s=o;s<o+f;s++){u[s]||(u[s]=[]);for(n=t;n<t+l;n++)u[s][n]={part:i,real:s==o&&n==t,elm:e,rowspan:f,colspan:l}}})}),e+=o.length})}function v(e,t){var n;n=u[t];if(n)return n[e]}function m(e,t,n){e&&(n=parseInt(n),n===1?e.removeAttribute(t,1):e.setAttribute(t,n,1))}function g(e){return e&&(s.hasClass(e.elm,"mceSelected")||e==c)}function b(){var e=[];return t(n.rows,function(n){t(n.cells,function(t){if(s.hasClass(t,"mceSelected")||t==c.elm)return e.push(n),!1})}),e}function w(){var e=s.createRng();e.setStartAfter(n),e.setEndAfter(n),o.setRng(e),s.remove(n)}function E(n){var r;return e.walk(n,function(i){var o;if(i.nodeType==3)return t(s.getParents(i.parentNode,null,n).reverse(),function(e){e=h(e,!1),r?o&&o.appendChild(e):r=o=e,o=e}),o&&(o.innerHTML=e.isIE?"&nbsp;":'<br data-mce-bogus="1" />'),!1},"childNodes"),n=h(n,!1),m(n,"rowSpan",1),m(n,"colSpan",1),r?n.appendChild(r):e.isIE||(n.innerHTML='<br data-mce-bogus="1" />'),n}function S(){var e=s.createRng();t(s.select("tr",n),function(e){e.cells.length==0&&s.remove(e)});if(s.select("tr",n).length==0){e.setStartAfter(n),e.setEndAfter(n),o.setRng(e),s.remove(n);return}t(s.select("thead,tbody,tfoot",n),function(e){e.rows.length==0&&s.remove(e)}),p(),row=u[Math.min(u.length-1,f.y)],row&&(o.select(row[Math.min(row.length-1,f.x)].elm,!0),o.collapse(!0))}function T(e,t,n,r){var i,o,a,f,l;i=u[t][e].elm.parentNode;for(a=1;a<=n;a++){i=s.getNext(i,"tr");if(i){for(o=e;o>=0;o--){l=u[t+a][o].elm;if(l.parentNode==i){for(f=1;f<=r;f++)s.insertAfter(E(l),l);break}}if(o==-1)for(f=1;f<=r;f++)i.insertBefore(E(i.cells[0]),i.cells[0])}}}function N(){t(u,function(e,n){t(e,function(e,t){var i,o,u,f;if(g(e)){e=e.elm,i=r(e,"colspan"),o=r(e,"rowspan");if(i>1||o>1){m(e,"rowSpan",1),m(e,"colSpan",1);for(f=0;f<i-1;f++)s.insertAfter(E(e),e);T(t,n,o-1,i)}}})})}function C(n,r,i){var o,a,c,h,g,y,b,w,n,E,x;n?(pos=P(n),o=pos.x,a=pos.y,c=o+(r-1),h=a+(i-1)):(o=f.x,a=f.y,c=l.x,h=l.y),b=v(o,a),w=v(c,h);if(b&&w&&b.part==w.part){N(),p(),b=v(o,a).elm,m(b,"colSpan",c-o+1),m(b,"rowSpan",h-a+1);for(y=a;y<=h;y++)for(g=o;g<=c;g++){if(!u[y]||!u[y][g])continue;n=u[y][g].elm,n!=b&&(E=e.grep(n.childNodes),t(E,function(e){b.appendChild(e)}),E.length&&(E=e.grep(b.childNodes),x=0,t(E,function(e){e.nodeName=="BR"&&s.getAttrib(e,"data-mce-bogus")&&x++<E.length-1&&b.removeChild(e)})),s.remove(n))}S()}}function k(e){var n,i,o,f,l,c,p,d,v;t(u,function(r,i){t(r,function(t,r){if(g(t)){t=t.elm,l=t.parentNode,c=h(l,!1),n=i;if(e)return!1}});if(e)return!n});for(f=0;f<u[0].length;f++){if(!u[n][f])continue;i=u[n][f].elm;if(i!=o){if(!e){v=r(i,"rowspan");if(v>1){m(i,"rowSpan",v+1);continue}}else if(n>0&&u[n-1][f]){d=u[n-1][f].elm,v=r(d,"rowSpan");if(v>1){m(d,"rowSpan",v+1);continue}}p=E(i),m(p,"colSpan",i.colSpan),c.appendChild(p),o=i}}c.hasChildNodes()&&(e?l.parentNode.insertBefore(c,l):s.insertAfter(c,l))}function L(e){var n,i;t(u,function(r,i){t(r,function(t,r){if(g(t)){n=r;if(e)return!1}});if(e)return!n}),t(u,function(t,o){var u,f,l;if(!t[n])return;u=t[n].elm,u!=i&&(l=r(u,"colspan"),f=r(u,"rowspan"),l==1?e?(u.parentNode.insertBefore(E(u),u),T(n,o,f-1,l)):(s.insertAfter(E(u),u),T(n,o,f-1,l)):m(u,"colSpan",u.colSpan+1),i=u)})}function A(){var n=[];t(u,function(i,o){t(i,function(i,o){g(i)&&e.inArray(n,o)===-1&&(t(u,function(e){var t=e[o].elm,n;n=r(t,"colSpan"),n>1?m(t,"colSpan",n-1):s.remove(t)}),n.push(o))})}),S()}function O(){function n(e){var n,i,o;n=s.getNext(e,"tr"),t(e.cells,function(e){var t=r(e,"rowSpan");t>1&&(m(e,"rowSpan",t-1),i=P(e),T(i.x,i.y,1,1))}),i=P(e.cells[0]),t(u[i.y],function(e){var t;e=e.elm,e!=o&&(t=r(e,"rowSpan"),t<=1?s.remove(e):m(e,"rowSpan",t-1),o=e)})}var e;e=b(),t(e.reverse(),function(e){n(e)}),S()}function M(){var e=b();return s.remove(e),S(),e}function _(){var e=b();return t(e,function(t,n){e[n]=h(t,!0)}),e}function D(e,n){var r=b(),o=r[n?0:r.length-1],a=o.cells.length;t(u,function(e){var n;a=0,t(e,function(e,t){e.real&&(a+=e.colspan),e.elm.parentNode==o&&(n=1)});if(n)return!1}),n||e.reverse(),t(e,function(e){var t=e.cells.length,r;for(i=0;i<t;i++)r=e.cells[i],m(r,"colSpan",1),m(r,"rowSpan",1);for(i=t;i<a;i++)e.appendChild(E(e.cells[t-1]));for(i=a;i<t;i++)s.remove(e.cells[i]);n?o.parentNode.insertBefore(e,o):s.insertAfter(e,o)})}function P(e){var n;return t(u,function(r,i){return t(r,function(t,r){if(t.elm==e)return n={x:r,y:i},!1}),!n}),n}function H(e){f=P(e)}function B(){var e,n,r;return n=r=0,t(u,function(e,i){t(e,function(e,t){var s,o;g(e)&&(e=u[i][t],t>n&&(n=t),i>r&&(r=i),e.real&&(s=e.colspan-1,o=e.rowspan-1,s&&t+s>n&&(n=t+s),o&&i+o>r&&(r=i+o)))})}),{x:n,y:r}}function j(e){var t,n,r,i,o,a,c,h;l=P(e);if(f&&l){t=Math.min(f.x,l.x),n=Math.min(f.y,l.y),r=Math.max(f.x,l.x),i=Math.max(f.y,l.y),o=r,a=i;for(y=n;y<=a;y++)e=u[y][t],e.real||t-(e.colspan-1)<t&&(t-=e.colspan-1);for(x=t;x<=o;x++)e=u[n][x],e.real||n-(e.rowspan-1)<n&&(n-=e.rowspan-1);for(y=n;y<=i;y++)for(x=t;x<=r;x++)e=u[y][x],e.real&&(c=e.colspan-1,h=e.rowspan-1,c&&x+c>o&&(o=x+c),h&&y+h>a&&(a=y+h));s.removeClass(s.select("td.mceSelected,th.mceSelected"),"mceSelected");for(y=n;y<=a;y++)for(x=t;x<=o;x++)u[y][x]&&s.addClass(u[y][x].elm,"mceSelected")}}var u,f,l,c;p(),c=s.getParent(o.getStart(),"th,td"),c&&(f=P(c),l=B(),c=v(f.x,f.y)),e.extend(this,{deleteTable:w,split:N,merge:C,insertRow:k,insertCol:L,deleteCols:A,deleteRows:O,cutRows:M,copyRows:_,pasteRows:D,getPos:P,setStartCell:H,setEndCell:j})}var t=e.each;e.create("tinymce.plugins.TablePlugin",{init:function(i,o){function h(e){var t=i.selection,n=i.dom.getParent(e||t.getNode(),"table");if(n)return new s(n,i.dom,t)}function p(){i.getBody().style.webkitUserSelect="",l&&(i.dom.removeClass(i.dom.select("td.mceSelected,th.mceSelected"),"mceSelected"),l=!1)}var u,f,l=!0;t([["table","table.desc","mceInsertTable",!0],["delete_table","table.del","mceTableDelete"],["delete_col","table.delete_col_desc","mceTableDeleteCol"],["delete_row","table.delete_row_desc","mceTableDeleteRow"],["col_after","table.col_after_desc","mceTableInsertColAfter"],["col_before","table.col_before_desc","mceTableInsertColBefore"],["row_after","table.row_after_desc","mceTableInsertRowAfter"],["row_before","table.row_before_desc","mceTableInsertRowBefore"],["row_props","table.row_desc","mceTableRowProps",!0],["cell_props","table.cell_desc","mceTableCellProps",!0],["split_cells","table.split_cells_desc","mceTableSplitCells",!0],["merge_cells","table.merge_cells_desc","mceTableMergeCells",!0]],function(e){i.addButton(e[0],{title:e[1],cmd:e[2],ui:e[3]})}),e.isIE||i.onClick.add(function(e,t){t=t.target,t.nodeName==="TABLE"&&(e.selection.select(t),e.nodeChanged())}),i.onPreProcess.add(function(e,t){var n,r,i,s=e.dom,o;n=s.select("table",t.node),r=n.length;while(r--){i=n[r],s.setAttrib(i,"data-mce-style","");if(o=s.getAttrib(i,"width"))s.setStyle(i,"width",o),s.setAttrib(i,"width","");if(o=s.getAttrib(i,"height"))s.setStyle(i,"height",o),s.setAttrib(i,"height","")}}),i.onNodeChange.add(function(e,t,n){var r;n=e.selection.getStart(),r=e.dom.getParent(n,"td,th,caption"),t.setActive("table",n.nodeName==="TABLE"||!!r),r&&r.nodeName==="CAPTION"&&(r=0),t.setDisabled("delete_table",!r),t.setDisabled("delete_col",!r),t.setDisabled("delete_table",!r),t.setDisabled("delete_row",!r),t.setDisabled("col_after",!r),t.setDisabled("col_before",!r),t.setDisabled("row_after",!r),t.setDisabled("row_before",!r),t.setDisabled("row_props",!r),t.setDisabled("cell_props",!r),t.setDisabled("split_cells",!r),t.setDisabled("merge_cells",!r)}),i.onInit.add(function(i){function y(e,t,n,r){var i=3,s=e.dom.getParent(t.startContainer,"TABLE"),o,u,a;return s&&(o=s.parentNode),u=t.startContainer.nodeType==i&&t.startOffset==0&&t.endOffset==0&&r&&(n.nodeName=="TR"||n==o),a=(n.nodeName=="TD"||n.nodeName=="TH")&&!r,u||a}function b(t){if(!e.isWebKit)return;var n=t.selection.getRng(),r=t.selection.getNode(),i=t.dom.getParent(n.startContainer,"TD,TH");if(!y(t,n,r,i))return;i||(i=r);var s=i.lastChild;while(s.lastChild)s=s.lastChild;n.setEnd(s,s.nodeValue.length),t.selection.setRng(n)}var s,o,v=i.dom,g;u=i.windowManager,i.onMouseDown.add(function(e,t){t.button!=2&&(p(),o=v.getParent(t.target,"td,th"),s=v.getParent(o,"table"))}),v.bind(i.getDoc(),"mouseover",function(e){var t,n,r=e.target;if(o&&(g||r!=o)&&(r.nodeName=="TD"||r.nodeName=="TH")){n=v.getParent(r,"table"),n==s&&(g||(g=h(n),g.setStartCell(o),i.getBody().style.webkitUserSelect="none"),g.setEndCell(r),l=!0),t=i.selection.getSel();try{t.removeAllRanges?t.removeAllRanges():t.empty()}catch(u){}e.preventDefault()}}),i.onMouseUp.add(function(t,n){var r,i=t.selection,u,a=i.getSel(),f,l,c,h;if(o){g&&(t.getBody().style.webkitUserSelect="");function p(t,n){var i=new e.dom.TreeWalker(t,t);do{if(t.nodeType==3&&e.trim(t.nodeValue).length!=0){n?r.setStart(t,0):r.setEnd(t,t.nodeValue.length);return}if(t.nodeName=="BR"){n?r.setStartBefore(t):r.setEndBefore(t);return}}while(t=n?i.next():i.prev())}u=v.select("td.mceSelected,th.mceSelected");if(u.length>0){r=v.createRng(),l=u[0],h=u[u.length-1],r.setStartBefore(l),r.setEndAfter(l),p(l,1),f=new e.dom.TreeWalker(l,v.getParent(u[0],"table"));do if(l.nodeName=="TD"||l.nodeName=="TH"){if(!v.hasClass(l,"mceSelected"))break;c=l}while(l=f.next());p(c),i.setRng(r)}t.nodeChanged(),o=g=s=null}}),i.onKeyUp.add(function(e,t){p()}),i.onKeyDown.add(function(e,t){b(e)}),i.onMouseDown.add(function(e,t){t.button!=2&&b(e)}),i.plugins.table.fixTableCellSelection=b,i&&i.plugins.contextmenu&&i.plugins.contextmenu.onContextMenu.add(function(e,t,n){var r,s=i.selection,o=s.getNode()||i.getBody();i.dom.getParent(n,"td")||i.dom.getParent(n,"th")||i.dom.select("td.mceSelected,th.mceSelected").length?(t.removeAll(),o.nodeName=="A"&&!i.dom.getAttrib(o,"name")&&(t.add({title:"advanced.link_desc",icon:"link",cmd:i.plugins.advlink?"mceAdvLink":"mceLink",ui:!0}),t.add({title:"advanced.unlink_desc",icon:"unlink",cmd:"UnLink"}),t.addSeparator()),o.nodeName=="IMG"&&o.className.indexOf("mceItem")==-1&&(t.add({title:"advanced.image_desc",icon:"image",cmd:i.plugins.advimage?"mceAdvImage":"mceImage",ui:!0}),t.addSeparator()),t.add({title:"table.desc",icon:"table",cmd:"mceInsertTable",value:{action:"insert"}}),t.add({title:"table.props_desc",icon:"table_props",cmd:"mceInsertTable"}),t.add({title:"table.del",icon:"delete_table",cmd:"mceTableDelete"}),t.addSeparator(),r=t.addMenu({title:"table.cell"}),r.add({title:"table.cell_desc",icon:"cell_props",cmd:"mceTableCellProps"}),r.add({title:"table.split_cells_desc",icon:"split_cells",cmd:"mceTableSplitCells"}),r.add({title:"table.merge_cells_desc",icon:"merge_cells",cmd:"mceTableMergeCells"}),r=t.addMenu({title:"table.row"}),r.add({title:"table.row_desc",icon:"row_props",cmd:"mceTableRowProps"}),r.add({title:"table.row_before_desc",icon:"row_before",cmd:"mceTableInsertRowBefore"}),r.add({title:"table.row_after_desc",icon:"row_after",cmd:"mceTableInsertRowAfter"}),r.add({title:"table.delete_row_desc",icon:"delete_row",cmd:"mceTableDeleteRow"}),r.addSeparator(),r.add({title:"table.cut_row_desc",icon:"cut",cmd:"mceTableCutRow"}),r.add({title:"table.copy_row_desc",icon:"copy",cmd:"mceTableCopyRow"}),r.add({title:"table.paste_row_before_desc",icon:"paste",cmd:"mceTablePasteRowBefore"}).setDisabled(!f),r.add({title:"table.paste_row_after_desc",icon:"paste",cmd:"mceTablePasteRowAfter"}).setDisabled(!f),r=t.addMenu({title:"table.col"}),r.add({title:"table.col_before_desc",icon:"col_before",cmd:"mceTableInsertColBefore"}),r.add({title:"table.col_after_desc",icon:"col_after",cmd:"mceTableInsertColAfter"}),r.add({title:"table.delete_col_desc",icon:"delete_col",cmd:"mceTableDeleteCol"})):t.add({title:"table.desc",icon:"table",cmd:"mceInsertTable"})});if(e.isWebKit){function w(n,i){function u(t,r,i){var s=t?"previousSibling":"nextSibling",o=n.dom.getParent(r,"tr"),u=o[s];if(u)return w(n,r,u,t),e.dom.Event.cancel(i),!0;var a=n.dom.getParent(o,"table"),l=o.parentNode,p=l.nodeName.toLowerCase();if(p==="tbody"||p===(t?"tfoot":"thead")){var v=f(t,a,l,"tbody");if(v!==null)return c(t,v,r,i)}return h(t,o,s,a,i)}function f(e,t,r,i){var s=n.dom.select(">"+i,t),o=s.indexOf(r);if(e&&o===0||!e&&o===s.length-1)return l(e,t);if(o===-1){var u=r.tagName.toLowerCase()==="thead"?0:s.length-1;return s[u]}return s[o+(e?-1:1)]}function l(e,t){var r=e?"thead":"tfoot",i=n.dom.select(">"+r,t);return i.length!==0?i[0]:null}function c(t,r,i,s){var o=p(r,t);return o&&w(n,i,o,t),e.dom.Event.cancel(s),!0}function h(t,r,i,s,o){var a=s[i];if(a)return v(a),!0;var f=n.dom.getParent(s,"td,th");if(f)return u(t,f,o);var l=p(r,!t);return v(l),e.dom.Event.cancel(o)}function p(e,t){var r=e&&e[t?"lastChild":"firstChild"];return r&&r.nodeName==="BR"?n.dom.getParent(r,"td,th"):r}function v(e){n.selection.setCursorLocation(e,0)}function m(){return o==s.UP||o==s.DOWN}function g(e){var t=e.selection.getNode(),n=e.dom.getParent(t,"tr");return n!==null}function y(e){var t=0,n=e;while(n.previousSibling)n=n.previousSibling,t+=r(n,"colspan");return t}function b(e,n){var i=0,s=0;return t(e.children,function(e,t){i+=r(e,"colspan"),s=t;if(i>n)return!1}),s}function w(e,t,n,r){var i=y(e.dom.getParent(t,"td,th")),s=b(n,i),o=n.childNodes[s],u=p(o,r);v(u||o)}function E(e){var t=n.selection.getNode(),r=n.dom.getParent(t,"td,th"),i=n.dom.getParent(e,"td,th");return r&&r!==i&&S(r,i)}function S(e,t){return n.dom.getParent(e,"TABLE")===n.dom.getParent(t,"TABLE")}var s=e.VK,o=i.keyCode;if(m()&&g(n)){var x=n.selection.getNode();setTimeout(function(){E(x)&&u(!i.shiftKey&&o===s.UP,x,i)},0)}}i.onKeyDown.add(w)}if(!e.isIE){function E(){var e;for(e=i.getBody().lastChild;e&&e.nodeType==3&&!e.nodeValue.length;e=e.previousSibling);e&&e.nodeName=="TABLE"&&i.dom.add(i.getBody(),"p",null,'<br mce_bogus="1" />')}e.isGecko&&i.onKeyDown.add(function(e,t){var r,i,s=e.dom;if(t.keyCode==37||t.keyCode==38)r=e.selection.getRng(),i=s.getParent(r.startContainer,"table"),i&&e.getBody().firstChild==i&&n(r,i)&&(r=s.createRng(),r.setStartBefore(i),r.setEndBefore(i),e.selection.setRng(r),t.preventDefault())}),i.onKeyUp.add(E),i.onSetContent.add(E),i.onVisualAid.add(E),i.onPreProcess.add(function(e,t){var n=t.node.lastChild;n&&n.childNodes.length==1&&n.firstChild.nodeName=="BR"&&e.dom.remove(n)}),e.isGecko&&i.onKeyDown.add(function(t,n){if(n.keyCode===e.VK.ENTER&&n.shiftKey){var r=t.selection.getRng().startContainer,i=v.getParent(r,"td,th");if(i){var s=t.getDoc().createTextNode("﻿");v.insertAfter(s,r)}}}),E(),i.startContent=i.getContent({format:"raw"})}}),t({mceTableSplitCells:function(e){e.split()},mceTableMergeCells:function(e){var t,n,r;r=i.dom.getParent(i.selection.getNode(),"th,td"),r&&(t=r.rowSpan,n=r.colSpan),i.dom.select("td.mceSelected,th.mceSelected").length?e.merge():u.open({url:o+"/merge_cells.htm",width:240+parseInt(i.getLang("table.merge_cells_delta_width",0)),height:110+parseInt(i.getLang("table.merge_cells_delta_height",0)),inline:1},{rows:t,cols:n,onaction:function(t){e.merge(r,t.cols,t.rows)},plugin_url:o})},mceTableInsertRowBefore:function(e){e.insertRow(!0)},mceTableInsertRowAfter:function(e){e.insertRow()},mceTableInsertColBefore:function(e){e.insertCol(!0)},mceTableInsertColAfter:function(e){e.insertCol()},mceTableDeleteCol:function(e){e.deleteCols()},mceTableDeleteRow:function(e){e.deleteRows()},mceTableCutRow:function(e){f=e.cutRows()},mceTableCopyRow:function(e){f=e.copyRows()},mceTablePasteRowBefore:function(e){e.pasteRows(f,!0)},mceTablePasteRowAfter:function(e){e.pasteRows(f)},mceTableDelete:function(e){e.deleteTable()}},function(e,t){i.addCommand(t,function(){var t=h();t&&(e(t),i.execCommand("mceRepaint"),p())})}),t({mceInsertTable:function(e){u.open({url:o+"/table.htm",width:400+parseInt(i.getLang("table.table_delta_width",0)),height:320+parseInt(i.getLang("table.table_delta_height",0)),inline:1},{plugin_url:o,action:e?e.action:0})},mceTableRowProps:function(){u.open({url:o+"/row.htm",width:400+parseInt(i.getLang("table.rowprops_delta_width",0)),height:295+parseInt(i.getLang("table.rowprops_delta_height",0)),inline:1},{plugin_url:o})},mceTableCellProps:function(){u.open({url:o+"/cell.htm",width:400+parseInt(i.getLang("table.cellprops_delta_width",0)),height:295+parseInt(i.getLang("table.cellprops_delta_height",0)),inline:1},{plugin_url:o})}},function(e,t){i.addCommand(t,function(t,n){e(n)})})}}),e.PluginManager.add("table",e.plugins.TablePlugin)})(tinymce);