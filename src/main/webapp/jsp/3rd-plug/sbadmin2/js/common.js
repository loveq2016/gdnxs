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




