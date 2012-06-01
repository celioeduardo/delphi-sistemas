// JavaScript Document
<!--

//document.onmousedown = checaMouse;
if (document.layers) {
document.captureEvents(Event.MOUSEDOWN)
}
var xCode='';
function checaTecla(e) {
   if (event.altKey) {
   alert('(c) Copyright 1997-2003 Spetson Network Japan.');
   }
   if (event.ctrlKey) {
   alert('(c) Copyright 1997-2003 Spetson Network Japan.');
   }
   else {
   outraTecla(e);
   }
   }
function outraTecla(e) {
   isNetscape=(document.layers);
   eventChooser = (isNetscape) ? keyStroke.which : event.keyCode;
   which = String.fromCharCode(eventChooser);
   xCode=which.charCodeAt(0);
   if (xCode == 122){
   window.event.keyCode=0;
   alert('Esta página da web é melhor visualizada em tela cheia!');
   return false;
   }
   if (xCode == 36){
   window.event.keyCode=0;
   alert('(c) Copyright 1997-2003 Spetson Network Japan.');
   return false;
   }
   if(xCode == 91){
   window.event.keyCode=0;
   alert('(c) Copyright 1997-2003 Spetson Network Japan.');
   return false;
   }
   
   if(xCode == 116){
   window.event.keyCode=0;
   alert('(c) Copyright 1997-2003 Spetson Network Japan.');
   return false;
   }
   
   }
function checaMouse(e) {
    if (navigator.appName == "Netscape") {
    if (e.which == 2) { alert("(c) Copyright 1997-2003 Spetson Network Japan."); 
	return false; 
	}
	
    }
    else { 
	if (event.button == 2) { 
	alert("(c) Copyright 1997-2003 Spetson Network Japan.");
	 return false; 
	 } 
	 }
}

function popUp(url,w,h) {
var pop
var url
largura = (screen.width/2)-(w/2);
altura = (screen.height/2)-(h/2);
if(pop!=null && !pop.closed){
pop.close()
}
pop = window.open(url,'spetson','scrollbars=yes,menubar=0,toolbar=0,location=0,directories=0,status=0,resizable=1,top='+altura+',left='+largura+',width='+w+',height='+h);
pop.focus();
}