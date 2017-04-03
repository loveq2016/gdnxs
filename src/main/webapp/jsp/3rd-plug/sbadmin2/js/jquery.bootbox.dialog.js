/**
 * Created by ki_tom on 15/9/8.
 * required jquery bootbox bootstrap-dialog
 */
(function ($) {
    $.extend({
        dialog: {//命名空间
            /**
             *
             * @param options
             * options:{
             * title:"查看标题"
             * url:"查看页面地址"
             * className: "弹出框样式"
             * confirmcallback: function(){}//点击确定按钮事触发的事件，参数参看 bootbox 文档
             * cancelcallback: function(){}//点击取消按钮事触发的事件，参数参看 bootbox 文档
             * afterload:弹出框页面加载完毕后触发的时间 参数参看 bootstrap dialog loaded.bs.modal 事件
             * addbtns 添加的按钮组
             * }
             * @returns dialog
             */
            addoredit: function (options) {
                var buttons =  {
                    // 另一个按钮配置
                    cancel: {
                        label: '取消'
                        , className: "btn-light-blue"
                        , callback: options.closecallback || function () {
                        }
                    },
                    // 其中一个按钮配置
                    success: {
                        // 按钮显示的名称
                        label: "保存"
                        , className: "btn-light-blue"    // 按钮的类名
                        , callback:function (evt) {
                            $(this).find('button[data-bb-handler="success"]').addClass("disabled").text("请稍后...");
                            options.confirmcallback(evt);
                        }

                    }
                };
                options.addbtns&& $.isPlainObject(options.addbtns)&&$.extend(buttons,  options.addbtns);
                var addoredit_dialog = bootbox.dialog({
                    title: options.title
                    , url: options.url
                    //,message:addrolediv
                    // 是否显示关闭按钮，默认true
                    , closeButton: true
                    , className: options.className || "default-bootbox-modal"//自定义宽度
                    , // dialog底端按钮配置
                    buttons:buttons
                });
                options.afterloaded && addoredit_dialog.on('loaded.bs.modal', options.afterloaded);
                return addoredit_dialog;

            },

            
            /**
             *  自定义的弹窗，可有多个按钮且可自定义相对应的事件 by Chang
            * @returns customdialog
            */
           customdialog: function (options) {
               var buttons =  {
               };
               options.addbtns&& $.isPlainObject(options.addbtns)&&$.extend(buttons,  options.addbtns);
               var customdialog_dialog = bootbox.customdialog({
                   title: options.title
                   , url: options.url
                   , closeButton: true
                   , className: options.className || "default-bootbox-modal"//自定义宽度
                   , // dialog底端按钮配置
                   buttons:buttons
               });
               options.afterloaded && customdialog_dialog.on('loaded.bs.modal', options.afterloaded);
               return customdialog_dialog;
           },
            
            /**
             *
             * @param options
             * options:{
             * title:"查看标题"
             * url:"查看页面地址"
             * className: "弹出框样式"
             * closecallback: function(){}//点击关闭按钮事触发的事件，参数参看 bootbox 文档
             * afterload:弹出框页面加载完毕后触发的时间 参数参看 bootstrap dialog loaded.bs.modal 事件
             * }
             * @return dialog
             */
            view: function (options) {
                var viewdialog = bootbox.dialog({
                    title: options.title
                    , url: options.url
                    , closeButton: true
                    , className: options.className || "information-view-modal"//自定义宽度
                    , buttons: {
                        // 另一个按钮配置
                        cancel: {
                            label: '关闭',
                            className: "btn-danger",
                            callback: options.closecallback || function () {
                            }
                        }
                    }
                });
                options.afterloaded && viewdialog.on('loaded.bs.modal', options.afterloaded);
                return viewdialog;
            }   /**
             * 自定义弹窗内容
             * id和name 都在前面加了"_"，根据id或name拿对象时，记得加上"_"
             * title:标题 可选
             * htmlId/msg: html元素 jquery选择器或者 文本文字 二选一
             */
            , defdialog: function (options) {
                var message;
                var $html = (options.htmlId && $(options.htmlId).clone(true));
                if($html.length>0){
                    $html.css({"display": "block"});
                    $html.attr("id", "_" + $html.attr("id"));
                    //处理id /name防止重复 id、单选按钮、多选框默认值失效
                    $html.children().each(function (index, item) {
                        item.name && (item.name = "_" + item.name);
                        item.id && (item.id = "_" + item.id);
                    });
                    message = $html;
                }else{
                    message = options.msg;
                }

                var defdialog = bootbox.dialog({
                    title: options.title
                    , message: message
                    , closeButton: true
                    , className: options.className || "default-bootbox-modal"//自定义宽度
                    , buttons: {
                        // 另一个按钮配置
                        cancel: {
                            label: '取消',
                            className: "btn-danger",
                            callback: options.closecallback || function () {
                            }
                        }
                        ,
                        // 其中一个按钮配置
                        success: {
                            // 按钮显示的名称
                            label: "保存"
                            , className: "btn-success"    // 按钮的类名
                            , callback: options.confirmcallback || function () {
                            }

                        }
                    }
                });
                options.afterloaded && viewdialog.on('loaded.bs.modal', options.afterloaded);
                return defdialog;
            }
        }
    });
})(jQuery)
