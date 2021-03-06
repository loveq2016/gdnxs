/**
 * User: zjt
 * DateTime: 2016/11/13 15:08
 *
 * 对日期的扩展
 */
$(function () {

    Date.prototype.Format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,      //月份
            "d+": this.getDate(),           //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3),        //季度
            "S": this.getMilliseconds()                         //毫秒
        };

        if (/(y+)/.test(fmt)){
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }

        for (var k in o){
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }

        return fmt;
    }

});


$.extend({

    date:{

        /**
         * 格式化到日期时间
         * @param str
         */
        formatToDateTime:function(str){
            return new Date(str).Format("yyyy-MM-dd hh:mm:ss");
        },

        /**
         * 格式化到日期
         */
        formatToDate:function(str){
            return new Date(str).Format("yyyy-MM-dd");
        },

        /**
         * 将日期字符串格式化成时间戳
         * @param dateStr
         */
        formatToTimestamp:function(dateStr){
            var newStr = dateStr.replace(/-/g,'/');
            var date =  new Date(newStr);
            var timestampStr = date.getTime().toString();
            return parseInt(timestampStr.substr(0, 10));
        }

    }

});