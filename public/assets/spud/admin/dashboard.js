Spud=typeof Spud=="undefined"?{}:Spud,Spud.Admin=typeof Spud.Admin=="undefined"?{}:Spud.Admin,Spud.Admin.Dashboard=new function(){var e=this;e.editMode=!1,e.mouseIsDown=!1,e.init=function(){$(".admin_application").bind("mousedown",e.mouseDown),$(".admin_application").bind("mouseup",e.mouseUp),$(".admin_application").bind("click",e.mouseClick),$("#dashboard-editsave").click(e.saveDashboard),$("#dashboard-editcancel").click(e.cancelDashboard),$(".sortable").sortable({disabled:!0})},e.mouseDown=function(){e.mouseIsDown=!0,e.editMode==0&&setTimeout(function(){e.mouseIsDown&&e.enableEditMode()},1e3)},e.mouseClick=function(t){if(e.editMode)return t.stopPropagation(),!1},e.mouseUp=function(){e.mouseIsDown=!1},e.enableEditMode=function(){e.editMode=!0,$(".admin_application").addClass("jiggly"),$(".sortable").sortable("enable"),$("#dashboard-editmode").show()},e.saveDashboard=function(){e.saveOrder(),e.disableEditMode()},e.cancelDashboard=function(){$(".sortable").sortable("cancel"),e.disableEditMode()},e.disableEditMode=function(){e.editMode=!1,$("#dashboard-editmode").hide(),$(".admin_application").removeClass("jiggly"),$(".sortable").sortable("disable")},e.saveOrder=function(){var e=$(".sortable").sortable("toArray");for(var t=0;t<e.length;t++)e[t]=e[t].replace("application_name_","");var n=e.join(",");console.log(n),jQuery.ajax("/spud/save_key?key=app_order&value="+n)}};