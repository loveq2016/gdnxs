/**
 * Created by Administrator on 2016/10/21.
 */
var flag = 0;
$(document)
    .ready(
        function () {
            // $(function() {
            $('.sidebar_menu').on(
                'click',
                'li.treeview>a',
                function (e) {
                    var _el = $(this);
                    _el.find('.iGuide').toggleClass('iGuide_cur');
                    _el.parent().find('.treeview_menu').slideToggle().parent().siblings().find('.treeview_menu').slideUp()
                        .siblings().find('.iGuide')
                        .removeClass('iGuide_cur');
                    e.stopPropagation();
                })
            $(".treeview_menu li").click(function () {
                $(this).css("color", "09c");
            })

            // 动态tab页
            $(document)
                .ready(
                    function () {

                        $(".treeview_menu a")
                            .live(
                                "click",
                                function () {
                                    $(
                                        ".treeview_menu a")
                                        .parent()
                                        .css(
                                            "background",
                                            "#293038");
                                    $(this)
                                        .parent()
                                        .css(
                                            "background",
                                            "#09c");
                                    $(this)
                                        .parent()
                                        .css(
                                            "background",
                                            "#09c");
                                    addTab($(this));

                                    var _width = $(
                                        ".content_tabs")
                                        .width();
                                    var _li_width = $(
                                        "#tabs li")
                                        .width();
                                    var num = $(
                                        "#tabs li")
                                        .size();
                                    var margin_r = $(
                                            ".content_tabs")
                                            .width() * 0.002;
                                    var total_width = (margin_r + _li_width)
                                        * num;

                                    if (total_width > _width) {
                                        var per = 100 / num;
                                        $("#tabs li")
                                            .width(
                                                (per - 0.2 - 2)
                                                + "%");
                                    }
                                    // 增加
                                    var text = $(this)
                                        .text()
                                    $('#tabs li .tab')
                                        .each(
                                            function () {
                                                $(
                                                    this)
                                                    .parent()
                                                    .removeClass(
                                                        "current");

                                                if ($(
                                                        this)
                                                        .text() == text) {
                                                    $(
                                                        this)
                                                        .parent()
                                                        .addClass(
                                                            'current');
                                                    var contentname = $(
                                                            this)
                                                            .attr(
                                                                "id")
                                                        + "_content";
                                                    $(
                                                        "#content iframe")
                                                        .hide();
                                                    $(
                                                        "#"
                                                        + contentname)
                                                        .show();
                                                }
                                            })
                                });

                        $('#tabs a.tab')
                            .live(
                                'click',
                                function () {
                                    // Get the tab name
                                    var contentname = $(
                                            this).attr(
                                            "id")
                                        + "_content";
                                    $("#content iframe")
                                        .hide();

                                    // hide all other
                                    // tabs
                                    $("#content iframe")
                                        .hide();
                                    $("#tabs li")
                                        .removeClass(
                                            "current");

                                    // show current tab
                                    $("#" + contentname)
                                        .show();
                                    $(this)
                                        .parent()
                                        .addClass(
                                            "current");
                                    // 增加
                                    var this_tab = $(
                                        this)
                                        .text();
                                    $(
                                        ".treeview_menu a")
                                        .each(
                                            function () {
                                                $(
                                                    this)
                                                    .parent()
                                                    .css(
                                                        "background",
                                                        "#293038");
                                                if ($(
                                                        this)
                                                        .text() == this_tab) {
                                                    // $(this).css("color","#fff");
                                                    $(
                                                        this)
                                                        .parent()
                                                        .css(
                                                            "background",
                                                            "#09c");
                                                }
                                            })
                                    $(".home_page")
                                        .attr("");
                                });

                        $('#tabs a.remove')
                            .live(
                                'click',
                                function () {
                                    // Get the tab name
                                    var tabid = $(this)
                                        .parent()
                                        .find(
                                            ".tab")
                                        .attr("id");

                                    // remove tab and
                                    // related content
                                    var contentname = tabid
                                        + "_content";
                                    $("#" + contentname)
                                        .remove();
                                    $(this).parent()
                                        .remove();
                                    // 关闭所有tab时显示首页
                                    if ($("#tabs li").length == 0) {
                                        $(
                                            "#content #header_bar, #content #main_content")
                                            .show();
                                    }
                                    // if there is no
                                    // current tab and
                                    // if there are
                                    // still tabs left,
                                    // show the first
                                    // one

                                    if ($("#tabs li.current").length == 0
                                        && $("#tabs li").length > 0) {

                                        // find the
                                        // first tab
                                        var firsttab = $("#tabs li:last-child");
                                        firsttab
                                            .addClass("current");

                                        var name_tab = $(
                                            "#tabs li:last-child .tab")
                                            .text();
                                        $(
                                            ".treeview_menu a")
                                            .each(
                                                function () {
                                                    if ($(
                                                            this)
                                                            .text() == name_tab) {
                                                        $(
                                                            this)
                                                            .parent()
                                                            .css(
                                                                "background",
                                                                "#09c");
                                                    }

                                                })

                                        // get its link
                                        // name and show
                                        // related
                                        // content
                                        var firsttabid = $(
                                            firsttab)
                                            .find(
                                                "a.tab")
                                            .attr(
                                                "id");
                                        $(
                                            "#"
                                            + firsttabid
                                            + "_content")
                                            .show();
                                    }

                                    var this_remove = $(
                                        this)
                                        .parent()
                                        .find(
                                            ".tab")
                                        .text();
                                    $(
                                        ".treeview_menu a")
                                        .each(
                                            function () {
                                                if ($(
                                                        this)
                                                        .text() == this_remove) {
                                                    // $(this).css("color","#fff");
                                                    $(
                                                        this)
                                                        .parent()
                                                        .css(
                                                            "background",
                                                            "#293038");
                                                }

                                            })
                                    var _width = $(
                                        ".content_tabs")
                                        .width();
                                    var _li_width = $(
                                        "#tabs li")
                                        .width();
                                    var num = $(
                                        "#tabs li")
                                        .size();
                                    var margin_r = $(
                                            ".content_tabs")
                                            .width() * 0.002;
                                    var total_width = (margin_r + _li_width)
                                        * num;

                                    if (num >= 8) {
                                        var per = 100 / num;
                                        $("#tabs li")
                                            .width(
                                                (per - 0.2 - 2)
                                                + "%");
                                    }

                                });
                    });


            function addTab(link) {
                // If tab already exist in the list, return
                if ($("#" + $(link).attr("rel")).length != 0)
                    return;

                // hide other tabs
                $("#tabs li").removeClass("current");
                $("#content iframe").hide();
                $("#content #header_bar, #content #main_content")
                    .hide();
                // add new tab and related content
                $("#tabs")
                    .append(
                        "<li class='current'><a class='tab' id='"
                        + $(link).attr("rel")
                        + "' href='javascript:void(0);'>"
                        + $(link).html()
                        + "</a><a href='#' class='remove'>x</a></li>");
                var iframe_content = '<iframe id="'
                    + $(link).attr("rel")
                    + '_content" height="100%" border="0" style="border:0; "  width="100%" src="'
                    + $(link).attr("hf") + '">';
                $("#content").append(iframe_content);
                /*
                 * $("#content").append("<div id='" +
                 * $(link).attr("rel") + "_content'>" +
                 * $(link).attr("title") + "</div>");
                 */

                // set the newly added tab as current
                $("#" + $(link).attr("rel") + "_content").show();
            }


            // 左侧栏滑动
            $(".sidebar_toggle").click(function () {
                if ($(".main_sidebar").width() >= 155) {
                    $(".sidebar_menu").hide();
                    $(".main_sidebar").animate({width: "5px"});
                    $(".sidebar_toggle").toggleClass("sidebar_toggle_cur");
                    $(".content_wrapper").animate({marginLeft: "5px"});
                    //var c_width=$(".content_wrapper").width();
                    //$("#content").width(c_width+175);
                } else if ($(".main_sidebar").width() <= 20) {
                    $(".sidebar_menu").show();
                    $(".main_sidebar").animate({width: "155px"});
                    $(".sidebar_toggle").toggleClass("sidebar_toggle_cur");
                    $(".content_wrapper").animate({marginLeft: "155"});
                    //var c_width=$(".content_wrapper").width();
                    //$("#content").width(c_width-180);
                }


            })


            /*	$(".logo_wifi").hover(function() {

             $(".wifi_bomb_box").show();
             }, function() {
             $(".wifi_bomb_box").hide();
             })*/

            // 退出登录

            $(".login_account").click(function () {
                $(".quit_account").show();
            })
            $(".quit_account_con").click(function () {
                $(".quit_account").hide();
            })

            //加载菜单
            $.ajax({
                type: "get",
                dataType: "json",
                url: baseURL + "/console/loadMenu.mvc",
                success: function (res) {
                    if (res.code == "0" || res.code == "2") {
                        alert(res.desc);
                        return;
                    }
                    var data = res.data || res;
                    var munu;
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            $('#munu').append("<li class='treeview' id='" + i + "'> <a href='javascript:void(0);'><img src="+ baseURL+data[i].menuIcon+">" + data[i].name + "<s class='iGuide iGuide_cur'></s></a></li>");
                            $('#munu').find('#' + i).append('<ul class="treeview_menu">');
                            for (var j = 0; j < data[i].items.length; j++) {
                                if (data[i].items[j].href == "") {
                                    $('#munu').find('#' + i + '').find("ul").append('<li><a  href="javascript:void(0);"><img src="'+item[j].menuIcon+'">' + data[i].items[j].name + '</a><i></i></li>');
                                } else {
                                    $('#munu').find('#' + i + '').find("ul").append('<li ><a   href="javascript:void(0);" hf="' + baseURL + data[i].items[j].href + '" rel="' + i + '' + j + '" target="' + data[i].items[j].target + '">' + data[i].items[j].name + '</a><i></i></li>');
                                }
                            }
                        }
                    }

                    //导航切换
                    // $(".menuson li").click(function () {
                    //     $(".menuson li.active").removeClass("active");
                    //     $(this).addClass("active");
                    // });
                    //
                    // $('.title').unbind().click(function () {
                    // 	var $ul = $(this).next('ul');
                    //     $('dd').find('ul').slideUp();
                    //     if ($ul.is(':visible')) {
                    //         $(this).next('ul').slideUp();
                    //     } else {
                    //         $(this).next('ul').slideDown();
                    //     }
                    // });

                }
            });

            //监听回退


            if (window.history && window.history.pushState) {

                $(window).on('popstate', function () {
                    var hashLocation = location.hash;
                    var hashSplit = hashLocation.split("#!/");
                    var hashName = hashSplit[1];

                    if (hashName) {
                        var hash = window.location.hash;
                        if (hash === '') {
                            window.history.forward(1);
                            //alert('後退按鈕點擊');
                            $.msg.toast("请点击右上方退出登录");
                        }
                    }
                });

                window.history.pushState('forward', null, '#forward');
            }


        });


