/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// script.js
document.addEventListener('scroll', function() {
    const parallax = document.querySelector('.parallax-bg');
    const scrollPosition = window.scrollY;
    parallax.style.transform = `translateY(${scrollPosition * 1.5}px)`;

    const parallax2 = document.querySelector('.parallax-bg2');
    const scrollPosition2 = window.scrollY;
    parallax2.style.transform = `translateY(${scrollPosition * -1.5}px)`;


    const navbarStatic = document.querySelector('.navbar-static');
    const navbarOriginal = document.querySelector('.navbar');
    
    const scrollTrigger = navbarOriginal.offsetHeight;

    if (window.scrollY >= scrollTrigger) {
        navbarStatic.style.display = 'flex';
    } else {
        navbarStatic.style.display = 'none';
    }
});
