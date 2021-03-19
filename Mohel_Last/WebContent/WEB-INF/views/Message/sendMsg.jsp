<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 메시지 쓰기</title>
    <meta name="description" content="메시지 보내는 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="/resources/src/main.js" defer></script>
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
    
    <!-- Send Message -->
    <section class="sendMsg mypage">
        <h2 class="mypage__title">메시지 쓰기</h2>
        <form name="sendInfo" id="sendInfo" action="Send" method="POST">
            <table class="sendMsg__info"> 
                <tbody>
                    <tr class="sendMsg__list">
                        <th class="sendMsg__title"><label for="sendMsg-recipient">받는사람</label></th>
                        <td class="sendMsg__contents"><input class="sendMsg__input" type="text" id="sendMsg-recipient" name="sendMsg-recipient"></td>
                    </tr>
                    <tr class="sendMsg__list">
                        <th class="sendMsg__title"><label for="sendMsg-title">제목</label></th>
                        <td class="sendMsg__contents"><input class="sendMsg__input" type="text" id="sendMsg-title" name="sendMsg-title"></td>
                    </tr>
                </tbody>
            </table>
            <div class="sendMsg__textarea">
                <textarea id="sendMsg-contents" name="sendMsg-contents" cols="139" rows="25"></textarea>            
            </div>
            <div class="mypage__bottom">
                <button type="button" class="mypage__btn" id="sendMessage">보내기</button>
            </div>
        </form>
    </section>
</body>
<script>
function init(){
	let msg = '${dataList}';
	if(msg){
		msg=JSON.parse('${dataList}');
	}else{
		msg="";
	}
	
	if(msg){
		let sender = msg[0].msSender;
		
		$(document).ready(function() {
	        $('#sendMsg-recipient').val(sender);
	    });		
		
	 let comment = " ";
	 comment +="<p><br></p>";
	 comment +="\n-----------------------original message--------------------------------";
	 comment +="\n From : "+ msg[0].msSender;
	 comment +="\n To : "+ msg[0].msRecipient;
	 comment +="\n Sent : "+ msg[0].msDate;
	 comment +="\n Subject : "+ msg[0].msTitle;
	 comment +="\n\n"+ msg[0].msComment;
	 
	 $("#sendMsg-contents").append(comment);

	}else if('${mId}'!=null){
		let sender = '${mId}';
			
	}
	 $(function() {
			$('#sendMessage').click(function(){

				let msg = '${dataList}';
				if(msg){
					msg=JSON.parse('${dataList}');
				}else{
					msg="";
				}
				
				if(msg){
					
					let msSender = '${mId}';
					let msRecipient = $('#sendMsg-recipient').val();
					let msTitle = $('#sendMsg-title').val();
					let msComment = $('#sendMsg-contents').val();
					
					let form = document.createElement("form");
					form.action="SendMsg?msSender="+msSender+"&msRecipient="+msRecipient+"&msTitle="+msTitle+"&msComment="+msComment+"&msDate=&msStatus=";
					form.method="POST";
					document.body.appendChild(form);
					form.submit();
							
					let con = alert("메세지 전송이 완료되었습니다.");	
				}else if('${mId}'!=null){
					let msSender = '${mId}';
					let msRecipient = $('#sendMsg-recipient').val();
					let msTitle = $('#sendMsg-title').val();
					let msComment = $('#sendMsg-contents').val();
					
					let form = document.createElement("form");
					form.action="SendMsg?msSender="+msSender+"&msRecipient="+msRecipient+"&msTitle="+msTitle+"&msComment="+msComment+"&msDate=&msStatus=";
					form.method="POST";
					document.body.appendChild(form);
					form.submit();
							
					let con = alert("메세지 전송이 완료되었습니다.");	
				}
			});
	});	
	

}
</script>
</html>