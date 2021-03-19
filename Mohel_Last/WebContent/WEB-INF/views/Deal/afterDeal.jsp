<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 역경매</title>
    <meta name="description" content="dealDetail 진행중, 완료 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <script src="https://kit.fontawesome.com/301043e4a8.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="/resources/src/navbar.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body onload="list()">

    <!-- Navbar -->
    <%@ include file="/WEB-INF/views/common/navbar.jsp" %>
   
    <section class="deal mypage">
        <h2 class="mypage__title"><div id="rqTitle"></div></h2>
        <!-- Request -->
        
        <div class="deal__container">   
               <div id="rqImage">
            </div>
            <div class="deal__info__container">
                <table class="deal__info"> 
                    <tr class="deal__list">
                        <th class="deal__title" style="width:300px">기간</th>
                        <td class="deal__contents"><span id="rqSysDate"></span> ~ <span id="rqPeriod"></span></td>
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
            </div>
        </div>
        <input type="hidden" name="rqCode" id="rqCode">
            <input type="hidden" name="rqId" id="rqId">
    </section>   
</body>

   <script>
    function list(){
       
    let json = JSON.parse('${detailAd}'); //제이슨 값수정 
    
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
    
    let rqId = json[0].rqId;
    $('#rqId').val(rqId);
    
    let rqSysDate = json[0].rqSimpleDate;
    $('#rqSysDate').append(rqSysDate);    
   //아래부분 종식코드 추가 
    let rqImage="";
    rqImage += "<img class='deal__img' src='../../resources/imgs/common/"+json[0].rqImage+"'>"
    $('#rqImage').append(rqImage);
    }
   

       var rqCode = document.getElementsByName("rqCode")[0];
       var rqId = document.getElementsByName("rqId")[0];
       
    
</script>
</html>