<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 리뷰보기</title>
    <meta name="description" content="리뷰보기 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <script src="https://kit.fontawesome.com/301043e4a8.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
  
  
</head>
<style>
span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
}
 
span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
}
</style>
<body>
   <!-- Navbar -->
   <nav id="navbar">
      <div class="navbar__top">
         <div class="navbar__logo">
            <a href="#"><img class="navbar__logo__img"
               src="/resources/imgs/common/logo-white.png"></a>
         </div>
         <div class="navbar__right">
            <div class="navbar__search">
               <input type="text" name="search" id="search">
               <button type="button" class="search__btn">
                  <i class="fas fa-search"></i>
               </button>
            </div>
            <ul class="navbar__menu">
               <li class="navbar__menu__item">마이페이지</li>
               <li class="navbar__menu__item">역경매등록</li>
               <li class="navbar__menu__item">로그아웃</li>
            </ul>
         </div>
      </div>
   </nav>
   <!-- Write a review -->
   <section class="review mypage">
      <h2 class="mypage__title">리뷰작성</h2>
      <form name="insReviewInfo" id="insReviewInfo" action="insReview"
         method="POST">
         <div class="review__list1">
            <img src="../../resources/imgs/common/2000.jpg"
               class="review__list__img">
            <div class="review__list__subCtg">인테리어</div>
            
            <span id="rvStar" name="rvStar" class="star-prototype"></span>
<!--             <ul class="review__list__score" > -->
<!--                <li class="review__list__score-star" ><i class="far fa-star"></i></li> -->
<!--                <li class="review__list__score-star" ><i class="far fa-star"></i></li> -->
<!--                <li class="review__list__score-star" ><i class="far fa-star"></i></li> -->
<!--                <li class="review__list__score-star" ><i class="far fa-star"></i></li> -->
<!--                <li class="review__list__score-star" ><i class="far fa-star"></i></li> -->
<!--             </ul> -->

         </div>
         <div class="review__list2">
            <textarea name="rvComment" class="review__list__wirte" rows="15"
               placeholder="리뷰를 작성해주세요:)"></textarea>
         </div>
         <div class="mypage__bottom">
            <button type="button" class="mypage__btn" onClick="reviewclick()">리뷰등록</button>
         </div>
      </form>
   </section>
    <input type="hidden" id="rvWirqCode" name="rvWirqCode" >
      <input type="hidden" id="rvHelper" name="rvHelper" >
      <input type="hidden" id="rvStar" name="rvStar" >  

</body>



<script>

// loadReview = JSON.parse('${info}');
// let rvStar = document.getElemenstByName("rvStar")[0];
  
// img.textContent = loadReview[0].rvstar;
                    
// document.getElementsByName("rvStar").innerHTML = loadReview[0].rvStar;

// $.fn.generateStars = function() {
//     return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
// };
// // 숫자 평점을 별로 변환하도록 호출하는 함수
// $('.star-prototype').generateStars();

// let rvStar= document.getElementsByName("rvStar").innerHTML = rvStar;
// $.fn.generateStars = function() {
//     return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
// };
// // 숫자 평점을 별로 변환하도록 호출하는 함수
// $('.star-prototype').generateStars();




 function reviewclick(){
   let rvWirqCode = document.getElementsByName("rvWirqCode")[0];
   let rvHelper = document.getElementsByName("rvHelper")[0];
   let rvStar = document.getElementsByName("rvStar")[0];
   let rvComment = document.getElementsByName("rvComment")[0];

   
   alert(rvComment.value);
   alert(rvWirqCode.value);
   alert(rvHelper.value);
   alert(rvStar.value);

   let form = document.createElement("form");
   form.action = "WriteReview";
   form.method = "Post";   
   
   form.appendChild(rvWirqCode);
   form.appendChild(rvHelper);
   form.appendChild(rvComment);
   document.body.appendChild(form);
   form.submit();
}
    


let json = JSON.parse('${info}');
   
   alert('${info}');
   
   let wiRqCode = json[0].wiRqCode
   $('#rvWirqCode').val(wiRqCode);

   
   let wiHelper = json[0].wiHelper   
   $('#rvHelper').val(wiHelper);
   
   let rvStar = json[0].rvStar   
   $('#rvStar').val(rvStar);
  


//let info = document.getElentById('starck');

</script>
</html>