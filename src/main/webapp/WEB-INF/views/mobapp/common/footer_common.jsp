<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!--底部-->
<div style="height: 57px;"></div>
<div class="nav_bar">
    <ul>
        <li class="this_page" onclick="location.href='${baseURL}/mob/index/act/list.mvc'"><div class="ico_nav"><img src="${baseURL}/staticres/mobapp/images/ico_home_page.png"></div><p>首页</p></li>
        <li><div class="ico_nav" onclick="location.href='${baseURL}/mob/index/act/search.mvc?id=${aid}'"><img src="${baseURL}/staticres/mobapp/images/ico_search_nav.png"></div><p>搜索</p></li>
        <li><div class="ico_nav" onclick="location.href='${baseURL}/mob/index/act/top?id=${actid}'"><img src="${baseURL}/staticres/mobapp/images/ico_array.png"></div><p>排行</p></li>
    </ul>

</div>
<!--底部end-->
