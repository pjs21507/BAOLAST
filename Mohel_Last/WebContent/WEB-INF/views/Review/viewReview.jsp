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
</head>
<body onLoad="viewreview()">
    <!-- Navbar -->
    <nav id="navbar">
        <div class="navbar__top">
            <div class="navbar__logo">
                <a href="#"><img class="navbar__logo__img" src="/resources/imgs/common/logo-white.png"></a>
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
    <!-- View review -->
    <section class="writeReview mypage">
        <h2 class="mypage__title">리뷰보기</h2>       
        <input type="hidden" id="rvWirqCode" name="rvWirqCode" >
      <input type="hidden" id="rvHelper" name="rvHelper" >
      <input type="hidden" id="rvStar" name="rvStar" >          
        <div class="review__list1">
            <img src="../../resources/imgs/common/2000.jpg" class="review__list__img">
            <div class="review__list__subCtg">인테리어</div>
            <ul class="review__list__score">
                <li class="review__list__score-star"><i class="fas fa-star"></i></li>
                <li class="review__list__score-star"><i class="fas fa-star"></i></li>
                <li class="review__list__score-star"><i class="fas fa-star"></i></li>
                <li class="review__list__score-star"><i class="fas fa-star"></i></li>
                <li class="review__list__score-star"><i class="fas fa-star"></i></li>
            </ul>
        </div>
        <div class="review__list2">               
            <div class="review__list__text" id="rvComment"></div>
        </div>
    </section>
  
</body>
<script>
function viewreview(){
   let json = JSON.parse('${info}');
   
   alert('${info}');
   
   
    let rvWirqCode = json[0].rvWirqCode
   $('#rvWirqCode').val(rvWirqCode);

   
   let rvHelper = json[0].rvHelper   
   $('#rvHelper').val(rvHelper);
   
   
   let rvComment = json[0].rvComment 
    $('#rvComment').append(rvComment);
   
   let rvStar = json[0].rvStar 
    $('#rvStar').append(rvStar);
   
   

}

</script>
</html>