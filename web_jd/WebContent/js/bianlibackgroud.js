function $(id) {return document.getElementById(id);}
var lis=$("lifeservices").getElementsByTagName("i")
for(var i=0;i<lis.length;i++){
    lis[i].style.backgroundPosition="0 "+(-i*25)+"px";
}