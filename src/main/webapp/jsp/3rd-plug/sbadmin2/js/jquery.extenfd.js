/**
 * User: zjt
 * DateTime: 16/8/5 16:31
 */
(function ($) {

    $.extend({

        validate : {

            isEmpty:function(str){
                return (str == null || str == undefined || str == '');
            },
            isNotEmpty:function(str){
                return (str != null && str != undefined && str != '');
            }

        },
        getCurrentUser:function(){
            var sStorage = window.sessionStorage;
            var user = JSON.parse(sStorage.getItem("user"));
           return user;
        }

    });

}(jQuery));
