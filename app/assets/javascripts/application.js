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
//= require ckeditor/init
//= require jquery
//= require jquery_ujs


function ForwardSlide()
{
	i += 1;
	var LAPhoto = document.getElementById('LAPhoto');
    LAPhoto.src = URLOfPhotos[i];
    if(i==maxSlide)
    {
    	i = 0;
    } 
}

function GoSlide()
{	
	var LAPhoto = document.getElementById('LAPhoto');

    for(var g = 0; g <= 100; g++)
    {
        plus -= 0.15;
        LAPhoto.style.opacity = plus;
        if(plus<=0)
        {
        	plus = 0.1;
        	break;
        }
        setTimeout("",100);
    }
    LAPhoto.src = URLOfPhotos[i];
    LAPhoto.style.opacity = 0.1;
    for(var g = 0; g <= 100; g++)
    {
        plus += 0.15;
        LAPhoto.style.opacity = plus;
        if(plus>=1.0)
        {
        	plus = 1.0;
        	break;
        } 
        setTimeout("",100);
    }
    i++;
    if(i==maxSlide)
    {
    	i = 0;
    }
    setTimeout(GoSlide,3000);
}

$(document).ready(function() {	
	$('#nav li').mouseover(function(){
	  $('ul', this).stop().slideDown('200'); 
	  $(this).children('a:first').addClass("hov");
	});
	$('#nav li').mouseout(function(){
	  $('ul', this).stop().slideUp('200'); 
	  $(this).children('a:first').removeClass("hov");		
	});
	
});

  $(document).ready(function(){  
    $('form[data-remote]').bind("ajax:before", function(){
      for (instance in CKEDITOR.instances){
        CKEDITOR.instances[instance].updateElement();
      }
    });
  });
  
  