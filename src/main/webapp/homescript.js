let logindd=document.getElementById("logindd");
let afterlogindd=document.getElementById('afterlogindd');
afterlogindd.style.display='none';
let loginEd=document.getElementById('logins');
let loginEdvs=loginEd.classList.contains('1');
if(loginEdvs){
    logindd.style.display='none';
    afterlogindd.style.display='block';
}
AOS.init();