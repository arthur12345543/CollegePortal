//= require_self
//= require ckeditor/init
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){$("#nav li").mouseover(function(){$("ul",this).stop().slideDown("200"),$(this).children("a:first").addClass("hov")}),$("#nav li").mouseout(function(){$("ul",this).stop().slideUp("200"),$(this).children("a:first").removeClass("hov")})}),$(document).ready(function(){$("form[data-remote]").bind("ajax:before",function(){for(instance in CKEDITOR.instances)CKEDITOR.instances[instance].updateElement()})});