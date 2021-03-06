/**
 * Created by ki_tom on 16/3/15.
 */
//精确到小数点后3位
function toDecimal3Point(str) {
    //先精确到小数点后4位,会四舍五入
    var num = str.toFixed(4);
    //再截取最后一位,即变成3位,并不会四舍五入VVW
    return num.substring(0, num.length - 1);
}

//费率*100
function multiple(str){
    return str * 100 ;
}

//精确到小数点后2位
function toDecimal2Point(str) {
    //先精确到小数点后3位,会四舍五入
    var num = str.toFixed(3);
    //再截取最后一位,即变成2位,并不会四舍五入VVW
    return num.substring(0, num.length - 1);
}

//input框错误提示
$.fn.inputError=function(desc){
    $(this).parent().parent("div").attr("class","form-group has-error");
    $(this).next().text(desc);
}

//页面渲染器
var main_global={};
main_global.render= {
    /**
     * 字典处理
     * @param dicttype 字典类型
     * @param value 字典值
     * @returns {*}
     */
    dictFormat:function(dicttype,value){
       try{
           var dicts = window.top.page_global.dict_constants;
           if(dicts) {
               for (var i = 0; i < dicts.length; i++) {
                   if (dicts[i].dictType == dicttype && dicts[i].itemCode == value) {
                       return dicts[i].itemCodeDesc;
                   }
               }
           }
           return "";
       }catch(e){
       }
            return "";
    }
};

function setImagePreview(a,b) {
    var url ='';
    if (navigator.userAgent.indexOf("MSIE")>=1) { // IE
        url = document.getElementById(a).value;
    } else if(navigator.userAgent.indexOf("Firefox")>0) { // Firefox
        url = window.URL.createObjectURL(document.getElementById(a).files.item(0));
    } else if(navigator.userAgent.indexOf("Chrome")>0) { // Chrome
        url = window.URL.createObjectURL(document.getElementById(a).files.item(0));
    }
    var imgPre = document.getElementById(b);
    imgPre.src = url;
}


function getDateStr(AddDayCount){
    var dd = new Date();
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth()+1;//获取当前月份的日期
    var d = dd.getDate();
    return y+"-"+m+"-"+d;
}

function getDateTimeStr(AddDayCount){
    var dd = new Date();
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth()+1;//获取当前月份的日期
    var d = dd.getDate();
    return y+"-"+m+"-"+d+' '+dd.getHours()+":"+dd.getMinutes()+":"+dd.getSeconds();
}

function getMonthFirstDate(){
    var date_ = new Date();
    var year = date_.getFullYear();
    var month = date_.getMonth() + 1;
    var firststr  = year + '-' + month + '-01';//当月第一天
    return firststr;
}

function formatDateStr(str){
    var date_ = new Date(str);
    var year = date_.getFullYear();
    var month = date_.getMonth() + 1;
    var firststr  = year + '-' + month + '-'+date_.getDate()+' '+date_.getHours()+":"+date_.getMinutes()+":"+date_.getSeconds();
    return firststr;
}


function getPreMonthFirstDate(){
    var date_ = new Date();
    var year = date_.getFullYear();
    var month = date_.getMonth() + 1;
    var firststr  = year + '-' + (month-1) + '-01';//上月第一天
    return firststr;
}


function backupthis(a){
    if(!$(a).attr("backup")){
        $(a).attr("backup",$(a).val())
    }
}

function initAreaCity(a){
    for(var key in areaJson){
        $("#"+a).append("<option value='"+key+"'>"+key+"</option>")
    }
    $("#"+a).trigger("change")
}


function chageAreaCity(a,b){
    var val =  $("#"+a).val();
    for(var key in areaJson){
        if(key == val){
            $("#"+b).empty();
            for(var i=0;i<areaJson[key].length;i++){
                $("#"+b).append("<option value='"+areaJson[key][i]+"'>"+areaJson[key][i]+"</option>")
            }
        }

    }
}





