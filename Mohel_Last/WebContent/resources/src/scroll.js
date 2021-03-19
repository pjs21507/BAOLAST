'use strict';

// 스크롤링 했을 때 arrow-btn 보여주기
const home = document.querySelector('#home');
const homeHeight = home.getBoundingClientRect().height;
const arrowBtn = document.querySelector('.arrow-btn');
document.addEventListener('scroll', () => {
    if(window.scrollY > homeHeight){
        arrowBtn.classList.add('visible');
    }else{
        arrowBtn.classList.remove('visible');
    }
}); 

// arrow-btn을 클릭했을 때
arrowBtn.addEventListener('click', ()=>{
    const head = document.querySelector('#head');
    head.scrollIntoView({ behavior: 'smooth' });
});

