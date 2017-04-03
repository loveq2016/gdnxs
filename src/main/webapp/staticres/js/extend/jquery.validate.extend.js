/**
 * User: zjt
 * DateTime: 16/10/3 17:05
 *
 * 扩展jquery,提供验证相关的操作,调用方式$.validate
 */
$.extend({

    validate : {

        isEmpty:function(str){
            return (str == null || str == undefined || str == '');
        },
        isNotEmpty:function(str){
            return (str != null && str != undefined && str != '');
        }

    }

});