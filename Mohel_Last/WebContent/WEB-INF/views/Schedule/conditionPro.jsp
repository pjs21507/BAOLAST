<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 스케쥴 헬퍼</title>
    <meta name="description" content="스케쥴 헬퍼 페이지">
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
						<td class="schedule__contents"><button id="plus" type="button" >항목추가</button><button id="minus" type="button" >항목삭제</button></td>
					</tr>
                </tbody>
            </table>
            <div class="schedule__textarea" name="textarea">
                <div>STEP1  기간 : <input type="date" id="schedule_date1" name="tag"></div>
                <textarea id="schedule-contents1" name="schedule-contents" cols="120" rows="10"></textarea>
                <section id="step"></section>         
            </div>
                   <input type="hidden" id="schedule-code" /><input type="hidden" id="schedule-status" />
            <div class="mypage__bottom">
                <button  type="button" class="mypage__btn" id="sendMsg">등록</button>
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
		 plusArea += "<div>STEP"+(index+1)+" 기간 : <input type='date' id= 'schedule_date"+(index+1)+"' name='tag'></div>";
   	     plusArea += "<textarea id='schedule-contents"+(index+1)+"' name='schedule-contents' cols='120' rows='10'></textarea>";     
		    
		 $("#step").append(plusArea);
		 
		 $("#schedule_date"+(index+1)).val(sdPeriod);
		 $("#schedule-contents"+(index+1)).append(sdComment);
		 
	 }
	 }
	 
	let maxAppend = area.tag.length?area.tag.length:1; //버튼누른 횟수 저장
	
	 $(function() {
				$('#plus').click(function(){
						if (maxAppend >= 5) return; // 5번째부터는 append 안되고 return 시키기

						 let plusArea = " ";
						 plusArea += "<div>STEP"+(maxAppend+1)+" 기간 : <input type='date' id= 'schedule_date"+(maxAppend+1)+"' name='tag' ></div>";
			       	     plusArea += "<textarea id='schedule-contents"+(maxAppend+1)+"' name='schedule-contents' cols='120' rows='10'></textarea>";     
						    
						 $("#step").append(plusArea);
						 maxAppend++;
				});
		});	
	 $(function() {
			$('#minus').click(function(){
				if (maxAppend <= 1) return; // 1번째부터는 append 안되고 return 시키기

				if(maxAppend != 2){

					$("#schedule-contents"+area.tag.length+":last-child").prev().remove();
					$("#schedule-contents"+(area.tag.length+1)+":last-child").remove();
				}else{
					$("#schedule-contents2:last-child").prev().remove();
					$("#schedule-contents2:last-child").remove();
				};
					 maxAppend--;
					 alert(maxAppend);
			});
	});	
	 
	 $(function() {
			$('#sendMsg').click(function(){
				let maxAppend = area.tag.length?area.tag.length:1;
			    
				let sdPeriod= new Array();
				let sdComment = new Array();
				let param = new Array();
				
				
				for(i=0;i<maxAppend;i++){

					
					let data ={
							scCode: $('#schedule-code').val(),
							scFilterName : $('#schedule-main').text(),
							scSubName : $('#schedule-sub').text().substr(1),
							scWisher : $('#schedule-wisher').text(),
							scHelper : $('#schedule-helper').text(),
							sdTitle : $('#schedule-title').text(),
						    scStatus : 'N',
						    sdStep: i+1,
						    sdPeriod :$('#schedule_date'+(i+1)).val(),
							sdComment : $('#schedule-contents'+(i+1)).val()
					};
					param.push(data);
				}
				let jsondata = JSON.stringify(param);
				alert(jsondata);
				
				 $.ajax({
	                    url         :   "/InsSchedule",
	                    dataType    :   "json",
	                    contentType :   "application/json",
	                    type        :   "post",
	                    data        :   jsondata,
	                    success     :   alert("데이터 넘김 성공6v6")
	                  
	                });

			});
			
			
			
	});	
	 

}
	
</script>
</html>