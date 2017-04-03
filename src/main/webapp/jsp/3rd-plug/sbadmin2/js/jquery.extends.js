//---------------------------jquery对象本身扩展---------------------------------------------------
$.extend({
	//优化客户端字符串类型数据使用
    stringBuffer:function(text){
      return new function StringBuffer(str)
        {
            var arr = [];
            str = str || "";
            arr.push(str);
            this.append = function(str1)
            {
                arr.push(str1);
                return this;
            };
            this.toString = function()
            {
                return arr.join("");
            };
        }(text);
    },
    //首字母小写
    headToLowerCase:function(text){
        return text?(text.substring(0,1).toLowerCase()+text.substr(1)):'';
    },
    //客户端系统类型
    clientSYSType:function(){
    	var sUserAgent = navigator.userAgent;
    	var isWin = (navigator.platform == "Win32") || (navigator.platform == "Windows");
    	var isMac = (navigator.platform == "Mac68K") || (navigator.platform == "MacPPC") || (navigator.platform == "Macintosh") || (navigator.platform == "MacIntel");          
    	if(isMac)
    	return "Mac";
    	var isUnix = (navigator.platform == "X11") && !isWin && !isMac;
    	if (isUnix) return "Unix";
    	var isLinux = (String(navigator.platform).indexOf("Linux") > -1);
    	if (isLinux) return "Linux";
    	if (isWin) {
    	var isWin2K = sUserAgent.indexOf("Windows NT 5.0") > -1 || sUserAgent.indexOf("Windows 2000") > -1;
    	if (isWin2K) return "Win2000";
    	var isWinXP = sUserAgent.indexOf("Windows NT 5.1") > -1 || sUserAgent.indexOf("Windows XP") > -1;
    	if (isWinXP) return "WinXP";
    	var isWin2003 = sUserAgent.indexOf("Windows NT 5.2") > -1 || sUserAgent.indexOf("Windows 2003") > -1;
    	if (isWin2003) return "Win2003";
    	var isWin2003 = sUserAgent.indexOf("Windows NT 6.0") > -1 || sUserAgent.indexOf("Windows Vista") > -1;
    	if (isWin2003) return "WinVista";
    	var isWin2003 = sUserAgent.indexOf("Windows NT 6.1") > -1 || sUserAgent.indexOf("Windows 7") > -1;
    	if (isWin2003) return "Win7";
    	}
    	return "other";
    	}
    //过滤指定值并返回原值或者默认值
    ,tovalidVal:function(srcval,defaultval,filtervals){
        return ((!srcval)||(filtervals&&filtervals.indexOf(srcval)!=-1)||srcval=="null"||srcval==null)? defaultval:srcval;
    }
    //string转int
    ,toint:function(src,defaultval){
        var r =parseInt(src);
        return isNaN(r)?(defaultval||0):r;
    }
    // 数组转带有单引号的字符串 eg:【1，2】转为 '1','2'字符串
    ,arrtostrpresuff:function(arr,prefix,suffix){
    if(!arr||arr.length<1) return "";
    var result = [];
    for(var i=0;i<arr.length;i++){
        result.push((prefix||'\'')+arr[i]+(suffix||'\''));
    }
    return result.toString();
        //获取字节长度
    }
    //获取加单引号字符串
    ,getPresuffStr:function(str){
        if(!str) return '';
        return "'"+str+"'";
    }
    ,dateFormat:function(timec,format)
    {
        return moment($.toint(timec)).format(format||"YYYY-MM-DD HH:mm:ss");
    }
    ,getTime:function(str){
        try {return new Date(str).getTime();}catch (e){return new Date().getTime();}
    },
     addUrlTab:function(title,url) {
		// If tab already exist in the list, return
		var conent_tab_id = Math.random()*10000;
		// hide other tabs
		$("#tabs li").removeClass("current");
		$("#content iframe").hide();
		$("#content #header_bar, #content #main_content")
				.hide();
		// add new tab and related content
		$("#tabs")
				.append(
						"<li class='current'><a class='tab' id='"
								+ conent_tab_id
								+ "' href='#'>"
								+title
								+ "</a><a href='#' class='remove'>x</a></li>");
		var iframe_content = '<iframe id="'
				+ conent_tab_id
				+ '_content" height="100%" border="0" style="border:0; "  width="100%" src="'
				+url + '">';
		$("#content").append(iframe_content);
		/*
		 * $("#content").append("<div id='" +
		 * $(link).attr("rel") + "_content'>" +
		 * $(link).attr("title") + "</div>");
		 */

		// set the newly added tab as current
		$("#" + conent_tab_id + "_content").show();
	}
});

