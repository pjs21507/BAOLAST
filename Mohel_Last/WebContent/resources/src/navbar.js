'use strict';

//검색클릭 
function searchClick(){
    
   let form = document.createElement("form");
   let rqWord = document.getElementsByName("wordValue")[0].value;
    
   let input = document.createElement("input");
   input.type = "hidden";
   input.name = "rqWord";
   input.value = rqWord;
  
   form.action = "Search";
   form.method = "Post";    
   form.appendChild(input);
    
   document.body.appendChild(form);
   form.submit();  
 }

//마이페이지 클릭 
function myPageClick(){
   let form = document.createElement("form");
   form.action = "MyProfile";
   form.method = "Post";
   document.body.appendChild(form);
   form.submit();
}

//역경매 등록
function registerReq(){
	 let form = document.createElement("form");
     form.action = "DealForm";
     form.method = "Post";
     document.body.appendChild(form);
     form.submit(); 
}

//로그아웃
function logout(){
    let form = document.createElement("form");
    form.action = "Logout";
    form.method = "post";
    document.body.appendChild(form);
    form.submit();
 }