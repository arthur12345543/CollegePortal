function countDown(){time--,gett("container").innerHTML=time,time==0&&(window.location=page)}function gett(e){if(document.getElementById)return document.getElementById(e);if(document.all)return document.all.id;if(document.layers)return document.layers.id;if(window.opera)return window.opera.id}function init(){gett("container")?(setInterval(countDown,1e3),gett("container").innerHTML=time):setTimeout(init,50)}var time=10,page="../../";document.onload=init();