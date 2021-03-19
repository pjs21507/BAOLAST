<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <nav id="navbar">
        <div class="navbar__top">
            <div class="navbar__logo">
                <a href="Main"><img class="navbar__logo__img" src="/resources/imgs/common/logo-white.png"></a>
            </div>
            <div class="navbar__right">
                <div class="navbar__search">
                    <input type="text" id="search" name="wordValue">
                    <button type="button" class="search__btn" onClick="searchClick()">                                                     
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <ul class="navbar__menu">
                      <li class="navbar__menu__item" onClick="myPageClick()" >마이페이지</li>
         		     <li class="navbar__menu__item" onClick="registerReq()">역경매등록</li>                  
                    <li class="navbar__menu__item" onClick="logout()">로그아웃</li>
                </ul>
            </div>
        </div>        
    </nav>       
