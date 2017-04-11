<%@page language="java" contentType="text/html; charset=UTF-8" %>
<!--投票成功弹框-->
<div class="pop_flexbg hideObj"></div>
<div class="pop_tip_box hideObj">
    <div class="pop_describe clearfix">
        <div class="pop_tip_img fl">
            <img src="${baseURL}/staticres/mobapp/images/ico_success.png">
        </div>
        <div class="vote_success_text fl" id="msgtip">投票成功！</div>
    </div>

    <div class="btn_tip_box">
        <a href="javascript:;">关闭</a>
    </div>
</div>
<!--投票成功弹框end-->
<script>
    function tip(a,b){
        $("#msgtip").html(a)
        $(".pop_flexbg,.pop_tip_box").removeClass("hideObj");
        $(".btn_tip_box a").click(function(){
            $(".pop_flexbg,.pop_tip_box").addClass("hideObj");
            b&&b.call()
        })
    }

</script>
