/**
 * User: zjt
 * DateTime: 16/10/3 17:04
 *
 * 扩展jquery对象,提供字符串相关操作,调用方式$.string
 */
$.extend({

    string:{

        /**
         * 获取项目基础路径
         * @returns {string}
         */
        getBaseURL:function() {

            //1,获取当前网站,例如http://localhost:8083/demo/console.jsp
            var url = window.document.location.href;

            //2,获取主机地址之后的目录，如：demo/console.jsp
            var pathName = window.document.location.pathname;

            //3,获取主机地址的最后索引
            var laseIndex = url.indexOf(pathName);

            //4,获取主机地址如：http://localhost:8083
            var host = url.substring(0, laseIndex);

            //5,获取带"/"的项目名，如：/demo
            var projectName = pathName.substring(0, pathName.substr(1).indexOf("/") + 1);

            return host + projectName;
        },

        /**
         * 返回按,号拼接的id
         */
        getIdsFromArray:function(array){

            if(array.length > 0){

                var ids = "";

                for(var i = 0; i < array.length;i++){

                    var obj = array[i];

                    //获取id
                    var id = "";
                    if($.validate.isNotEmpty(obj.id)){
                        id = obj.id;
                    }else{
                        id = obj.ID;
                    }

                    ids += id + ",";

                }

                return ids.substring(0,ids.length - 1);

            }
            else{
                return "";
            }

        },

        /**
         * 返回按,号拼接的id (包含单引号)
         */
        getSingleQuotesIdsFromArray:function(array){

            if(array.length > 0){

                var ids = "";

                for(var i = 0; i < array.length;i++){

                    var obj = array[i];

                    //获取id
                    var id = "";
                    if($.validate.isNotEmpty(obj.id)){
                        id = obj.id;
                    }else{
                        id = obj.ID;
                    }

                    ids += "'" + id + "',";
                }

                return ids.substring(0,ids.length - 1);

            }
            else{
                return "";
            }

        }


    }

});