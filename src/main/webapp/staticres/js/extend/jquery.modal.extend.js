/**
 * User: zjt
 * DateTime: 16/10/3 17:06
 *
 * 模态化窗体操作,调用方式$.dialog
 */
$.extend({

    modal:{

        /**
         * 显示模态化框
         * @param url
         * @proam size: 模态窗的大小,可选项为large,small,如果不传则默认标准大小
         * @returns {*|{show}}
         */
        show : function (url,size){

          return bootbox.dialog({
              url: url,
              size:size || ""
          });

        } ,

        /**
         * 显示模态框窗体
         * @param option: 分为url,size,params三个参数, 自动拼接参数
         * @returns {*|{show, show}}
         */
        showDailog:function(option){

            var url = option.url;
            var size = option.size;
            var params = option.params;

            //将参数拼接到url之后
            if(params){

                for(var key in params) {
                    url += (url.indexOf("?") != -1) ? "&" : "?";
                    url += (key + "=" + params[key]);
                }

            }

            return bootbox.dialog({
                url: url,
                size:size || ""
            });

        }

    }
    
});