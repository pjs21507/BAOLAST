<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 스케쥴 위시어</title>
    <meta name="description" content="스케쥴 위시어 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <script src="https://kit.fontawesome.com/301043e4a8.js" crossorigin="anonymous"></script>
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
    
    <!-- Send Schedule -->
    <section class="schedule mypage">
        <h2 class="mypage__title">스케쥴</h2>
        <form name="area" action="" method="POST">
            <table class="schedule__info"> 
                <tbody >
                    <tr class="sendMsg__list">
						<th class="schedule__title"><div id="schedule-main"></div></th>
						<td class="schedule__contents"><div id="schedule-sub"></div></td>
                        <th class="schedule__title"><label for="schedule-wisher">WISHER:</label></th>
						<td class="schedule__contents"><div id="schedule-wisher"></div></td>
					</tr>
					<tr class="sendMsg__list">
						<th class="schedule__title"><label for="schedule-title">제목:</label></th>
						<td class="schedule__contents"><div id="schedule-title" ></div></td>
                        <th class="schedule__title"><label for="schedule-helper">HELPER:</label></th>
						<td class="schedule__contents"><div id="schedule-helper" ></div></td>
					</tr>
                    <tr class="sendMsg__list">
						<th class="schedule__title"><label for="schedule-period"></label></th>
						<td class="schedule__contents"></td>
						<th class="schedule__title"><label for="schedule-period"></label></th>
					</tr>
                </tbody>
            </table>
            <div class="schedule__textarea" name="textarea">
                <div>STEP1  기간 : <input type="date" id="schedule_date1" name="tag"><span class="mypage_ok"></span></div>
                <textarea id="schedule-contents1" name="schedule-contents" cols="120" rows="10"></textarea>
                <section id="step"></section>         
            </div>
                   <input type="hidden" id="schedule-code" /><input type="hidden" id="schedule-status" />
            <div class="mypage__bottom">
                
            </div>
        </form>
    </section>
