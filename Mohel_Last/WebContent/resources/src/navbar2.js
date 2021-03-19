'use strict';

function waitingClick(){
   let form = document.createElement("form");
      form.action = "WaitingWisher";
      form.method = "Post";   
                     
      document.body.appendChild(form);
      form.submit();
   }

function IngClick(){
   let form = document.createElement("form");
      form.action = "IngWisher";
      form.method = "Post";   
                     
      document.body.appendChild(form);
      form.submit();
}
function endClick(){
   let form = document.createElement("form");
      form.action = "EndWisher";
      form.method = "Post";   
                     
      document.body.appendChild(form);
      form.submit();
}

function sendBox(){
	let form = document.createElement("form");
	form.action="SendBox";
	form.method="POST";
	document.body.appendChild(form);
	form.submit();
}
function recBox(){
	let form = document.createElement("form");
	form.action="RecBox";
	form.method="POST";
	document.body.appendChild(form);
	form.submit();
}
function msgForm(){
	
		let form = document.createElement("form");
		form.action="MsgForm";
		form.method="POST";
		document.body.appendChild(form);
		form.submit();
}


