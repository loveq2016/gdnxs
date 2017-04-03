/**
<div id="menuContent" class="menuContent" style=" position: absolute;">
<ul id="orgTree" class="ztree" style="margin-top:0; width:160px;"></ul>
</div>

 */

  

  
    //var allowClick = true; //标记节点是否能被点击
   var sdorg={};

    /**
     * 初始化组织机构树
     * url 请求地址
     * keyName 显示字段名，对应数据库要显示的字段名
     * asyncUrl 异步查询子节点URL（含本节点）
     * renderId 渲染位置
     * nodeClick 点击时触发的事件
     * ischkbox 是否显示多选框
     * beforeNodeClick 点击前触发的事件
     */
    sdorg.showcurrorg = function (url,keyName,asyncUrl,renderId,nodeClick,beforNodeClick,ischkbox,nodeCheck) {
    var orgNodes;
    var setting = {
            data:{
                simpleData:{
                    enable:true,
                    idKey:"ID",
                    pIdKey:"PARENT_ID",
                    root:0
                },
                key:{
                    name:keyName
                }
            },
            view:{
                showIcon:true
            },
            check:{
            	enable:ischkbox
            	,chkStyle:'checkbox'
            	,chkboxType: { "Y": "s", "N": "ps" }
            	,autoCheckTrigger: true
            },
            async:{
                enable:true,
                url:asyncUrl,
                autoParam:["ID=id"],
                dataFilter:ajaxDataFilter
            },
            callback:{
//                onExpand:expandParentOrg,
                onClick:nodeClick||_nodeClick,
                beforeClick:beforNodeClick||_beforNodeClick,
                onCheck:function(event, treeId, treeNode){
                	var curnode = treeNode;
                	//console.info(treeNode);
                	while(treeNode.getParentNode())
                	{
                		//取消选中时
                		if(!treeNode.checked){
						treeNode.getParentNode().checked=false;
						$('#'+treeNode.getParentNode().tId+'_check').removeClass('checkbox_true_part').addClass('checkbox_false_full');
						var children = treeNode.getParentNode().children;
						var isallunchecked =true;
						for(var i=0;i<children.length;i++){
								if(children[i].checked){
									isallunchecked =false;
									break;
								}
						}
						//设置当前节点的子节点状态
								treeNode.getParentNode().check_Child_State = isallunchecked?0:1;
						//console.info(treeNode.getParentNode().check_Child_State);
						//console.info(treeNode.getParentNode())
						}
						//选中时
						if(treeNode.checked){
							//treeNode.getParentNode().checked= true;
							//$('#'+treeNode.getParentNode().tId+'_check').removeClass('checkbox_false_part').addClass('checkbox_true_full');
						var children = treeNode.getParentNode().children;
						var isallchecked =true;
						for(var i=0;i<children.length;i++){
								if(!children[i].checked){
									isallchecked =false;
									break;
								}
						}
							//设置当前节点的子节点状态
								treeNode.getParentNode().check_Child_State = isallchecked?2:1;
								treeNode.getParentNode().checked = isallchecked;
								isallchecked&&$('#'+treeNode.getParentNode().tId+'_check').removeClass('checkbox_false_part').addClass('checkbox_true_full');
							//console.info(treeNode.getParentNode());
							//console.info(treeNode.getParentNode().check_Child_State);
						}
						
                		treeNode = treeNode.getParentNode();
                	}
                	   nodeCheck.call(window,event, treeId, curnode);
                }
            }
        };
    
        $.ajax({
            url:url,
            type:'post',
            dataType:'json',
            async:false,
            success:function (result) {
                orgNodes = result.list;
                if (orgNodes.length > 0) { 
                    $.fn.zTree.init($('#'+renderId), setting, orgNodes);
                    // 展开机构树的根节点
                    var orgTree = $.fn.zTree.getZTreeObj(renderId);
                    var rootNodes = orgTree.getNodes();
                    if (rootNodes.length > 0)
                        orgTree.expandNode(rootNodes[0], true, false, true);
                    	//orgTree.expandAll(true);
                }
            }
	        ,error:function(){
	        	$.msg.fail('通讯错误，请稍候再试');
	        }
        });
    }
    
    /**
     * 异步加载节点数据后的处理函数
     * @param treeId
     * @param parent
     * @param result
     */
    function ajaxDataFilter(treeId, parent, result) {
        //if ('0' == result.code) {
        	//console.info(parent);
        	var nodes = [];
        result.data.orgList&&$.each(result.data.orgList,function(){
        		var nn = this;
        		nn.checked=parent.checked;
        		nodes.push(nn);
        	});
            return nodes;
            
        //}
    }

    function _nodeClick(event, treeId, treeNode) {

    }
    
    function _nodeCheck(event, treeId, treeNode) {

    }

    /**
     * 控制节点是否能被选中
     * @param treeId
     * @param treeNode
     * @param clickFlag
     */
    function _beforNodeClick(treeId, treeNode, clickFlag) {

    }
    
    //去掉字符串前后所有空格
    function Trim(str)
    {
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }
    
    //去掉字符串中所有空格(包括中间空格,需要设置第2个参数为:g)
    function Trim(str,is_global)
    {
        var result;
        result = str.replace(/(^\s+)|(\s+$)/g,"");
        if(is_global.toLowerCase()=="g")
        {
            result = result.replace(/\s/g,"");
         }
        return result;
    }