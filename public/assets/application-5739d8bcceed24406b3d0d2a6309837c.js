// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require dfgdfgdfg
//= require jquery_ujs
//= require ckeditor/init
//= require tree .
function ForwardSlide(){i+=1;var e=document.getElementById("LAPhoto");e.src=URLOfPhotos[i],i==maxSlide&&(i=0)}function GoSlide(){var e=document.getElementById("LAPhoto");for(var t=0;t<=100;t++){plus-=.15,e.style.opacity=plus;if(plus<=0){plus=.1;break}setTimeout("",100)}e.src=URLOfPhotos[i],e.style.opacity=.1;for(var t=0;t<=100;t++){plus+=.15,e.style.opacity=plus;if(plus>=1){plus=1;break}setTimeout("",100)}i++,i==maxSlide&&(i=0),setTimeout(GoSlide,3e3)}$(document).ready(function(){$("#nav li").mouseover(function(){$("ul",this).stop().slideDown("200"),$(this).children("a:first").addClass("hov")}),$("#nav li").mouseout(function(){$("ul",this).stop().slideUp("200"),$(this).children("a:first").removeClass("hov")})}),$(document).ready(function(){$("form[data-remote]").bind("ajax:before",function(){for(instance in CKEDITOR.instances)CKEDITOR.instances[instance].updateElement()})});