</body>
<script>
function init(){
	
	let schedule = JSON.parse('${scInfo}');
	alert('${scInfo}');
	
	let scCode = schedule[0].scCode;
	let scFilter = schedule[0].scFilterName;
	let scSub = "> "+schedule[0].scSubName;
	let scWisher = schedule[0].scWisher;
	let scHelper = schedule[0].scHelper;
	let sdTitle = schedule[0].sdTitle;
	let sdComment = schedule[0].sdComment;
    let scStatus = schedule[0].scStatus;
	
// 	//날짜 포맷  
	let sdPeriod = schedule[0].sdPeriod;
	if(sdPeriod){

	 $("#schedule_date1").val(sdPeriod);
	}
    
	 $("#schedule-code").val(scCode); 
	 $("#schedule-main").append(scFilter);
	 $("#schedule-sub").append(scSub);
	 $("#schedule-title").append(sdTitle);
	 $("#schedule-wisher").append(scWisher);
	 $("#schedule-helper").append(scHelper);
	 $("#schedule-contents1").append(sdComment);

	 if(sdComment){
	 for(let index=1;index<schedule.length;index++){
		 
		//날짜 포맷  
			let sdPeriod = schedule[index].sdPeriod;

			
			let sdComment = schedule[index].sdComment;
			
		 
		 let plusArea = " ";
		 plusArea += "<div>STEP"+(index+1)+" 기간 : <input type='date' id= 'schedule_date"+(index+1)+"' name='tag'><span class='mypage_ok"+(index+1)+"'></span></div>";
   	     plusArea += "<textarea id='schedule-contents"+(index+1)+"' name='schedule-contents' cols='120' rows='10'></textarea>";     
		    
		 $("#step").append(plusArea);
		 
		 $("#schedule_date"+(index+1)).val(sdPeriod);
		 $("#schedule-contents"+(index+1)).append(sdComment);
		 
	 }
	 }
	 
	 if(schedule[0].scStatus=='S'){
			let insertBt =" ";
			insertBt +="<button  type='button' class='mypage__btn' id='sendAccept'>수락</button>";
			insertBt +=" ";
			insertBt +="<button  type='button' class='mypage__btn' id='sendReject'>거절</button>";
			
			 $(".mypage__bottom").append(insertBt);
		}else if(schedule[0].scStatus=='A'){
	
				 let insertBt =" ";
				insertBt ="<button  type='button' id='checkClick' >확인</button>";
				 $(".mypage_ok").append(insertBt);
			
			 for(let index=1;index<schedule.length+1;index++){
				 let insertBt =" ";
				insertBt ="<button  type='button' id='checkClick"+(index+1)+"' >확인</button>";
				 $(".mypage_ok"+(index+1)).append(insertBt);
			}
		}
	
	 
	 $(function() {
			$('#sendAccept').click(function(){
				let check = confirm("수락하시겠습니까?")
				
				let schedule = JSON.parse('${scInfo}');
	
				let scCode = schedule[0].scCode;
				let scHelper = schedule[0].scHelper;
				
				
				if(check){
					let form = document.createElement("form");
					form.action="AcceptSchedule?scCode="+scCode+"&scHelper="+scHelper;
					form.method="POST";
					document.body.appendChild(form);
					form.submit();
				}
				
			});
	});
	
	
	
	$(function() {
		$('#sendReject').click(function(){
			let check = confirm("거절하시겠습니까?")
			
			if(check){
				let form = document.createElement("form");
				form.action="RejectSchedule";
				form.method="POST";
				document.body.appendChild(form);
				form.submit();
			}
		});
});
	
	 $(function() {
			$('#checkClick').click(function(){
			   
		         let form = document.createElement('form');
		         form.action = 'OkClick';
		         form.method = 'post';
		         
		         let scCode = document.createElement("input");
		         scCode.type = "hidden";
		         scCode.name = "scCode";
		         scCode.value = schedule[0].scCode;
                 form.appendChild(scCode);   
                 
                 let scHelper = document.createElement("input");
                 scHelper.type = "hidden";
                 scHelper.name = "scHelper";
                 scHelper.value = schedule[0].scHelper;
                 form.appendChild(scHelper);   
                 
                 let scWisher = document.createElement("input");
                 scWisher.type = "hidden";
                 scWisher.name = "scWisher";
                 scWisher.value = schedule[0].scWisher;
                 form.appendChild(scWisher);   
                 
                 let sdStep = document.createElement("input");
                 sdStep.type = "hidden";
                 sdStep.name = "sdStep";
                 sdStep.value = schedule[0].sdStep;
                 form.appendChild(sdStep);   

		         document.body.appendChild(form);
		         
		         form.submit();
				
			});
	});
	 $(function() {
			$('#checkClick2').click(function(){

		         let form = document.createElement('form');
		         form.action = 'OkClick';
		         form.method = 'post';
		         
		         let scCode = document.createElement("input");
		         scCode.type = "hidden";
		         scCode.name = "scCode";
		         scCode.value = schedule[1].scCode;
                form.appendChild(scCode);   
                
                let scHelper = document.createElement("input");
                scHelper.type = "hidden";
                scHelper.name = "scHelper";
                scHelper.value = schedule[1].scHelper;
                form.appendChild(scHelper);   
                
                let scWisher = document.createElement("input");
                scWisher.type = "hidden";
                scWisher.name = "scWisher";
                scWisher.value = schedule[1].scWisher;
                form.appendChild(scWisher);   
                
                let sdStep = document.createElement("input");
                sdStep.type = "hidden";
                sdStep.name = "sdStep";
                sdStep.value = schedule[1].sdStep;
                form.appendChild(sdStep);   

		         document.body.appendChild(form);
		         
		         form.submit();
				
			});
	});
	 $(function() {
			$('#checkClic3').click(function(){

		         let form = document.createElement('form');
		         form.action = 'OkClick';
		         form.method = 'post';
		         
		         let scCode = document.createElement("input");
		         scCode.type = "hidden";
		         scCode.name = "scCode";
		         scCode.value = schedule[2].scCode;
                form.appendChild(scCode);   
                
                let scHelper = document.createElement("input");
                scHelper.type = "hidden";
                scHelper.name = "scHelper";
                scHelper.value = schedule[2].scHelper;
                form.appendChild(scHelper);   
                
                let scWisher = document.createElement("input");
                scWisher.type = "hidden";
                scWisher.name = "scWisher";
                scWisher.value = schedule[2].scWisher;
                form.appendChild(scWisher);   
                
                let sdStep = document.createElement("input");
                sdStep.type = "hidden";
                sdStep.name = "sdStep";
                sdStep.value = schedule[2].sdStep;
                form.appendChild(sdStep);   

		         document.body.appendChild(form);
		         
		         form.submit();
				
			});
	});
	 $(function() {
			$('#checkClick4').click(function(){

		         let form = document.createElement('form');
		         form.action = 'OkClick';
		         form.method = 'post';
		         
		         let scCode = document.createElement("input");
		         scCode.type = "hidden";
		         scCode.name = "scCode";
		         scCode.value = schedule[3].scCode;
                form.appendChild(scCode);   
                
                let scHelper = document.createElement("input");
                scHelper.type = "hidden";
                scHelper.name = "scHelper";
                scHelper.value = schedule[3].scHelper;
                form.appendChild(scHelper);   
                
                let scWisher = document.createElement("input");
                scWisher.type = "hidden";
                scWisher.name = "scWisher";
                scWisher.value = schedule[3].scWisher;
                form.appendChild(scWisher);   
                
                let sdStep = document.createElement("input");
                sdStep.type = "hidden";
                sdStep.name = "sdStep";
                sdStep.value = schedule[3].sdStep;
                form.appendChild(sdStep);   

		         document.body.appendChild(form);
		         
		         form.submit();
				
			});
	});
	 $(function() {
			$('#checkClick5').click(function(){

		         let form = document.createElement('form');
		         form.action = 'OkClick';
		         form.method = 'post';
		         
		         let scCode = document.createElement("input");
		         scCode.type = "hidden";
		         scCode.name = "scCode";
		         scCode.value = schedule[4].scCode;
                form.appendChild(scCode);   
                
                let scHelper = document.createElement("input");
                scHelper.type = "hidden";
                scHelper.name = "scHelper";
                scHelper.value = schedule[4].scHelper;
                form.appendChild(scHelper);   
                
                let scWisher = document.createElement("input");
                scWisher.type = "hidden";
                scWisher.name = "scWisher";
                scWisher.value = schedule[4].scWisher;
                form.appendChild(scWisher);   
                
                let sdStep = document.createElement("input");
                sdStep.type = "hidden";
                sdStep.name = "sdStep";
                sdStep.value = schedule[4].sdStep;
                form.appendChild(sdStep);   

		         document.body.appendChild(form);
		         
		         form.submit();
				
			});
	});
	 
			
}		

</script>
</html>