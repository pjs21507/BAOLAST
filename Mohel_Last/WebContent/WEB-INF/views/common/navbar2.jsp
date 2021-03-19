<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <nav id="mypage">
        <ul class="mypage__menu">
            <li class="mypage__menu__item">
                <button type="button" onClick="myPageClick()">프로필</button>
            </li>
            <li class="mypage__menu__item deal-menu">
                <button type="button">거래상태</button>
                <ul class="navbar__list deal-list">
                    <li class="navbar__list__item"><button type="button" class="navbar__list__btn" onClick="waitingClick()">진행전</button></li>
                    <li class="navbar__list__item"><button type="button" class="navbar__list__btn" onClick="IngClick()">진행중</button></li>
                    <li class="navbar__list__item"><button type="button" class="navbar__list__btn" onClick="endClick()">완료</button></li>
                </ul>
            </li>                    
            <li class="mypage__menu__item message-menu">
                <button type="button">메시지</button>
                <ul class="navbar__list message-list">
                    <li class="navbar__list__item"><button type="button" class="navbar__list__btn" onClick="recBox()">받은메시지함</button></li>
                    <li class="navbar__list__item"><button type="button" class="navbar__list__btn" onClick="sendBox()">보낸메시지함</button></li>
                    <li class="navbar__list__item"><button type="button" class="navbar__list__btn" onClick="msgForm()">메시지쓰기</button></li>
                </ul>
            </li> 
        </ul>
    </nav>