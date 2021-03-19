<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 역경매</title>
    <meta name="description" content="dealDetail 진행전 helper 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <script src="https://kit.fontawesome.com/301043e4a8.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/src/bidding.js" defer></script>
    <script src="/resources/src/navbar.js" defer></script>
</head>
<body onload="init()">

    <!-- Navbar -->
    <%@ include file="/WEB-INF/views/common/navbar.jsp" %>
    
    <section class="deal mypage">
                <h2 class="mypage__title"><div id="rqTitle"></div></h2>
        <!-- Request -->
        
        <div class="deal__container">
            <div class="deal__img">
                <div id="rqImage"></div>
            </div>
            <div class="deal__info__container">
                <table class="deal__info"> 
                    <tr class="deal__list">
                        <th class="deal__title" style="width:300px">기간</th>
                        <td class="deal__contents"><span id="rqDate"></span> ~ <span id="rqPeriod"></span></td>
                    </tr>
                    <tr class="deal__list">
                        <th class="deal__title">분야</th>
                        <td class="deal__contents"><div id="rqSubName"></div></td>
                    </tr>
                    <tr class="deal__list">
                        <th class="deal__title">지역</th>
                        <td class="deal__contents"><div id="rqRcName"></div></td>
                    </tr>
                    <tr class="profile__list">
                        <th class="deal__title" >내용</th>
                        <td class="deal__contents">
                            <div id="rqComment"></div>
                        </td>
                    </tr>
                </table>       
<!--                           <input type="hidden" name="rqCode" id="rqCode"> -->
            <input type="hidden" name="rqId" id="rqId">   
            <input type="hidden" name="rqImage" id="rqImage"> 
<div class="deal__button">
                    <button type="button" class="deal__btn2 bidding__btn">입찰하기</button>
                </div>

                <!-- 입찰 모달 시작 -->
                <div class="modal__container" id="modal">
                    <div class="modal">
                        <button class="close-btn" id="close">
                            <i class="fa fa-times"></i>
                        </button>
                        <div class="modal__header">
                            <div class="modal__header__title">입찰하기</div>
                        </div>
                        <div class="modal__content">
                            <form class="modal__form">
                                <div>
                                    <label for="bidding-price" class="bidding-price-label">입찰금액</label>
                                    <input type="text" id="bidding-price" name="biPrice">
                                    <input type="hidden" id="biMmHelper" name="biMmHelper2">
                                </div>
                                <div class="bidding-price-btn__container">
                                    <button type="button" class="bidding-price-btn" onClick = "bid()">신중하게 입찰하기</button>
                                </div>    
                            </form>
                        </div>
                    </div>
                </div>
                <!-- 입찰 모달 끝 -->
                     
            </div>
        </div>
        <!-- Bidding -->
        <table class="bidding" id ="best"> 
            <caption class="bidding__title">입찰기록내역</caption>
            <colgroup>
                <col style="width: 60%;">
                <col style="width: 40%;">
            </colgroup>               
            <thead>   
                <tr>
                    <th class="bidding__head right" >입찰자</th>
                    <th class="bidding__head">금액</th>
                    
                </tr>
            </thead>
                           
        </table>        
    </section> 
    <input type = "hidden" name = "biCode" id ="rqCode" />
        <input type = "hidden" name = "biHelper"  id ="biHelper"/>
    
</body>
<script>

   function init(){
        
        let biHelper = '${mId}';
       $('#biHelper').val(biHelper);
       
      let json = JSON.parse('${detail}'); 
       
      let rqTitle = json[0].rqTitle;        
       $('#rqTitle').append(rqTitle);      
   
       let rqComment = json[0].rqComment;            
       $('#rqComment').append(rqComment);      
   
      let rqPeriod = json[0].rqPeriod;              
       $('#rqPeriod').append(rqPeriod);
   
      let rqRcName = json[0].rqRcName;       
       $('#rqRcName').append(rqRcName);
      
       let rqSubName = json[0].rqSubName; 
       $('#rqSubName').append(rqSubName);
       
       let rqCode = json[0].rqCode;
       $('#rqCode').val(rqCode);
       
       let rqId = json[0].rqId;
       $('#rqId').val(rqId);
             
       let rqDate = json[0].rqDate;
       $('#rqDate').append(rqDate);

       let rqImage=" ";
 	   rqImage += "<img src='../../resources/imgs/common/"+json[0].rqImage+"' class='deal__img'>"
   	   $('#rqImage').append(rqImage);  
                               
        let bidInfojson = JSON.parse('${bidList}');             
          
         for(let i=0; i< 15; i++){         
            let biMmHelperview = bidInfojson[i].biMmHelperview;
            let biPrice = bidInfojson[i].biPrice;
            
            let insertTr= " ";
            insertTr += "<tr>"
               insertTr += "<td class='bidding__data right'><button type='button' class='bidding__data__id' onClick = 'prClick(\""+biMmHelperview+"\")'>"+bidInfojson[i].biMmHelperview+"</button></td>"
               insertTr += "<td class='bidding__data right'><div name='winPrice'>"+bidInfojson[i].biPrice+"원</div>   </td>"
               insertTr +=  "</tr>"
                        
            $("#best").append(insertTr);   
   }        
  }
   function prClick(obj){
           
      let input  = document.createElement("input");
      input.type = "hidden";
      input.name = "mId";
      input.value = obj;
           
      let form = document.createElement("form");
      form.action = "ClickProfile";
      form.method = "post";
      form.appendChild(input);
      document.body.appendChild(form);
      form.submit();      
   }
   
function bid(){
   
	let biRqCode = document.getElementsByName("biCode")[0];
	let biHelper = document.getElementsByName("biHelper")[0];
	let biPrice = document.getElementsByName("biPrice")[0];
        
     let form = document.createElement("form");
     form.action = "RegisterBid";
     form.method = "post";    
  
     if(biPrice.value%1000==0){
        alert("입찰 성공");
        form.appendChild(biRqCode);
        form.appendChild(biHelper);
        form.appendChild(biPrice);
        document.body.appendChild(form);
        form.submit();
     }else{
        alert("천원단위만 가능합니다.");
           return form;
     }
} 

</script>
</html>