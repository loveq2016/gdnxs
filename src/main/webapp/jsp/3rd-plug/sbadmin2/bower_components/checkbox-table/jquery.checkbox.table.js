/**
 * Created by ki_tom on 16/3/17.
 * checkbox table 插件
 * 支持本地及远程url数据源
 * 数据格式:
 * [
 * {
 * groupKey:"分类名称",
 * groupData:[//分类数据
 * {
 * text:"",
 * value:""
 * }
 * ]
 * },{}
 * ]
 * 请求示例:
 * $("div#a").checkboxTable({
    url:url,
    columns:8,
    groupKey:"moduelName",
    groupData:"items"
    })
 */

(function ($) {
    $.fn.extend({
        checkboxTable: function (options) {
            //默认参数
            var self = this;
            console.info(self);
            var defaults = {
                columns:5,//默认显示每行显示列数
                data:undefined,//本地数据源
                url:"",//远程数据源
                method:"post",//请求方法
                params:{},//请求参数
                itemText:"text",//要显示的字段
                itemValue:"value",//隐藏的字段
                groupKey:"groupKey",//分组类别
                groupData:"groupData",//分组数据
                itemClass:"checkbox-table-item",//每一行的样式
                headerClass:"checkbox-table-header",//类别样式
            	defaultValue:undefined
                //renderTo:$(self),//渲染位置
            };
            //使用jQuery.extend 覆盖插件默认参数
            var opts = $.extend({}, defaults, options);
           // opts.params[_csrf] = token;
            var data;
            if((!opts.data)&&!opts.url){return;}
            if((!opts.data)&&opts.url){
                $.ajax({
                    url:opts.url,
                    type:opts.method,
                    async:false,
                    data:opts.params,
                    dataType:"json",
                    success:function(res){
                        data = res.data;
                    }
                });
            }else{
                data = opts.data;
            }
            if(!data){return;}

            //处理数据渲染
            var values,$renderTo = $(this).html('');
            var $chkboxTmpl = $('<div class="'+opts.itemClass+'"><input type="checkbox"/></div>');;
            //已勾内容
            var default_value = '';
            if(opts.defaultValue ){
            	default_value = opts.defaultValue + ',';
            }
            for(var i=0;i<data.length;i++){

                var category = $.trim(data[i][opts.groupKey]);
                var groupData = data[i][opts.groupData];
                //头部信息		
                $renderTo.append('<div class="'+opts.headerClass+'"><input type="checkbox" group="'+i+'"/>'+category+'</div>');
                //item信息
                var $items = $('<div>');
                var $chk;
                var $chkboxrow = $chkboxTmpl.clone();
                var text,value;
                for(var j=0;j<groupData.length;j++){
                    //分类数据
                    value = groupData[j];
                    text = groupData[j][opts.itemText];
                    value = groupData[j][opts.itemValue];

                        $chk =  $chkboxrow.find("input:checkbox:first").clone();
                        //判断值
                        if( value && value != '' && default_value.indexOf(value+',')>=0){
                        	$chk.attr('checked','checked');
                        }
                        $chk.val(value).attr('group','group'+i);
                        $chk.val(value).attr('children','children');
                        $chkboxrow.append($chk).append(text).append("&nbsp;&nbsp;&nbsp;&nbsp;");

                        if(((j+1)%opts.columns==0)||j==groupData.length-1){
                            $chkboxrow.find("input:checkbox:first").remove();
                            $items.append($chkboxrow);
                            $chkboxrow = $chkboxTmpl.clone();
                        }
                }
                $renderTo.append($items);
                $renderTo.find('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '40%' // optional
                });
            }

            //类别标题checkbox添加联动事件
            $('.'+opts.headerClass+' input:checkbox').on("ifChanged",function(){
                var $input  = $(this);
                //console.info($input);
                $('input:checkbox[group=group'+$input.attr('group')+']').iCheck($input.attr('checked')=="checked"?"check":"uncheck");
            });
           /* //子级联动父级
            $('.'+opts.itemClass+' input:checkbox').on("ifChanged",function(){
                var $input  = $(this);
                var checked = $input.attr("checked");
                var groupId = $input.attr("group");
                var unCheckedSize = $('input:checkbox[group='+groupId+']:not(:checked)').size();
                groupId = groupId.replace("group","");
                if(unCheckedSize>0){
                    $('input:checkbox[group='+groupId+']').iCheck("uncheck");
                }else{
                    $('input:checkbox[group='+groupId+']').iCheck("check");
                }
            });*/
            //返回所有选中的input:checkbox
            this.getCheckedValues=function(){
            	return this.find('input[children="children"]:checked').strval();
            }
            
            return this;

        }
    });

})(jQuery);