//获取列表中的原有内容
var content;
try {
    document.getElementsByClassName("info_collision_con")[0].innerHTML;
}
catch (e) {
}
//每被调用一次，就将原有内容添加一份，这里要写自己要加载的内容或指令
function addLi() {
    document.getElementsByClassName("info_collision_con")[0].innerHTML += content;
}
/* 监听滚动条*/
$(".info_collision_con").scroll(function () {
    //下面这句主要是获取内容的总高度
    var htmlHeight = document.getElementsByClassName('info_collision_con')[0].scrollHeight;
    //clientHeight是内容在整个div中的可视高度
    var clientHeight = document.getElementsByClassName("info_collision_con")[0].clientHeight;
    //scrollTop是滚动条的top位置
    var scrollTop = document.getElementsByClassName("info_collision_con")[0].scrollTop;

    //通过判断滚动条的top位置与可视内容之和与整个内容的高度是否相等来决定是否加载内容；
    if (scrollTop + clientHeight == htmlHeight) {
        addLi();
    }
})

var content_data;
try {
    content_data = document.getElementsByClassName("data_display")[0].innerHTML;
}
catch (e) {
}
function addLi() {
    document.getElementsByClassName("data_display")[0].innerHTML += content_data;
}
$(".data_display").scroll(function () {
    var htmlHeight = document.getElementsByClassName('data_display')[0].scrollHeight;
    var clientHeight = document.getElementsByClassName("data_display")[0].clientHeight;
    var scrollTop = document.getElementsByClassName("data_display")[0].scrollTop;
    if (scrollTop + clientHeight == htmlHeight) {
        addLi();
    }


})
page_global.addUrlTab = function (title, url) {
    // If tab already exist in the list, return
    var conent_tab_id = Math.random() * 10000;
    // hide other tabs
    $("#tabs li").removeClass("current");
    $("#content iframe").hide();
    $("#content #header_bar, #content #main_content")
        .hide();
    // add new tab and related content
    $("#tabs")
        .append(
            "<li class='current'><a class='tab' id='"
            + conent_tab_id
            + "' href='#'>"
            + title
            + "</a><a href='#' class='remove'>x</a></li>");
    var iframe_content = '<iframe id="'
        + conent_tab_id
        + '_content" height="100%" border="0" style="border:0; "  width="100%" src="'
        + url + '">';
    $("#content").append(iframe_content);
    /*
     * $("#content").append("<div id='" +
     * $(link).attr("rel") + "_content'>" +
     * $(link).attr("title") + "</div>");
     */

    // set the newly added tab as current
    $("#" + conent_tab_id + "_content").show();
}
								

