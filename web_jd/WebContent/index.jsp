<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>不是所有网页都叫京东</title>
    <link rel="stylesheet" href="css/base.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<body>
<!-- 引入header.jsp -->
			<%@ include file="/header.jsp"%>
<!--第二个nav开始-->
<div class="jd-nav">
    <div class="ww">
        <div class="dropdown">
            <div class="dt">
                <a href="#">商品全部分类</a>
            </div>
            <div class="dd" id="dd_items">
                <div class="items">
                    <a href="#">家用电器</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="orderInfo.html">手机/</a>
                    <a href="#">运营商/</a>
                    <a href="#">数码</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">电脑/</a>
                    <a href="#">办公</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="${pageContext.request.contextPath }/productList">家居/</a>
                    <a href="#">家具/</a>
                    <a href="#">家装/</a>
                    <a href="#">厨具</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">男装/</a>
                    <a href="#">女装/</a>
                    <a href="#">童装/</a>
                    <a href="#">内衣</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">美妆个护/</a>
                    <a href="#">宠物</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">女鞋/</a>
                    <a href="#">箱包/</a>
                    <a href="#">钟表/</a>
                    <a href="#">珠宝</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">男鞋/</a>
                    <a href="#">运动/</a>
                    <a href="#">户外</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">房产/</a>
                    <a href="#">汽车/</a>
                    <a href="#">汽车用品</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">母婴/</a>
                    <a href="#">玩具乐器</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">食品/</a>
                    <a href="#">酒类/</a>
                    <a href="#">生鲜/</a>
                    <a href="#">特产</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">艺术/</a>
                    <a href="#">礼品鲜花/</a>
                    <a href="#">农资绿植</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">医药保健/</a>
                    <a href="#">计生情趣</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">图书/</a>
                    <a href="#">电子书/</a>
                    <a href="#">音像</a>
                    <span>></span>
                </div>
                <div class="items">
                    <a href="#">机票/</a>
                    <a href="#">酒店/</a>
                    <a href="#">旅游/</a>
                    <a href="#">生活</a>
                    <span>></span>
                </div>
            </div>
        </div>
        <div class="navitems">
            <ul>
                <li class="new"><a href="#">秒杀</a></li>
                <li><a href="#">优惠券</a></li>
                <li><a href="#">PLUS会员</a></li>
                <li><a href="#">闪购</a></li>
                <li><a href="#">拍卖</a></li>
                <li class="new"><a href="#">京东服饰</a></li>
                <li><a href="#">京东超市</a></li>
                <li><a href="#">全球购</a></li>
                <li><a href="#">京东金融</a></li>
            </ul>
        </div>
        <div class="bike">
            <a href="#"></a>
        </div>
    </div>
</div>

<!--第二个nav结束-->
<!--da banner-->
<div class="bigbanner">
    <a href="#"></a>
</div>
<div class="ww main clearfix">
    <div class="slider" id="sliders">
        <div class="slider-main" id="slider_main_block">
            <div class="slider-main-img"><a href="#"><img src="images/slider0.jpg" alt=""/></a></div>
            <div class="slider-main-img"><a href="#"><img src="images/slider1.jpg" alt=""/></a></div>
            <div class="slider-main-img"><a href="#"><img src="images/slider2.jpg" alt=""/></a></div>
            <div class="slider-main-img"><a href="#"><img src="images/slider3.jpg" alt=""/></a></div>
            <div class="slider-main-img"><a href="#"><img src="images/slider4.jpg" alt=""/></a></div>
            <div class="slider-main-img"><a href="#"><img src="images/slider6.jpg" alt=""/></a></div>
        </div>
        <div class="circle" id="circles">
            <ul>
            </ul>
        </div>
        <div class="arrow" id="arrows">
            <span href="javascript:;" class="arrow-left"><</span>
            <span href="javascript:;" class="arrow-right">></span>
        </div>
    </div>
    <div class="news">
        <div class="jd-news">
            <div class="dt">
                <h3>京东快报</h3>
                <a href="#">更多></a>
            </div>
            <div class="dd">
                <ul>
                    <li><a href="#"><span>[特惠]</span>1元秒杀</a></li>
                    <li><a href="#"><span>[公告]</span>母婴类APP【京东宝宝】上线</a></li>
                    <li><a href="#"><span>[特惠]</span>美的品牌日 APP嗨购大放“价”</a></li>
                    <li><a href="#"><span>[公告]</span>京东深入蒙牛生产基地进行质检</a></li>
                    <li><a href="#"><span>[特惠]</span>白条购家电 24期免息！</a></li>
                </ul>
            </div>
        </div>
        <div class="lifeservice" id="lifeservices">
            <div class="dt">
                <h3>生活服务</h3>
            </div>
            <div class="dd">
                <ul>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>
                    <li class="lifeservice-icon2">
                        <a href="#" class="song">
                            <i></i>
                            <span>话费</span>
                    </a>
                    </li>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>
                    <li class="lifeservice-icon1">
                        <a href="#">
                            <i></i>
                            <span>话费</span>
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</div>
<!--da banner-->
<!--activity开始-->
<div class="ww activity clearfix">
    <div class="activityone">
        <div class="activityoneleft">
            <img src="images/night.jpg" alt=""/>
        </div>
        <div class="activityoneright">
            <ul>
                <li><a href="#"><img src="images/1.jpg" alt=""></a></li>
                <li><a href="#"><img src="images/2.jpg" alt=""></a></li>
                <li><a href="#"><img src="images/3.jpg" alt=""></a></li>
                <li><a href="#"><img src="images/4.jpg" alt=""></a></li>
            </ul>
        </div>
    </div>
</div>
<!--activity结束-->
<!-- 引入footer.jsp -->
<%@ include file="/footer.jsp"%>

</body>
<script src="js/slider.js" type="text/javascript"></script>
<script src="js/animate.js" type="text/javascript"></script>
<script src="js/bianlibackgroud.js" type="text/javascript"></script>
<script src="js/functionss.js" type="text/javascript"></script>
</html>