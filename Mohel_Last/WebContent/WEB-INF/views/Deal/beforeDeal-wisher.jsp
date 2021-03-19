<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 역경매</title>
    <meta name="description" content="dealDetail 진행전 wisher 페이지">
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
                        <th class="deal__title">기간</th>
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
                        <th class="deal__title">내용</th>
                        <td class="deal__contents">
                            <div id="rqComment"></div>
                        </td>
                    </tr>
                </table>                
           
            <input type="hidden" name="rqCode" id="rqCode">
            
            <input type="hidden" name="rqImage" id="rqImage">
                <div class="deal__button">
                    <button type="button" class="deal__btn1" onclick="modify()">수정하기</button>
                    <button type="button" class="deal__btn2" onclick="deletez()">삭제하기</button>           
              </div>
                  </div>
            </div>
            <table class="bidding" id="best"> 
            <caption class="bidding__title">입찰기록내역</caption> 
            <button type="button" id ="rejectMsg"  onClick = "rejectMsg()">모든 입찰 거절하기</button>
          
            <colgroup>
                <col style="width: 45%;">
                <col style="width: 35%;">
                <col style="width: 20%;">
            </colgroup>               
            <thead>
                <tr>
                    <th class="bidding__head right">입찰자</th>
                    <th class="bidding__head">금액</th>
                    <th class="bidding__head">낙찰</th>
                </tr>
            </thead>
                             <!-- <section id="best"></section> -->
        </table>
                 
                 
                 <input type = "hidden" name = "winRqCode"  id ="winRqCode"/>
                 <input type = "hidden" name = "rqCode"  id ="rqCode"/> 
            <input type="hidden" name="rqId" id="rqId"/>
            <input type="hidden" name="biCode" id="biCode"/>   
            <input type="hidden" name="biMmHelper" id="biMmHelper"/>
               
                  
               
               
    </section>   

<script>

function init(){
   
   
   let json = JSON.parse('${detail}');
      let rqImage=" ";
       rqImage += "<img src='../../resources/imgs/common/"+json[0].rqImage+"' class='deal__img'>"
       $('#rqImage').append(rqImage);
       
      let rqTitle = json[0].rqTitle;
       
       
       $('#rqTitle').append(rqTitle);
       
   //------------------------------------------------------------------------------
       let rqComment = json[0].rqComment;
       
       
       $('#rqComment').append(rqComment);
      
   //------------------------------------------------------------------------------
      let rqPeriod = json[0].rqPeriod;
       
       
       $('#rqPeriod').append(rqPeriod);

   //------------------------------------------------------------------------------
      let rqRcName = json[0].rqRcName;
      
      
       $('#rqRcName').append(rqRcName);
      
       let rqSubName = json[0].rqSubName;
       
       
       $('#rqSubName').append(rqSubName);
       
       let rqCode = json[0].rqCode;
       $('#rqCode').val(rqCode);
       
       let biCode = json[0].rqCode;
       $('#biCode').val(biCode);
       
       let rqId = json[0].rqId;       
       $('#rqId').val(rqId);
       
       
       let rqDate = json[0].rqDate;
       $('#rqDate').append(rqDate);
       
       
   //-------------------------------------------------------------
   
   
   

   let winRqCode = json[0].rqCode;
   $('#winRqCode').val(winRqCode);
   

   
           
    
    var wiBidInfo = JSON.parse('${bidList}');  
          
   
      for( i=0; i<15; i++){         
            
         var biMmHelperview = wiBidInfo[i].biMmHelperview;
         var biPrice = wiBidInfo[i].biPrice;
         
         let insertTr= " ";
         insertTr += "<tr>"
            insertTr += "<td class='bidding__data right'><button type='button' class='bidding__data__id' onClick = 'prClick(\""+biMmHelperview+"\")'>"+wiBidInfo[i].biMmHelperview+"</button></td>"
                                                                                                              
            insertTr += "<td class='bidding__data right'><div name='winPrice'>"+wiBidInfo[i].biPrice+"원</div></td>"
            insertTr += "<td class='bidding__data'><button type='button' class='bidding__data__choice'  onClick='accept("+biPrice+",\""+biMmHelperview+"\");' >선택</td>"
            insertTr +=  "</tr>"
   
            
         $("#best").append(insertTr);

         
      }
   
}






//포문을 없애고 1  2 3 4 5 파라미터를 넣고 액셉트 괄호안에 
// 액셉트  파라미터 받고 초이스에서 
let biMmHelper = '${mId}';
$('#biMmHelper').val(biMmHelper);
function accept(obj , onj){
   
      let winRqCode = document.getElementsByName("winRqCode")[0]; // 이거 rqcode 가져오는거고
      let rqCode = document.getElementsByName("rqCode")[0];
      let rqId = document.getElementsByName("rqId")[0]; // 
      
      
            
      
      
 
      
      
      let biPrice = document.createElement("input");
      biPrice.type = "hidden";
      biPrice.name = "winPrice";
      biPrice.value = obj;
      
   
      let winHelper = document.createElement("input");
      winHelper.type = "hidden";
      winHelper.name = "winHelper"; 
      winHelper.value = onj;

      var a = confirm("정말로 낙찰 하시겠습니까?");
      
      if(a == true){
         alert("낙찰 하셨습니다.");
      let form = document.createElement("form");
      form.action = "Accept";
      form.method = "post";  
      
          form.appendChild(winRqCode);
          form.appendChild(rqCode);
          form.appendChild(winHelper);
          form.appendChild(biPrice);
          form.appendChild(rqId);
          
          
         document.body.appendChild(form);
         form.submit();
         }else {
            return false;
         }
      
}      
       
      
      
      


function prClick(obj){
   
   
   alert(obj);//
   
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


   
    

function  rejectMsg(){
   
   let rqId = document.getElementsByName("rqId")[0]; //    
   let rqCode = document.getElementsByName("rqCode")[0];

   
   
	var a = confirm("삭제하시겠습니까?");   
   
	if(a == true){
	let form = document.createElement("form");
   form.action = "Reject";
   form.method = "post";
   form.appendChild(rqCode);
   form.appendChild(rqId);

   
   document.body.appendChild(form);
   form.submit();
	}else{
		alert("취소되었습니다.");
	}
}

function modify(){
    var yn = confirm("수정 하시겠습니까?");
    
    if(yn == true){
     
    var rqCode = document.getElementsByName("rqCode")[0];
    
    var rqId = document.getElementsByName("rqId")[0];
        
    var form = document.createElement("form");
     form.action="ModifyForm";
     form.post="post";
     
     form.appendChild(rqCode);
     form.appendChild(rqId);
     
     document.body.appendChild(form);
       
       
       form.submit();
       
          }else{
             alert("취소되었습니다.");
          }
    }
 
 function deletez(){
var yn = prompt("삭제 하시려먼 '삭제' 라고 적어주세요");
    
    if(yn == "삭제"){
       var rqCode = document.getElementsByName("rqCode")[0];
       var rqId = document.getElementsByName("rqId")[0];

    var form = document.createElement("form");
     form.action="Delete";
     form.post="post";
     
     form.appendChild(rqCode);
     form.appendChild(rqId);
     
     document.body.appendChild(form);
       
       
       form.submit();
    
    }else{
       alert("취소되었습니다.");
    }
 }


   
</script>

</html>