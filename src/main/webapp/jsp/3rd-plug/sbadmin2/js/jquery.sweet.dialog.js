/**
 * Created by ki_tom on 15/9/8.
 *
 * required jquery sweetalert
 * 使用示例：
 * $.msg.toast();
 */
(function($){
    var companyname;
    try{companyname= corp;}catch(e){ companyname="系统提示"}
    $.extend({
        msg:{
            /**
             *
             * @param title 标题
             * @param msg 内容
             */
            alert:function(title,msg){
                swal({
                    title: title||companyname
                    ,text: msg||"该提示框将会在两秒后自动关闭。"
                    ,confirmButtonText: "确认"
                    ,allowOutsideClick:true
                });
            },
            /**
             *
             * @param title 标题
             * @param msg 内容
             * @param timer 显示时间 ms
             */
            toast:function(title,msg,timer){
                swal({
                    title: title||"请至少选中一项数据进行操作!"
                    ,text: msg||"该提示框将会在两秒后自动关闭。"
                    ,timer: timer||2000
                    ,allowOutsideClick:true
                    ,showConfirmButton: false });
            },
            /**
             *
             * @param title 标题
             * @param msg 内容
             * @param timer 显示时间 ms
             */
            success:function(title,msg,timer){
                setTimeout(function(){
                    swal({
                        title: title||"删除成功!"
                        ,text: msg||"该提示框将会在两秒后自动关闭。"
                        ,timer: timer||2000
                        ,showConfirmButton: false
                        ,allowOutsideClick:true
                        ,type:"success"
                    });
                },300);
            },
            /**
             *
             * @param title 标题
             * @param msg 内容
             * @param timer 显示时间 ms
             */
            fail:function(title,msg,timer){
                setTimeout(function(){
                swal({
                    title: title||"删除失败!"
                    ,text: msg||"该提示框将会在两秒后自动关闭。"
                    ,timer: timer||2000
                    ,showConfirmButton: false
                    ,allowOutsideClick:true
                    ,type:"error"});
                },300);
            },
            /**
             * @callback 回调 传入参数为 clickresult :(确定)true||(取消)false
             *  @param title 标题
             * @param msg 内容
             */
            confirm:function(callback,title,msg,closeOnConfirm){
                swal({
                    title: title||"确认删除所选数据?"
                    ,text:msg|| "该操作不能撤销!"
                    ,type: "warning"
                    ,showCancelButton: true
                    ,confirmButtonColor: "#DD6B55"
                    ,confirmButtonText: "确认"
                    ,cancelButtonText: "取消"
                    //,allowOutsideClick:true
                    ,closeOnConfirm: false||closeOnConfirm
                    ,showLoaderOnConfirm: true
                },callback);
            },
            /**
             * @callback 回调 传入参数为 clickresult :(确定)true||(取消)false
             *  @param title 标题
             * @param msg 内容
             */
            prompt:function(callback,title,msg){
                swal({
                    title: title||companyname,
                    text: msg,
                    type: "input",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    animation: "slide-from-top",
                    inputPlaceholder: "请输入"
                    ,confirmButtonText: "确认"
                    ,cancelButtonText: "取消"
                    ,allowOutsideClick:true
                }, function (inputValue) {
                    if (inputValue === false) return false;
                    if (inputValue === "") {
                        swal.showInputError("输入框不能为空，请输入！");
                        return false;
                    }
                    callback&&callback.call(window,inputValue);
                });
            },
            /**
             * 参考  sweetalert 官方文档  http://t4t5.github.io/sweetalert/
             * @param options
             */
            dialog:function(options){

                swal({
                     title:options.title
                    ,text:options.msg
                    ,type:options.type
                    ,allowEscapeKey:options.allowEscapeKey
                    ,customClass:options.customClass
                    ,allowOutsideClick:options.allowOutsideClick||false
                    ,showCancelButton:options.showCancelButton||false
                    ,showConfirmButton:options.showConfirmButton||true
                    , confirmButtonText:options.confirmButtonText||"确定"
                    ,confirmButtonColor:options.confirmButtonColor||"#AEDEF4"
                    ,cancelButtonText:options.cancelButtonText||"取消"
                    ,closeOnConfirm:options.closeOnConfirm||true
                    ,closeOnCancel:options.closeOnCancel||true
                    ,imageUrl:options.imageUrl
                    ,imageSize:options.imageSize||"80x80"
                    ,timer:options.timer
                    ,html:options.html||false
                    ,animation:options.animation||true
                    ,inputType:options.inputType||"text"
                    ,inputPlaceholder:options.inputPlaceholder
                    ,inputValue:options.inputValue
                    ,showLoaderOnConfirm:options.showLoaderOnConfirm||false
                });
            },
            notify:function(content,type){
                var title ="系统提示";
                try{title =corp;}catch(e){}
                $.notify({
                    // options
                    icon: 'glyphicon glyphicon-warning-sign',
                    title:title,
                    message: content||""

                },{

                    element: 'body',
                    position: null,
                    type: type||"danger",//danger/info
                    allow_dismiss: true,
                    newest_on_top: false,
                    showProgressbar: false,
                    placement: {
                        from: "top",
                        align: "center"
                    },
                    spacing: 10,
                    z_index: 250000,
                    delay: 500,
                    timer: 2000,
                    mouse_over: null,
                    animate: {
                        enter: 'animated fadeInDown',
                        exit: 'animated fadeOutUp'
                    },
                    onShow: null,
                    onShown: null,
                    onClose: null,
                    onClosed: null,
                    icon_type: 'class',
                    template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
                    '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
                    ' <div><span data-notify="icon"></span>&nbsp;&nbsp;<span data-notify="title">{1}</span></div> ' +
                    '<div data-notify="message">{2}</div>' +
                    '<div class="progress" data-notify="progressbar">' +
                    '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
                    '</div>' +
                    '<a href="{3}" target="{4}" data-notify="url"></a>' +
                    '</div>'
                });
            },
            loading:function(options){
                var settings = $.extend({
                    autoOpen:true,
                    autoClose:true,
                    timeToHide:5000,
                    bgColor:"#3498db",
                    spinner:"spinner4",
                    zIndex:50000000,
                    renderTo:window.top//渲染到那一层的window对象
                },options);

                var el = $('.fakeloader',settings.renderTo.document);
                if(el.size()==0)
                    el = $('<div class="fakeloader"></div>').insertAfter(settings.renderTo.document.body);
                return el.fakeLoader(settings);
            }

        }
    });
})(jQuery)