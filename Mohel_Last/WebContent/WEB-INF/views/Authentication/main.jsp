<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼</title>
    <meta name="description" content="메인 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <script src="https://kit.fontawesome.com/301043e4a8.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="/resources/src/scroll.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body onLoad="main()">
    <!-- Header -->
    <header id="head">     
        <!-- Navbar -->
        <nav id="navbar">
            <div class="navbar__logo">
                <a href="Main"><img class="navbar__logo__img" src="/resources/imgs/common/logo.png"></a>
            </div>
            <ul class="navbar__menu">
                <li class="navbar__menu__item" onClick="myPageClick()" >마이페이지</li>
                <li class="navbar__menu__item" onClick="registerReq()">역경매등록</li>                    
                <li class="navbar__menu__item" id="logCk" value="로그인" onClick='login(this)'></li>
            </ul>
        </nav>      
        <!-- 홈화면(검색창) -->
        <div id="home">
            <div class="home__left">
                <h1 class="home__title">모두의 헬퍼</h1>            
                <div class="home__search">
                    <input type="text" class="home__search__input" name="wordValue">
                    <button onClick="searchClick()" class="home__search__btn"><i class="fas fa-search"></i></button>            
                </div>
                <!-- 대분류 -->
                <div class="category">
                    <ul class="category__menu">
                        <li class="category__menu__item">
                            <div class="category__menu-icon" onClick="filterClick(4)"><img src="/resources/imgs/main/icon1.png" class="category__img"></div>
                            <div class="category__menu-name">디자인</div>
                        </li>
                        <li class="category__menu__item">
                            <div class="category__menu-icon" onClick="filterClick(5)"><img src="/resources/imgs/main/icon2.png" class="category__img"></div>
                            <div class="category__menu-name">IT/프로그래밍</div>
                        </li>
                        <li class="category__menu__item">
                            <div class="category__menu-icon" onClick="filterClick(3)"><img src="/resources/imgs/main/icon3.png" class="category__img"></div>
                            <div class="category__menu-name">비즈니스</div>
                        </li>
                    </ul>
                    <ul class="category__menu">
                        <li class="category__menu__item">
                            <div class="category__menu-icon" onClick="filterClick(1)"><img src="/resources/imgs/main/icon4.png" class="category__img"></div>
                            <div class="category__menu-name">레슨</div>
                        </li>
                        <li class="category__menu__item">
                            <div class="category__menu-icon" onClick="filterClick(2)"><img src="/resources/imgs/main/icon5.png" class="category__img"></div>
                            <div class="category__menu-name">홈/리빙</div>
                        </li>
                        <li class="category__menu__item">
                            <div class="category__menu-icon" onClick="filterClick(6)"><img src="/resources/imgs/main/icon6.png" class="category__img"></div>
                            <div class="category__menu-name">건강/미용</div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="home__right">
                <img src="/resources/imgs/main/back.jpg" class="home__img">
            </div>
        </div>
    </header>
    <!-- Section -->
    <section id="service">       
        <!-- 역경매 리스트 -->
        <div class="list">
            <!-- 최신순 -->
            <div class="list__container">
                <h1 class="list__title">새로운 역경매</h1>
                <ul class="list__items" id="newRequestList"></ul>
                 <ul id="new" class="list__items"></ul>
                 
                <!-- 최신순 버튼이동 -->
                <button type="button" class="before-btn" onClick="beforeClick()"><i class="fas fa-angle-left"></i></button>
                <button type="button" class="after-btn" onClick="afterClick()"><i class="fas fa-angle-right"></i></button>
                 
            </div>
            <!-- 인기순 -->
            <div class="list__container">
                <h1 class="list__title">인기 역경매</h1>
                <ul class="list__items" id="topRequestList"></ul>
                 <ul id="best" class="list__items"></ul>
                
            </div>
        </div>    
    </section>
   <!-- Footer -->
    <footer id="foot">
        <p class="foot__rights">Copyright © 2021 Mohel | All rights reserved. | BAO</p>
    </footer>
    <!-- Arrow button -->
    <button class="arrow-btn">
        <i class="fas fa-arrow-up"></i>
    </button>
