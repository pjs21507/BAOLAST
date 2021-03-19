<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 회원가입</title>
    <meta name="description" content="회원가입 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/account.css">
</head>
<body>
    <!-- Header -->
    <header id="head">
        <a href="Main"><img src="/resources/imgs/common/logo.png" class="head__logo" alt="logo image"></a>
    </header>
    <!-- Section -->
    <section id="contents">
        <form action="Join" method="post" id="joinInfo" name="joinInfo" method="post">
            <div class="contents__join">
               <input type="text" class="contents-id" maxlength="41" name="mName" placeholder="이름" title="이름 입력" required/>
                <input type="text" class="contents-id" maxlength="41" name="mId" placeholder="아이디" title="아이디 입력" required/>
                <input type="password" class="contents-pw" maxlength="16" name="mPw" placeholder="비밀번호" title="비밀번호 입력" required/>
                <input type="password" class="contents-pwck" maxlength="16" name="mPw2" placeholder="비밀번호 재확인" title="비밀번호 재확인 입력" required/>
            </div>            
            
        </form>
        <div class="contents__submit">
                <button class="contents__submit__click" onClick="Check()">가입하기</button>
            </div>
        <!-- 로그인하기 -->
    <p class="contents__account">이미 모헬 회원이신가요? <a href="LogInForm" class="contents__account-link">로그인</a></p>
    </section>
    </body>
    <script>
      function Check(){
         let mId = document.getElementsByName('mId')[0].value;
         let mName = document.getElementsByName('mName')[0].value;
         let mPw = document.getElementsByName('mPw')[0].value;
         let mPw2 = document.getElementsByName('mPw2')[0].value;   
         
         alert(mId);
         
           if(mPw != mPw2){
             alert("비밀번호가 서로 다릅니다.");
            }
           
           if(mId){
              if(mPw){
                 if(mPw===mPw2){
                    alert("check ok");
                    let form = document.createElement('form');
                    form.action = 'Join';
                          form.method = 'Post'; 
                           
                    let mId = document.createElement("input");
                    mId.type = "hidden";
                    mId.name = "mId";
                    mId.value = document.getElementsByName('mId')[0].value;
                     form.appendChild(mId);   
                     
                     let mName = document.createElement("input");
                     mName.type = "hidden";
                     mName.name = "mName";
                     mName.value = document.getElementsByName('mName')[0].value;
                     form.appendChild(mName); 
                     
                     let mPw = document.createElement("input");
                     mPw.type = "hidden";
                     mPw.name = "mPw";
                     mPw.value =  document.getElementsByName('mPw')[0].value;
                     form.appendChild(mPw); 
                 
    
                      document.body.appendChild(form);
                 
                      form.submit();
                 }
              }
           }
   
       
      }
      
</script>
</html>