//----------------------------扩展jquery类的方法---------------------------------------------------
$.fn.extend({
    //要扩展的方法
    /**
     * @return value Array .val() 集合
     */
    arrval : function() {
        var self = $(this);
        var result = [];
        if (self.length > 0) {
            self.each(function(i, o) {
                result.push($(o).val());

            });

        }
        return result;
    },
     /**
     * @return value Array .text() 集合
     */
    arrtext : function() {
        var self = $(this);
        var result = [];
        if (self.length > 0) {
            self.each(function(i, o) {
                result.push($(o).text());

            });

        }
        return result;
    }
    /**
     *
     * @return value string
     */
    ,strval:function(){

        return  $(this).arrval().toString();
    }
    /**
     * 返回加有单引号的值字符串 
     */
   ,strvalpresuff:function(prefix,suffix){
         var self = $(this);
        var result = [];
        if (self.length > 0) {
            self.each(function(i, o) {
                result.push((prefix||'\'')+$(o).val()+(suffix||'\''));
            });
        }
        return result.toString();
    }
   /**
    * 取 value 娶不到时 取text
    */
   ,valtext:function(){
	   return $(this).val()||$(this).text();
   }
    ,strtext:function(){

        return  $(this).arrtext().toString();
    }
    ,intval:function(){
        var val = $(this).val();
        val = val=='true'?1:parseInt(val);
        return isNaN(val)?0:val;
    }
    ,floatval:function(){
        var val = $(this).val();
        val = val=='true'?1:parseFloat(val);
        return isNaN(val)?0:val;
    },
      inttext:function(){
        var val = $(this).text();
        val = val=='true'?1:parseInt(val);
        return isNaN(val)?0:val;
    }
    ,floattxt:function(){
        var val = $(this).text();
        val = val=='true'?1:parseFloat(val);
        return isNaN(val)?0:val;
    },
    /**
     *计算val的和 
     */
    sumval:function(){
    	var  arr= $(this).arrval();
    	var sum=0;
    	for(var i=0;arr&&i<arr.length;i++){
    		sum+=parseFloat(arr[i])||0;
    	}
    	return sum;
    },
      /**
     *计算text的和
     */
      sumtext : function() {
        var self = $(this);
        var sum = 0;
        if (self.length > 0) {
            self.each(function(i, o) {
               sum+= parseFloat($(o).text())||0;
            });

        }
        return sum;
    },
    //获取字节长度
    getbytelen:function(includetxt){
        includetxt =includetxt||true;
        var self = $(this);
        var str = includetxt?self.valtext():self.val();
        str = $.trim(str);
        if(!str) return 0;
        var byteLen = 0, len = str.length;
        for( var i=0; i<len; i++ )
            byteLen += str.charCodeAt(i) > 255 ? 2 : 1;
        return byteLen;
    }
    //form表格序列化成对象
    ,serializeObject:function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [ o[this.name] ];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
}
    //判断所选元素是否为空
    ,isEmpty:function(){
       return $(this).size()<1;
    }
    //如果元素的null/[]设置为另外一个值[包括元素/jquery对象]
    ,default$Obj:function(dv){
        return $(this).size()<1?$(dv):$(this);
    }
    ,outerHtml:function(){
        return $(this).prop('outerHTML');
    }
    ,disabled:function(){
        $(this).attr('disabled','disabled');
    }
    ,enabled:function(){
        $(this).removeAttr('disabled');
    }

});

//----------------------------扩展jquery选择器-----------------------------------------------------
$.extend(
    $.expr[':'],
    {
        //根据指定的value值选择元素，默认无值时，选取没有value值的元素
        'field-value': function (el, indx, args) {
            var a, v = $.trim($(el).val());
            //alert(v==args[3]);
            if ( (a = args[3]) ) {
                switch ( a.charAt(0) ) {
                    /// begins with
                    case '^':
                        return v.substring(0,a.length-1) == a.substring(1,a.length);
                        break;
                    /// ends with
                    case '$':
                        return v.substr(v.length-a.length-1,v.length) ==
                            a.substring(1,a.length);
                        break;
                    /// contains
                    case '*': return v.indexOf(a.substring(1,a.length)) != -1; break;
                    /// equals
                    case '=': return v == a.substring(1,a.length); break;
                    /// not equals
                    case '!': return v != a.substring(1,a.length); break;
                    /// equals
                    default: return v == a; break;
                }
            }else if(a==v){
                return true;
            }
            return false;
        }
        ,'ge':function(el,index,args){
         return (args[3]|0)<=index;
       }
        ,'le':function(el,index,args){
         return (args[3]|0)>=index;
       }
    }
);
//-------------------------------------扩张JS原生类型方法----------------------------------------

    Array.prototype.indexOf = Array.prototype.indexOf||function(obj)
    {
        for(var i=0; i<this.length; i++)
        {
            if(this[i]==obj)
            {
                return i;
            }
        }
        return -1;
    }

    Date.prototype.format = function(format)
    {
        // format = format||"YYYY-MM-DD HH:mm"
        format = format||"YYYY-MM-DD"
        return new moment(this).format(format);
    }
