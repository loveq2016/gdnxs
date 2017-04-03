
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@include file="../../../jsp/common/css_common.jsp" %>
<html>
<head>
  	 <style>
		body {
		background-color: white;
		margin:10px; padding:0;
		text-align: center;
		border-top: 0px;
		}
		div, p, table, th, td {
			list-style:none;
			margin:0; padding:0;
			color:#333; font-size:12px;
			/*font-family:dotum, Verdana, Arial, Helvetica, AppleGothic, sans-serif;*/
		}
		#testIframe {margin-left: 10px;}
		.modal-footer{
			 border-top: 0px;
		}
	  </style>
	  
	<style type="text/css">
			.ztree li span.button {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
			.add{margin-left:2px; margin-right: -1px; vertical-align:top; *vertical-align:middle}
	</style>

  <title>字典管理</title>
</head>
<body class="container">
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">&nbsp;</h3>
  </div>
  <div class="panel-body">

    <form action="${baseURL}/sysmgr/getDictionaryTree?${_csrf.parameterName}=${_csrf.token}" method="post" id="dictionary_search">
      <div class="searchDiv">
        <div class="panel panel-default">
          <div class="panel-body">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="searchLeft"></td>
                <td class="searchBg">
                  <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>
                        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">

                          <tr>
                           
                            <td width="100" height="30" align="right">字典类型：</td>
                            <td width="150"><input name="dictType" id="dictType" type="text" class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                            
                            <td width="100" height="30" align="right">字典名称：</td>
                            <td width="150"><input name="dictTypeDesc" id="dictTypeDesc" type="text" class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>

                            <td>&nbsp;&nbsp;<input class="btn btn-default " name="search" type="button" value="搜索" onclick="dictionary_search();"/>
                              &nbsp;&nbsp;<input class="btn btn-default" type="button" value="重置" onclick="javascript:document.getElementById('dictionary_search').reset();"/>
								&nbsp;&nbsp;	<a id="add" class="btn" href="javascript:void(0);" onclick="addDictionary()">
									<img src="${baseURL}/staticres/images/tianjia.png"> &nbsp;新增
								</a>
							</td>

                            
                          </tr>

                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
                <td class="searchRight"></td>
              </tr>
              <tr>
                <td class="searchButtomLeft"></td>
                <td class="searchButtom"></td>
                <td class="searchButtoRight"></td>
              </tr>
            </table>
          </div>
        </div>

      </div>
    </form>
    
    <table id="dictionary_list_table"></table>

	 <div id="dictionary_toolbar" align="left" style="margin-left: 20px;" >
     	<br><br><br><br>
     </div>
    <!--权限信息搜索表单 end-->
   
 
     <!-- 字典树 -->
  	<table border="1"  height="500px" align="center" style="margin-top: -25px;margin-left: 120px;border-color: #DDDDDD" >
		<tr>
			<td width = "523px" align="center" valign=top style="">
				<ul id="tree" class="ztree" style="width:523px; overflow:auto;"></ul>
			</td>
		</tr>	
	</table>
	
  </div>
</div>

</body>

</html>

<%@include file="../../../jsp/common/js_common.jsp" %>
<script type="text/javascript" src="${baseURL}/jsp/sysextmgr/dictionary/dictionary.js"></script>

<script type="text/javascript">
	var zTree;
	var demoIframe;
	//ztre配置
	var setting = {
		view: {
			dblClickExpand: false,
			showLine: false,
			selectedMulti: false,
			addHoverDom: addHoverDom,			//鼠标移入时,添加增加按钮
			removeHoverDom: removeHoverDom
		},
		edit:{
			enable: true,
			editNameSelectAll: true,
			showRemoveBtn: showRemoveBtn,		//是否显示修改和查看按钮
			showRenameBtn: showRenameBtn
		},
		callback: {
			beforeEditName: beforeEditName,		//修改事件
			beforeRemove: beforeRemove,			//删除事件
			beforeRename: beforeRename			//修改事件
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "ID",
				pIdKey: "PARENT_ID",
				rootPId: "",
				level:"LEVEL"
			}
		},
		callback: {
			onClick : function(treeId, treeNode) {
			}
		}

	};

	//当鼠标移入时,显示按钮
	function addHoverDom(treeId, treeNode) {
		//拼接id,得到当前节点
		var sObj = $("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length > 0 )
			return;
		//为节点增加（添加、修改、删除按钮）
		var addStr = "<span class='button add' id='addBtn_" + treeNode.tId + "' title='新增' onfocus='this.blur();'></span>";
		sObj.after(addStr);
		var addBtn = $("#addBtn_"+treeNode.tId);
		if (addBtn){
			addBtn.bind("click", function(){
				addDictionarySort(treeNode.ID,treeNode.level,treeNode.DICT_TYPE,treeNode.DICT_TYPE_DESC);
				return false;
			});
		}
		var removeBtn = $("#"+treeNode.tId+"_remove");
		if (removeBtn){
			removeBtn.unbind('click'); //取消原先事件
			removeBtn.bind("click", function(){
				delDictionary(treeNode.ID)
				return false;
			});
		}
		var editBtn = $("#"+treeNode.tId+"_edit");
		if (editBtn){
			editBtn.unbind('click'); //取消原先事件
			editBtn.bind("click", function(){
				editDictionary(treeNode.ID,treeNode.level,treeNode.DICT_TYPE,treeNode.DICT_TYPE_DESC,treeNode.ITEM_CODE,treeNode.ITEM_CODE_DESC);
				return false;
			});
		}

	};

	//当鼠标移出时,删除增加按钮
	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_"+treeNode.tId).unbind().remove();
	};

	//显示删除按钮
	function showRemoveBtn(treeId, treeNode) {
		return true;
	}

	//是否显示重命名按钮
	function showRenameBtn(treeId, treeNode) {
		return true;
	}

	function beforeRename(treeId, treeNode, newName, isCancel) {
		alert("Asd");
	}
	function beforeEditName(treeId, treeNode) {
		alert("修改");
	}
	function beforeRemove(treeId, treeNode) {
		alert("删除");
	}


	$(function(){
		dictionary_search();
	});

	/*
	 * 查询树
	 */
	function dictionary_search(){

		$('#dictionary_search').ajaxSubmit({
			dataType:'json',
			success:function (response) {
				if(response && response.success == true) {
					var t = $("#tree");
					t = $.fn.zTree.init(t, setting, response.nodes);
					demoIframe = $("#testIframe");
					demoIframe.bind("load", loadReady);
					var zTree = $.fn.zTree.getZTreeObj("tree");
					zTree.selectNode(zTree.getNodeByParam("id", 101));
				} else {
					$.msg.fail(response.msg);
				}

			},
			error:function () {
				$.msg.fail("获取数据失败,请重试！");
			}
		});

	}

	function loadReady() {
		var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
				htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
				maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
				h = demoIframe.height() >= maxH ? minH:maxH ;
		if (h < 530) h = 530;
		demoIframe.height(h);
	}

	//新增字典
	function addDictionary(){
		var dialog = $.dialog.addoredit({
			title:'新增字典'
			,url:baseURL+'/jsp/sysextmgr/dictionary/dictionary_add.jsp'
			,confirmcallback:function(){
				if(!$('#dictionary_addform').valid())
					return false;
				var btn = $(".modal-footer .btn-success");
				btn.attr("disabled","disabled");
				$('#dictionary_addform').ajaxSubmit({
					dataType:'json',
					success:function (response) {
						btn.removeAttr("disabled");
						if(response && response.success == true) {
							//重置表单、并查询
							$("#dictionary_search")[0].reset();
							dictionary_search();
							bootbox.hideAll();	//关闭窗口
							$.msg.success(response.msg);
						} else {
							$.msg.fail(response.msg);
							return false;
						}
					},
					error:function () {
						btn.removeAttr("disabled");
						$.msg.fail('新增字典失败，请重试！');
						return false;
					}
				});
				return false;
			}
		});
	}
</script>
