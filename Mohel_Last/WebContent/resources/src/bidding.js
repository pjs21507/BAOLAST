'use strict';
        
//Show modal
const open = document.querySelector('.bidding__btn');
const modal = document.getElementById('modal');
open.addEventListener('click', () => {
    modal.classList.add('show-modal');
});

//Hide modal
const close = document.getElementById('close');
close.addEventListener('click', () => {
    modal.classList.remove('show-modal');
});
        
//Hide modal(모달창 외부 클릭해서 닫기)
window.addEventListener('click', (e) => {
    e.target === modal ? modal.classList.remove('show-modal') : false
});

// 신중하게 입찰하기 버튼 클릭 후 모달창 닫기
// const submitBtn = document.querySelector('.submit-btn');
// submitBtn.addEventListener('click', () => {
//     modal.classList.remove('show-modal');
// });