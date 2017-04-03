/**
 * Created by ki_tom on 16/12/1.
 *
 */
/*拦截请求,加密处理*/

      var userKey =getUserKey();
jQuery.aop.before( {target: $, method: /(ajax|post|get)/},
    function(args, method_name) {

        if(args&& args[0] &&  args[0].url && args[0].url.indexOf(gl_host)!=-1&&
            (method_name =='ajax'||method_name == 'get' ||method_name=='post'))
        {
            //解析url上的参数
            var url_params = parse_url(args[0].url);

            args[0].url =args[0].url.replace(/(\?.*)/,'');

            var params = args[0].data||{};

            //如果是字符串
            if(typeof params =="string")
                params = parse_url(params);
            //整理参数
            jQuery.extend(params,url_params);
            //console.info(params);
            //修改请求参数顺序及计算checksum
            hander_params(params);
            //请求参数重新赋值
            args[0].data = params;
        }

    }
);


function parse_url(url){ //定义函数
   /* var pattern = /(\w+)=(\w+)/ig;//定义正则表达式
    var parames = {};//定义数组
    url.replace(pattern, function(a, b, c){
        parames[b] = c;
    });*/

    var parames = {};//定义数组
    var num=url.indexOf("?")
    url=num>-1?url.substr(num+1):url; //取得所有参数   stringvar.substr(start [, length ]

    var arr=url.split("&"); //各个参数放到数组里
    for(var i=0;i < arr.length;i++) {
        num = arr[i].indexOf("=");
        if (num > 0) {
            name = arr[i].substring(0, num);
            if(name=='checksum') continue;
            value = arr[i].substr(num + 1);
            parames[name] = decodeURIComponent(value).replace(/\+/g,' ');
        }
    }
    return parames;//返回这个数组.
}

function  hander_params(params){
    var checksum_str = "";
   try{
       //清楚原有连接请求参数
       delete  params.userId;
       delete  params.timestamp;
       delete  params.checksum;
       delete  params._csrf;
       delete  params._;
       delete  params.order;

   }catch(e){

   }
    //排序
    //var sort_params = new HashMap();
    /*var arr = [];
    for(var key in params){
        //sort_params.set(key,params[key]);
        var item = params[key];
        if(item!=0&&!item) continue;
        arr.push(item);
    }
    //排序arr
    arr.sort();
    for(var i=0;i<arr.length;i++)
    {
        var item = arr[i];
        checksum_str+=(typeof str == 'string')?item.replace(/(^\s+)|(\s+$)/g,""):item;
    }*/
    /*//计算params
    sort_params.forEach(function(val, key) {
        checksum_str+=(typeof str == 'string')?val.replace(/(^\s+)|(\s+$)/g,""):val;
    });*/
    //重新赋值加密
//    params['userId'] = 'yw&2r9vs09';
    var checkstr ='';
    params['timestamp']=moment().format("YYYYMMDDHHmmss");
    if(userKey){
    	checkstr = userKey.userKey+params['timestamp'];
    	 params["userId"] = userKey.userId;
    }

    params['checksum'] = md5(checkstr).toUpperCase();
}


//获取userKey
function  getUserKey()
{
	var sStorage = window.sessionStorage;
	var userKeyTime=sStorage.getItem("userKeyTime");
	if(userKeyTime){
		if(moment().format("YYYYMMDD")==userKeyTime){//相等说明此userKey是当天获取的
			return {userKey:sStorage.getItem("sercert_userKey"),userId:sStorage.getItem("secert_userId")};
		}
	}
	var userKey;
	 $.ajax({
         type : "GET",
         url : baseURL+"/user/getUserKey.mvc",
         async:false,
         dataType:'json',
         data : {
         },
         success : function(rs) {
        	 if(rs.code&&rs.code==1){
        		 sStorage.setItem("userKeyTime",moment().format("YYYYMMDD"));
            	 sStorage.setItem("sercert_userKey",rs.userKey);
            	 sStorage.setItem("secert_userId",rs.userId);
            	 userKey =  rs;
        	 }
         }
     });
	 console.info(userKey);
	 return userKey;

}
//同步请求鉴权处理
function create_checksum_url(url)
{

    var params = parse_url(url);
    url =url.replace(/(\?.*)/,'');
    //params['userId'] = 'yw%262r9vs09';

    hander_params(params);
    url+="?_";
    for(var key in params)
    {
        url+="&"+key+"="+params[key];
    }
    return url;
}