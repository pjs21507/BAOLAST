<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 메시지</title>
    <meta name="description" content="메시지 디테일 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <script src="https://kit.fontawesome.com/301043e4a8.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="/resources/src/navbar.js" defer></script>
    <script src="/resources/src/navbar2.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body onLoad="init()">
    
    <!-- Navbar -->
    <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

    <!--Mypage Navbar -->
	<%@ include file="/WEB-INF/views/common/navbar2.jsp" %>
    
    <!-- Message Detail -->
    <section class="msgDetail mypage">
      <section id="messageDetail"></section>
    </section>
</body>
<script>
function init(){
	let msg = JSON.parse('${dataList}');
	
	let insertLi= " ";
	insertLi += "<h2 class='mypage__title'>메시지</h2>";
	insertLi += "<ul class='msgDeatil__info'>";
	insertLi += "<li class='msgDetail-title'>제목 "+msg[0].msTitle+"</li>";
	insertLi += "<li class='msgDetail-sender'>보낸사람<span class='sender'>"+msg[0].msSender+"</span></li>";
	insertLi += "<li class='msgDetail-recipient'>받는사람<span class='recipient'>"+msg[0].msRecipient+"</span></li>";
	insertLi += "</ul>";
	insertLi += "<div class='msgDetail__contents'>"+msg[0].msComment+"</div>";
	insertLi += "<div class='mypage__bottom'>";
	insertLi += "<button type='button' class='mypage__btn' onClick='msgReply()'>답장하기</button>";
	insertLi += "</div>";
   
    $("#messageDetail").append(insertLi);

	
}

function msgReply(){
	//서버전송
	let msg = JSON.parse('${dataList}');
	
		let sendData = "msRecipient="+msg[0].msRecipient+"&msSender="+msg[0].msSender+"&msDate="+msg[0].msDate+"&msTitle="+msg[0].msTitle+"&msComment="+msg[0].msComment+"&msStatus="+msg[0].msStatus;
		alert(sendData);
		
		let form = document.createElement("form");
		form.action="MsgReplyForm?"+sendData;
		form.method="POST";
		document.body.appendChild(form);
		form.submit();
}


</script>
</html>