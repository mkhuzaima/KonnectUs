document.onload = function () {burger = document.querySelector('.burger');
navbar = document.querySelector('.navbar');
navlist = document.querySelector('.navlist');
// rightnav = document.querySelector('.right-nav');


burger.addEventListener('click',()=>{
    // rightnav.classList.toggle('v-class');
    navlist.classList.toggle('v-class');
    navbar.classList.toggle('h-nav');
})


}