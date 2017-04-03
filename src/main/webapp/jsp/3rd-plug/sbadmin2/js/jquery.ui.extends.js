/**
 * Created by ki_tom on 16/11/26.
 */
$.extend({
    ui_date:function(startId,format) {

        // 调用日期插件,api:https://github.com/singod/jeDate
        var start2 = {
            dateCell : startId,
            format : format||'YYYY-MM-DD hh:mm:ss',
            festival : true,
            maxDate :moment().format('YYYY-MM-DD HH:mm:ss'), // 最大日期
            isTime : true,
            isinitVal : false,
            zIndex:50000//,
           /* choosefun : function(datas) {
                end2.minDate = datas; // 开始日选好后，重置结束日的最小日期
            }*/
        };
        //$(startId).attr('readonly','readonly');
        $(startId).attr('check-type','required date');
        jeDate(start2);

    },
    ui_date_double:function(startId,endId,format) {

        // 调用日期插件,api:https://github.com/singod/jeDate
        var start2 = {
            dateCell : startId,
            format : format||'YYYY-MM-DD hh:mm:ss',
            festival : true,
            maxDate  :moment().format('YYYY-MM-DD HH:mm:ss'), // 最大日期
            isTime : true,
            zIndex:50000,
            isinitVal : false,
            choosefun : function(datas) {
                end2.minDate = datas; // 开始日选好后，重置结束日的最小日期
            }
        };
        var end2 = {
            dateCell : endId ,
            format :format|| 'YYYY-MM-DD hh:mm:ss',
            festival : true,
            maxDate:moment().format('YYYY-MM-DD HH:mm:ss'), // 最大日期
            isTime : true,
            zIndex:50000,
            isinitVal : false,
            choosefun : function(datas) {
                start2.maxDate = datas; // 将结束日的初始值设定为开始日的最大日期
            }
        };
        $(startId).attr('check-type','required date');
        $(endId).attr('check-type','required date');
        jeDate(start2);
        jeDate(end2);

    }
});

