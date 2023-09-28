let logindd=document.getElementById("logindd");
let afterlogindd=document.getElementById('afterlogindd');
afterlogindd.style.display='none';
let loginEd=document.getElementById('logins');
let loginEdvs=loginEd.classList.contains('1');
if(loginEdvs){
    logindd.style.display='none';
    afterlogindd.style.display='block';
}
let busbtn=document.getElementById('busbtn');
let flightbtn=document.getElementById('flightbtn');
let bus=document.getElementById('busPanel');
let flight=document.getElementById('flightPanel');
bus.style.display='none';
flight.style.display='block';
flightbtn.style.background='lightblue';
flightbtn.style.color='black';
busbtn.style.background='white';
busbtn.style.color='';
flight.style.background='lightblue';
flight.style.color='black';
busbtn.addEventListener('click',function(){
    bus.style.display='block';
    flight.style.display='none';
    busbtn.style.background='lightblue';
    busbtn.style.color='black';
    flightbtn.style.background="white";
    flightbtn.style.color="";
    bus.style.background='lightblue';
    bus.style.color='black';
});
flightbtn.addEventListener('click',function(){
    bus.style.display='none';
    flight.style.display='block';
    flightbtn.style.background='lightblue';
    flightbtn.style.color='black';
    busbtn.style.background='white';
    busbtn.style.color='';
    flight.style.background='lightblue';
    flight.style.color='black';
});
let pplus=document.getElementById('pplus');
let pminus=document.getElementById('pminus');
let person=document.getElementById('pr');
let prs=1;
person.value=prs;
pplus.addEventListener('click',()=>{
    prs+=1;
    person.value=prs;
});

pminus.addEventListener('click',()=>{
    let error=person.value<=1;
    if(!error){
        prs-=1;
        person.value=prs;
    }
})
var plus=document.getElementById("plus");
var minus=document.getElementById("minus");
var nop=document.getElementById("nop");
var i=1;
nop.value=i;
plus.addEventListener("click",function (){
    i++;
    nop.value=i;
});
minus.addEventListener("click",function (){
    if(i>1){
        i--;
        nop.value=i;
    }
});
let fsd=document.getElementById('fsd');
let fad=document.getElementById('fad');
fsd.addEventListener('onfocus',()=>{
  if(fsd.value===fad.value){
      fad.style.display='none';
  }
})
let fdate=document.getElementById('fdate');
let bdate=document.getElementById('bdate');
let today=new Date().toISOString().split("T")[0];
fdate.setAttribute('min',today);
bdate.setAttribute('min',today);
$(document).ready(function(){
    $('#fsd').change(()=>{
        let sd=$('#fsd').val();
        $('#fad').children().each(function () {
            if($(this).val()===sd){
                $(this).hide();
            }else{
                $(this).show();
            }
        })
    })
    $('#fad').change(()=>{
        let ad=$('#fad').val();
        $('#fsd').children().each(function () {
            if($(this).val()===ad){
                $(this).hide();
            }else{
                $(this).show();
            }
        })
    })
    $('#bsd').change(()=>{
        let sd=$('#bsd').val();
        $('#bad').children().each(function () {
            if($(this).val()===sd){
                $(this).hide();
            }else{
                $(this).show();
            }
        })
    })
    $('#bad').change(()=>{
        let ad=$('#bad').val();
        $('#bsd').children().each(function () {
            if($(this).val()===ad){
                $(this).hide();
            }else{
                $(this).show();
            }
        })
    })
});
AOS.init();