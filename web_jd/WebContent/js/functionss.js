

// 登陆js
    
    // 关闭topbanner  js
    var top_banner=$("top_banner");
    var close_banner=$("close_banner");
    close_banner.onclick=function () {
        top_banner.style.display="none";
    }
    // 判断用户输入
    var input=$("txt");
    var label=$("message");
    input.focus();
    input.oninput=function () {
        if(this.value==""){
            label.style.display="block";
        }
        else {
            label.style.display="none";
        }
    }
    // 商品菜单隔行变色
    var dd_items=$("dd_items");
    var items=dd_items.children;
    for(var k in items){
        if(k%2==0){
            items[k].onmouseover=function () {
                this.className="items curuentitemou";
            }
        }
        else{
            items[k].onmouseover=function () {
                this.className="items curuentitemji";
            }
        }
        items[k].onmouseout=function () {
            this.className="items";
        }
    }
     // 手机京东图
     var mobile_qr=$("mobile_qr");
     var mobile_jpg=$("mobile_jpg");
     mobile_jpg.onmouseover=function () {
     mobile_qr.style.display="block";
     }
     mobile_jpg.onmouseout=function () {
         mobile_qr.style.display="none";
       }






