/**
 * Created by Administrator on 2017/4/8.
 */
$(document).ready(function(){

    //轮播
    $(function(){

        var i=0;
        var timer=null;
        var w=$(".carousel_figure").width();
        $('.img li').width(w);

        for (var j = 0; j < $('.img li').length; j++) {  //创建圆点
            $('.num').append('<li></li>')
        }
        $('.num li').first().addClass('active'); //给第一个圆点添加样式

        var firstimg=$('.img li').first().clone(); //复制第一张图片
        $('.img').append(firstimg).width($('.img li').length*($('.img img').width())); //将第一张图片放到最后一张图片后，设置ul的宽度为图片张数*图片宽度


        //鼠标划入圆点
        $('.num li').mouseover(function(){
            var _index=$(this).index();
            $('.img').stop().animate({left:-_index*w},150);
            $('.num li').eq(_index).addClass('active').siblings().removeClass('active');
        })

        //定时器自动播放
        timer=setInterval(function(){

            i++;
            if (i==$('.img li').length) {
                i=1;
                $('.img').css({left:0});
            };

            $('.img').animate({left:-i*w},300);




            if (i==$('.img li').length-1) {
                $('.num li').eq(0).addClass('active').siblings().removeClass('active');
            }else{
                $('.num li').eq(i).addClass('active').siblings().removeClass('active');
            }
        },2000)

    })
    //轮播结束
})