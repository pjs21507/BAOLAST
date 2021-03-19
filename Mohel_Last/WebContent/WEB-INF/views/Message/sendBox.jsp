<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 보낸 메시지함</title>
    <meta name="description" content="보낸 메시지 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="https://kit.fontawesome.com/301043e4a8.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <script src="/resources/src/navbar.js" defer></script>
    <script src="/resources/src/navbar2.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body onLoad="init()">

    <!-- Navbar -->
    <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

    <!--Mypage Navbar -->
	<%@ include file="/WEB-INF/views/common/navbar2.jsp" %>

    <!-- Message List -->
    <section class="message mypage">
        <div class="message__container">
            <h2 class="mypage__title">보낸 메시지함</h2>
            <table class="message__info"> 
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 12%;">
                    <col style="width: 68%;">
                    <col style="width: 15%;">
                </colgroup>               
                <thead>
                    <tr>
                        <th class="message__head"><i class="fas fa-envelope"></i></th>
                        <th class="message__head">받는사람</th>
                        <th class="message__head">제목</th>
                        <th class="message__head">전송시간</th>
                    </tr>
                </thead>
                <tbody id="sendDiv">
                 
                </tbody>                      
            </table>
            <div class="message__move">
                <ul class="message__move__list">
                    <li class="message__list"><a class="message__arrow" href="#"><i class="fas fa-arrow-left"></i></a></li>
                    <li class="message__list"><a class="message__num" href="#">1</a></li>
                    <li class="message__list"><a class="message__num" href="#">2</a></li>
                    <li class="message__list"><a class="message__num" href="#">3</a></li>
                    <li class="message__list"><a class="message__num" href="#">4</a></li>
                    <li class="message__list"><a class="message__num" href="#">5</a></li>
                    <li class="message__list"><a class="message__arrow" href="#"><i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </div>
        </div>
    </section>
    
    <!-- 프로필 클릭 모달 시작 -->
    <%@ include file="/WEB-INF/views/common/profileClick.jsp" %>         
    <!-- 프로필 클릭 모달 끝 -->
       
</body>
<script>
function init(){

	let send = JSON.parse('${SendList}');
	
	for(let i=0;i<send.length;i++){
	
		    	
	let insertTr= " ";
	insertTr += "<tr>";
	insertTr += "<td class='message__data'><i class='fas fa-envelope'></i></td>";
	insertTr += "<td class='message__data profile-btn' onClick='showModal("+i+")'>"+ send[i].msRecipient +"</td>";
	insertTr += "<td class='message__data message__title' onClick='msgDetail("+i+")'>"+send[i].msTitle+"</td>";
	insertTr += "<td class='message__data'>"+send[i].msDate+"</td>";
	insertTr += "</tr>";
   
    $("#sendDiv").append(insertTr);   
	}
		
}

//Show modal
const modal = document.getElementById('modal');
function showModal(i){
	let send = JSON.parse('${SendList}');
	modal.classList.add('show-modal');		
	    
		let msRecipient =send[i].msRecipient;
		$(".modal__content__value1").append(msRecipient);

		let mEmail=send[i].mEmail;
		$(".modal__content__value2").append(mEmail);

		let mRccode=send[i].mRccode; 
		$(".modal__content__value3").append(mRccode);

		let mDivision=send[i].mDivision;
		$(".modal__content__value4").append(mDivision);

		let mCareer=send[i].mCareer;
		$(".modal__content__value5").append(mCareer);
		
	}

//Hide modal
const close = document.getElementById('close');
close.addEventListener('click', () => {
    modal.classList.remove('show-modal');
       
    $(".modal__content__value1").empty();
    $(".modal__content__value2").empty();
    $(".modal__content__value3").empty();
    $(".modal__content__value4").empty();
    $(".modal__content__value5").empty();
    
});
        
//Hide modal(모달창 외부 클릭해서 닫기)
window.addEventListener('click', (e) => {
    e.target === modal ? 
			    		modal.classList.remove('show-modal') ||  
			    		$(".modal__content__value1").empty() && 
					    $(".modal__content__value2").empty() && 
					    $(".modal__content__value3").empty() && 
					    $(".modal__content__value4").empty() && 
					    $(".modal__content__value5").empty() 
					    										: false;
});



function msgDetail(i){
	//서버전송 
	let send = JSON.parse('${SendList}');
	let sendData = "msRecipient="+send[i].msRecipient+"&msSender="+send[i].msSender+"&msDate="+send[i].msDate+"&msTitle="+send[i].msTitle+"&msComment="+send[i].msComment+"&msStatus="+send[i].msStatus;
	alert(sendData);
	
	let form = document.createElement("form");
	form.action="Title?"+sendData;
	form.method="POST";
	document.body.appendChild(form);
	form.submit();
	
}


</script>
</html>