</body>
<script>
//최신순 버튼이동



session = "${mId}";


if(session == ""){ 
       document.getElementById("logCk").innerHTML ="로그인"; 
}else{
   document.getElementById("logCk").innerHTML ="로그아웃";
}  


//로그인 클릭 
function login(obj){


   
   var form = document.createElement("form");
   
   form.action = (obj.innerText == "로그아웃") ?  "Logout" : "LogInForm" ;
   
   form.method = "post";
   
   document.body.appendChild(form);
   
   form.submit();

}

var r=0;

function beforeClick(){
   
   $("#newRequestList").empty();   
   let requestList = JSON.parse('${requestData}');

        r -= 6;   
        if(r >= 0){
   
       for(let index = r; index < r+6; index++){
            
           let rqCode = requestList[index].rqCode;    
          let insertTr = " ";
          insertTr +=  "<li class='list__item' onClick='DetailClick("+ rqCode +")'>";
          insertTr += "<img class='list__item__img' src='../../resources/imgs/common/"+requestList[index].rqImage+"'>";
          insertTr += "<div class='list__item__description'>"
          insertTr += "<h4 class='list__item-mainCtg'>"+requestList[index].rqSubName+"</h4>";
          insertTr += "<div class='list__item-title'>"+requestList[index].rqTitle+"</div>";
          insertTr += "</div>";
          insertTr += "</li>";
          
          $("#newRequestList").append(insertTr);
          } 
        } else {
             r += 6;   
            for(let index = r; index < r+6; index++){
                 
                let rqCode = requestList[index].rqCode;    
               let insertTr = " ";
               insertTr +=  "<li class='list__item' onClick='DetailClick("+ rqCode +")'>";
               insertTr += "<img class='list__item__img' src='../../resources/imgs/common/"+requestList[index].rqImage+"'>";
               insertTr += "<div class='list__item__description'>"
               insertTr += "<h4 class='list__item-mainCtg'>"+requestList[index].rqSubName+"</h4>";
               insertTr += "<div class='list__item-title'>"+requestList[index].rqTitle+"</div>";
               insertTr += "</div>";
               insertTr += "</li>";
               
               $("#newRequestList").append(insertTr);
               } 
        }
} 


function afterClick(){
   
   $("#newRequestList").empty();   
   let requestList = JSON.parse('${requestData}');

        r += 6;   
        if(r < requestList.length){
   
       for(let index = r; index < r+6; index++){
            
           let rqCode = requestList[index].rqCode;    
          let insertTr = " ";
          insertTr +=  "<li class='list__item' onClick='DetailClick("+ rqCode +")'>";
          insertTr += "<img class='list__item__img' src='../../resources/imgs/common/"+requestList[index].rqImage+"'>";
          insertTr += "<div class='list__item__description'>"
          insertTr += "<h4 class='list__item-mainCtg'>"+requestList[index].rqSubName+"</h4>";
          insertTr += "<div class='list__item-title'>"+requestList[index].rqTitle+"</div>";
          insertTr += "</div>";
          insertTr += "</li>";
          
          $("#newRequestList").append(insertTr);
          } 
        } else {
             r -= 6;   
            for(let index = r; index < r+6; index++){
                 
                let rqCode = requestList[index].rqCode;    
               let insertTr = " ";
               insertTr +=  "<li class='list__item' onClick='DetailClick("+ rqCode +")'>";
               insertTr += "<img class='list__item__img' src='../../resources/imgs/common/"+requestList[index].rqImage+"'>";
               insertTr += "<div class='list__item__description'>"
               insertTr += "<h4 class='list__item-mainCtg'>"+requestList[index].rqSubName+"</h4>";
               insertTr += "<div class='list__item-title'>"+requestList[index].rqTitle+"</div>";
               insertTr += "</div>";
               insertTr += "</li>";
               
               $("#newRequestList").append(insertTr);
               } 
        }
} 



