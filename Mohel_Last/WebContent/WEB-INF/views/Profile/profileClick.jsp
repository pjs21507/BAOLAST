<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모헬: 모두의 헬퍼 - 프로필 및 리뷰</title>
    <meta name="description" content="아이디 클릭시 프로필 페이지">
    <link rel="icon" type="image/png" href="/resources/imgs/common/logo-m.png">
    <script src="https://kit.fontawesome.com/301043e4a8.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="/resources/src/search.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body onLoad="init()">
    
    <!-- Navbar -->
    <%@ include file="/WEB-INF/views/common/navbar.jsp" %>
    
    <!-- Profile and Review -->
    <!-- Profile -->
    <section class="profile mypage">
        <div class="profile__container">
            <h2 class="mypage__title profile__h2">프로필 및 리뷰</h2>
            <table class="profile__info"> 
               
            </table>
        </div>
    </section>
    <!-- Review -->
    <section class="profile__review">
        <div class="profile__review__container">
            <div class="review__score">
                <ul class="review-percent">
                    <li class="review-totalStar"><i class="fas fa-star"></i></li>
                    <li class="review-totalStar"><i class="fas fa-star"></i></li>
                    <li class="review-totalStar"><i class="fas fa-star"></i></li>
                    <li class="review-totalStar"><i class="fas fa-star"></i></li>
                    <li class="review-totalStar"><i class="fas fa-star-half"></i></li>
                </ul>
                <div class="review__score__info">
                    <span class="review-totalScore">4.5</span>
                    <span class="review-number">(37개 리뷰)</span>
                </div>
            </div>
            <ul class="review__list">
                <li class="review__item">
                    <div class="review__comments">
                        <div class="review__comments__text">
                            목적에 맞는 로고가 나왔어요. 수정사항들도 계속 반영해주셨어요. 너무 감사합니다.
                        </div>
                    </div>
                    <div class="review__info">
                        <div class="review__info__item">
                            <span class="review-id">soo</span>
                            <span class="review-date">2021.03.02</span>
                        </div>
                        <div class="review__info__item">
                            <ul class="review-percent">
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="far fa-star"></i></li>
                                <li class="review-star"><i class="far fa-star"></i></li>
                                <li class="review-star"><i class="far fa-star"></i></li>
                            </ul>
                        </div>
                        <div class="review__info__item">
                            <div class="review-subCtg">제품 디자인</div>
                        </div>
                    </div>
                </li>
                <li class="review__item">
                    <div class="review__comments">
                        <div class="review__comments__text">
                            목적에 맞는 로고가 나왔어요. 수정사항들도 계속 반영해주셨어요. 너무 감사합니다.
                        </div>
                    </div>
                    <div class="review__info">
                        <div class="review__info__item">
                            <span class="review-id">soo</span>
                            <span class="review-date">2021.03.02</span>
                        </div>
                        <div class="review__info__item">
                            <ul class="review-percent">
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                            </ul>
                        </div>
                        <div class="review__info__item">
                            <div class="review-subCtg">제품 디자인</div>
                        </div>
                    </div>
                </li>
                <li class="review__item">
                    <div class="review__comments">
                        <div class="review__comments__text">
                            목적에 맞는 로고가 나왔어요. 수정사항들도 계속 반영해주셨어요. 너무 감사합니다.
                        </div>
                    </div>
                    <div class="review__info">
                        <div class="review__info__item">
                            <span class="review-id">soo</span>
                            <span class="review-date">2021.03.02</span>
                        </div>
                        <div class="review__info__item">
                            <ul class="review-percent">
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                            </ul>
                        </div>
                        <div class="review__info__item">
                            <div class="review-subCtg">제품 디자인</div>
                        </div>
                    </div>
                </li>
                <li class="review__item">
                    <div class="review__comments">
                        <div class="review__comments__text">
                            목적에 맞는 로고가 나왔어요. 수정사항들도 계속 반영해주셨어요. 너무 감사합니다.
                        </div>
                    </div>
                    <div class="review__info">
                        <div class="review__info__item">
                            <span class="review-id">soo</span>
                            <span class="review-date">2021.03.02</span>
                        </div>
                        <div class="review__info__item">
                            <ul class="review-percent">
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                            </ul>
                        </div>
                        <div class="review__info__item">
                            <div class="review-subCtg">제품 디자인</div>
                        </div>
                    </div>
                </li>
                <li class="review__item">
                    <div class="review__comments">
                        <div class="review__comments__text">
                            목적에 맞는 로고가 나왔어요. 수정사항들도 계속 반영해주셨어요. 너무 감사합니다.
                        </div>
                    </div>
                    <div class="review__info">
                        <div class="review__info__item">
                            <span class="review-id">soo</span>
                            <span class="review-date">2021.03.02</span>
                        </div>
                        <div class="review__info__item">
                            <ul class="review-percent">
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                            </ul>
                        </div>
                        <div class="review__info__item">
                            <div class="review-subCtg">제품 디자인</div>
                        </div>
                    </div>
                </li>
                <li class="review__item">
                    <div class="review__comments">
                        <div class="review__comments__text">
                            목적에 맞는 로고가 나왔어요. 수정사항들도 계속 반영해주셨어요. 너무 감사합니다.
                        </div>
                    </div>
                    <div class="review__info">
                        <div class="review__info__item">
                            <span class="review-id">soo</span>
                            <span class="review-date">2021.03.02</span>
                        </div>
                        <div class="review__info__item">
                            <ul class="review-percent">
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                                <li class="review-star"><i class="fas fa-star"></i></li>
                            </ul>
                        </div>
                        <div class="review__info__item">
                            <div class="review-subCtg">제품 디자인</div>
                        </div>
                    </div>
                </li>
            </ul>
            <div class="review__more">
                <button type="button" class="review__more__btn">
                    <span><i class="fas fa-plus"></i></span>
                    <span>더보기</span>
                </button>
            </div>
        </div>       
    </section>
</body>
<script>
function init(){
	let profileInfo =JSON.parse('${clickPro}');
	alert('${clickPro}');
	
	let insertTr="";
	insertTr += "<tr class='profile__list'>";
	insertTr += "<th class='profile__title'>아이디</th>";
	insertTr += "<td class='profile__contents'>"+profileInfo[0].mId+"</td>";
	insertTr += "</tr>";
	insertTr += "<tr class='profile__list'>";
	insertTr += "<th class='profile__title'>E-mail</th>";
	insertTr += "<td class='profile__contents'>"+profileInfo[0].mEmail+"</td>";
	insertTr += "</tr>";
	insertTr += "<tr class='profile__list'>";
	insertTr += "<th class='profile__title'>사는곳</th>";
	insertTr += "<td class='profile__contents'>"+profileInfo[0].mRcName+"</td>";
	insertTr += "</tr>";
	insertTr += "<tr class='profile__list'>";
	insertTr += "<th class='profile__title'>소속</th>";
	insertTr += " <td class='profile__contents'>"+profileInfo[0].mDivision+"</td>";
	insertTr += "</tr>";
	insertTr += "<tr class='profile__list'>";
	insertTr += "<th class='profile__title'>경력</th>";
	insertTr += "<td class='profile__contents'>"+profileInfo[0].mCareer+"</td>";
    insertTr += "</tr>";
    
    $(".profile__info").append(insertTr);

    
}
</script>
</html>