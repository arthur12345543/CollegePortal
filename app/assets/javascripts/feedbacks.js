var time = 10; //How long (in seconds) to countdown
var page = "../../"; //The page to redirect to
function countDown(){
time--;
gett("container").innerHTML = time;
if(time == 0){
window.location = page;
}
}
function gett(id){
if(document.getElementById) return document.getElementById(id);
if(document.all) return document.all.id;
if(document.layers) return document.layers.id;
if(window.opera) return window.opera.id;
}
function init(){
if(gett('container')){
setInterval(countDown, 1000);
gett("container").innerHTML = time;
}
else{
setTimeout(init, 50);
}
}
document.onload = init();