//최신순
if(JSON.parse('${requestData}').length != 0){
   filterScreen();  
}else{}
//인기순
if(JSON.parse('${requestBestData}').length != 0){
      filterBestScreen();  
}else{}

//온로드 
function main(){
   newScreen();
   bestScreen();
}

function newScreen(){
    let json = JSON.parse('${jsonData}');
    
      
     for(let i=0; i<6;i++){
         let rqCode = json[i].rqCode;
         let rqId = json[i].rqId;
         
         
      let insertTr= " ";
      insertTr += "<li class='list__item' onClick='DetailClick(\""+rqCode+"\",\""+rqId+"\");'>";
          
      insertTr += "<img class='list__item__img' src='/resources/imgs/common/"+json[i].rqImage+"'>";
      insertTr += "<div class='list__item__description'>";
      insertTr += "<h4 class='list__item-mainCtg'>"+json[i].rqSubName+"</h4>";
      insertTr += "<div class='list__item-title'>"+json[i].rqTitle+"</div>";
      insertTr += "</div>";
      insertTr += "</li>";
       
      $("#new").append(insertTr);
        
  }    
}

function bestScreen(){
      let json = JSON.parse('${list2}');   
      for(let i=0; i<6;i++){
         let rqCode = json[i].rqCode;
         let rqId = json[i].rqId;
         
         let insertTr= " ";
         insertTr += "<li class='list__item' onClick='DetailClick(\""+rqCode+"\",\""+rqId+"\");'>";
         insertTr +="<img class='list__item__img'src='/resources/imgs/common/"+json[i].rqImage+"'>";
         insertTr +="<div class='list__item__description'>"
         insertTr +="<h4 class='list__item-mainCtg'>"+json[i].rqSubName+"</h4>"
         insertTr +="<div class='list__item-title'>"+json[i].rqTitle+"</div>"
         insertTr +="</div>"
         insertTr +="</li>"

         $("#best").append(insertTr);
         }
   }


//최신순 
function filterScreen(){ 
    
    let requestList = JSON.parse('${requestData}');
    for(let index=0 ; index<6 ; index++){
      
        let rqCode = requestList[index].rqCode;   
        let rqId = requestList[index].rqId;
        
       let insertTr = " ";
       insertTr += "<li class='list__item' onClick='DetailClick(\""+rqCode+"\",\""+rqId+"\");'>";
       insertTr += "<img class='list__item__img' src='../../resources/imgs/common/"+requestList[index].rqImage+"'>";
       insertTr += "<div class='list__item__description'>"
       insertTr += "<h4 class='list__item-mainCtg'>"+requestList[index].rqSubName+"</h4>";
       insertTr += "<div class='list__item-title'>"+requestList[index].rqTitle+"</div>";
       insertTr += "</div>";
       insertTr += "</li>";
       
       $("#newRequestList").append(insertTr);
       } 
}    
//인기순  
function filterBestScreen(){ 
  
 let requestList = JSON.parse('${requestBestData}');
 for(let index=0 ; index<6; index++){
   
     let rqCode = requestList[index].rqCode;  
     let rqId = requestList[index].rqId;
     
    let insertTr = " ";
    insertTr += "<li class='list__item' onClick='DetailClick(\""+rqCode+"\",\""+rqId+"\");'>";
    insertTr += "<img class='list__item__img' src='../../resources/imgs/common/"+requestList[index].rqImage+"'>";
    insertTr += "<div class='list__item__description'>"
    insertTr += "<h4 class='list__item-mainCtg'>"+requestList[index].rqSubName+"</h4>";
    insertTr += "<div class='list__item-title'>"+requestList[index].rqTitle+"</div>";
    insertTr += "</div>";
    insertTr += "</li>";
    
    $("#topRequestList").append(insertTr); 
    } 
}

