<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 프로필</title>
    <meta name="description" content="프로필 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <script src="https://kit.fontawesome.com/301043e4a8.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="/resources/src/navbar.js" defer></script>
    <script src="/resources/src/navbar2.js" defer></script>
</head>
<body onLoad="init()">
    
    <!-- Navbar -->
    <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

    <!--Mypage Navbar -->
	<%@ include file="/WEB-INF/views/common/navbar2.jsp" %>
    
    <!-- Profile -->
    <section class="profile mypage">
        <div class="profile__container">
            <h2 class="mypage__title profile__h2">프로필</h2>
            <table class="profile__info"> 
                <tr class="profile__list">
                    <th class="profile__title">아이디</th>
                    <td class="profile__contents" id="mId"></td>
                </tr>
                <tr class="profile__list">
                    <th class="profile__title">E-mail</th>
                    <td class="profile__contents" id="mEmail"></td>
                </tr>
                <tr class="profile__list">
                    <th class="profile__title">사는곳</th>
                    <td class="profile__contents" id="mRcName"></td>
                </tr>
                <tr class="profile__list">
                    <th class="profile__title">소속</th>
                    <td class="profile__contents" id="mDivision"></td>
                </tr>
                <tr class="profile__list">
                    <th class="profile__title">경력</th>
                    <td class="profile__contents" id="mCareer">
                        
                    </td>
                </tr>
            </table>
            <div class="mypage__bottom">
                <button type="button" class="mypage__btn" onClick="ModifyProfile()">수정하기</button>
            </div>
        </div>
    </section>
    <section id="pro"></section>
</body>
<script>
function init(){
	
	
	let json = JSON.parse('${getProfile}');
    

    let proInfomId = document.getElementById("mId"); 
    let mId = document.createElement('Div');              
    mId.textContent = json[0].mId;
    proInfomId.append(mId);
    
    
    
    
    let proInfomEmail = document.getElementById("mEmail");
    let mEmail = document.createElement('Div');
    mEmail.textContent = json[0].mEmail; 
    proInfomEmail.appendChild(mEmail);
    
    
    let proInfomRcName = document.getElementById("mRcName");
    let mRcName = document.createElement('Div');
    mRcName.textContent = json[0].mRcName; 
    proInfomRcName.appendChild(mRcName);
    
    
    let proInfomDivision = document.getElementById("mDivision");
    let mDivision = document.createElement('Div');
    mDivision.textContent = json[0].mDivision; 
    proInfomDivision.appendChild(mDivision);
   
    
    let proInfomCareer = document.getElementById("mCareer");
    let mCareer = document.createElement('Div');
    mCareer.textContent = json[0].mCareer; 
    proInfomCareer.appendChild(mCareer);
    
	
}

function ModifyProfile(){
	
	var form = document.createElement("form");
	 form.action = "ModifyProfile";
	 form.method ="POST"; 
	 document.body.appendChild(form);
	  form.submit();
	  
}


</script>
</html>