//대분류 클릭 
function filterClick(num){
    let rqFilterCode = (num*1000);     
//     for(i = 1; i < 7; i++){
//          if(num == i){
   let rqFilterName = rqFilterCode ==1000?"레슨":
               rqFilterCode ==2000?"홈/리빙":
                  rqFilterCode ==3000?"비즈니스":
                     rqFilterCode ==4000?"디자인":
                        rqFilterCode ==5000?"IT/프로그래밍":
                           rqFilterCode ==6000?"건강/미용":"";
   
              let form = document.createElement("form");
              let input = document.createElement("input");
              input.type = "hidden";
              input.name = "rqFilterCode";
              input.value = rqFilterCode;
              form.appendChild(input);
                  
              form.action = "Filter?rqFilterName="+rqFilterName;
              form.method = "Post";
           
              document.body.appendChild(form);
              form.submit();
//            }
    
    
 }    
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
 //검색 리스트 
function searchScreen(){
    
    let searchList = JSON.parse('${searchData}');
 for(let index=0 ; index<searchList.length ; index++){
      
     let rqCode = searchList[index].rqCode;    
     let rqId = searchList[index].rqId;
     
    let insertTr = " ";
    insertTr += "<li class='list__item' onClick='DetailClick(\""+rqCode+"\",\""+rqId+"\");'>";
    insertTr += "<img class='list__item__img' src='../../resources/imgs/common/"+searchList[index].rqImage+"'>";
    insertTr += "<div class='list__item__description'>"
    insertTr += "<h4 class='list__item-mainCtg'>"+searchList[index].rqSubName+"</h4>";
    insertTr += "<div class='list__item-title'>"+searchList[index].rqTitle+"</div>";
    insertTr += "</div>";
    insertTr += "</li>";
    
    $("#searchData").append(insertTr);
  }
 } 
 //검색 인기 리스트 
 function BestSearchScreen(){
    
    let searchList = JSON.parse('${searchBestData}');
 for(let index=0 ; index<6 ; index++){
      
     let rqCode = searchList[index].rqCode; 
     let rqId = searchList[index].rqId;
     
    let insertTr = " ";
    insertTr += "<li class='list__item' onClick='DetailClick(\""+rqCode+"\",\""+rqId+"\");'>";
    insertTr += "<img class='list__item__img' src='../../resources/imgs/common/"+searchList[index].rqImage+"'>";
    insertTr += "<div class='list__item__description'>"
    insertTr += "<h4 class='list__item-mainCtg'>"+searchList[index].rqSubName+"</h4>";
    insertTr += "<div class='list__item-title'>"+searchList[index].rqTitle+"</div>";
    insertTr += "</div>";
    insertTr += "</li>";
    
    $("#topSearchData").append(insertTr);
  }
 } 
 //경매 클릭 
 function DetailClick(value, v){
     let rqCode = value;
     let rqId = v;
     let form = document.createElement("form");
     form.action = "Detail";
     form.method = "Post";
     
     let input = document.createElement("input");
           input.type = "hidden";
           input.name = "rqCode";
           input.value = rqCode;
           form.appendChild(input);
           
           
     let input2 = document.createElement("input");
          input2.type = "hidden";
          input2.name = "rqDetailSelect";
          input2.value = "bh";
          form.appendChild(input2);  
          
          let input3 = document.createElement("input");
          input3.type = "hidden";
          input3.name = "rqId";
          input3.value = rqId;
          
          form.appendChild(input3);
 
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

//경매글 올리기
function registerReq(){
    let form = document.createElement("form");
     form.action = "DealForm";
     form.method = "Post";
     document.body.appendChild(form);
     form.submit();
 
}

</script>
</html>