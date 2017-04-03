/**
 * Created by ki_tom on 16/3/11.
 */


var roleTable;
$(document).ready(function () {

    roleTable = $('#role_list_table').bootstrapTable({
        url: baseURL + '/sysmgr/getRoleList?' + _csrf + '=' + token
        , method: 'post'
        , dataType: "json"
        , cache: false
        , striped: true
        , pagination: true
        , "queryParamsType": "limit"
        , singleSelect: false
        , contentType: "application/x-www-form-urlencoded"
        , pageSize: 10
        , pageNumber: 1
        , pageList: [10, 25, 50, 100, 'All']
        , search: false
        , showColumns: true
        , showRefresh: true
        , showPaginationSwitch: false
        , smartDisplay: false
        , maintainSelected: true
        , showToggle: false
        , idField: 'ID'
        , sidePagination: "server"
        , toolbar: '#role_toolbar'
        ,fixedColumns: true
        ,fixedNumber:1
        ,fixedPos:'right'
        , queryParams: function (params) {
            $.extend(params, $('#role_search').serializeObject());
            return params;

        }
        , responseHandler: function (response) {

            var griddata = {};		//表格数据
            try {
                griddata.rows = response.rows || [];			//当前页的数据
                griddata.total = response.total;				//总记录数
            } catch (e) {
                griddata.rows = [];
                griddata.total = 0;
            }

            return griddata;
        },

     /*   onClickRow: function (row, tr) {
            roleTable.currentrow = row;
        }
        ,*/ columns: [
            {
                title: ''
                , checkbox: true
            }
           /* , {
                title: '角色ID'
                , field: 'ID'
                , sortable: true
            }*/
            , {
                field: 'ROLE_NAME'
                , title: '角色名称'
                , sortable: true
                ,formatter: function (value, row, index) {
                	if(row.ID == '001' || row.ID == '002' || row.ID == '003' || row.ID == '004' || row.ID == '005'){
                		value+="<span style='color:red;'>*</span>";
                	}
                	return value;
                }
            }

            , {
                field: 'PERMISSION_NAME'
                , title: '拥有权限'
                , sortable: true
            }
            , {
                field: 'ROLE_DESC'
                , title: '角色描述'
                , sortable: true
            }
            , {
                title: '操作'
                , width: 120
                , align: 'center'
                //,fixed:true
                , formatter: function (value, row, index) {
                    var str =
                        '&nbsp;&nbsp;<a href="javascript:void(0)"   onclick="grantPermission(\' ' + row.ID + ' \',\''+index+'\')">授予权限</a>' +
                        '&nbsp;&nbsp;<a href="javascript:void(0)"   onclick=\'editRole("' + row.ID + '","'+row.PERMISSION_IDS+'","'+index+'")\'>修改</a>';
                    return str;
                }

            }

        ]

    });

});


function role_search(){
    roleTable.bootstrapTable("refresh");
}

//为角色授予权限
function grantPermission(id,index) {
    roleTable.bootstrapTable('uncheckAll');
    roleTable.bootstrapTable('check', index);
    roleTable.currentrow = roleTable.bootstrapTable('getSelections')[0];
    var dlg = bootbox.dialog({
        title: '选择权限'
        , url: baseURL + "/jsp/sysextmgr/role/permission_tree_checkbox.jsp"
//        , size: "small"		//small
        , closeButton: true
        , className: "my-modal"
        ,
        buttons: {
            cancel: {
                label: '取消'
                , className: "btn-light-blue"
                , callback: function () {
                }
            },
            success: {
                label: "确定"
                , className: "btn-light-blue"
                , callback: function () {

                    //得到选中节点
//                    var treeObj = $.fn.zTree.getZTreeObj("tree");
//                    var nodes = treeObj.getCheckedNodes();
                	var ids = checkboxs.getCheckedValues();
                    if (ids.length > -1) {

//                        var ids = "";
//                        for (var i = 0; i < nodes.length; i++) {
//                            ids += nodes[i].ID + ",";
//                        }

                        //授予权限
                        $.ajax({
                            type: "post",
                            url: baseURL + "/sysmgr/grantPermissionToRole?" + _csrf + "=" + token,
                            dataType: "json",
                            data: {roleId: roleTable.currentrow.ID, permissionIds: ids},
                            success: function (response) {

                                if (response && response.success == true) {

                                    bootbox.hideAll();										//关闭窗口
                                    $.msg.success(response.msg);
                                    roleTable.bootstrapTable('refresh');		//刷新页面

                                } else {
                                	$.msg.fail(response.msg);
                                    return false;
                                }

                            },
                            error: function (e) {
                                $.msg.fail("授予权限失败 ,请稍后重试！");
                                return false;
                            }

                        });

                    } else {
                    	$.msg.fail("请选择一个权限！");
                        return false;
                    }

                    return false;

                }

            }
        }

    });

}


//新增
function addRole() {
    var dialog = $.dialog.addoredit({
        title: '添加角色'
        , url: baseURL + "/jsp/sysextmgr/role/role_add.jsp?" + _csrf + '=' + token
        //新增事件
        , confirmcallback: function () {
            if (!$('#role_addform').valid())return false;
            // 提交数据
            $('#role_addform').ajaxSubmit({
                dataType: 'json',
                success: function (result) {
                    console.info(result);
                    if ("1" == result.code) {
                        $.msg.success('新增角色成功');
                        roleTable.bootstrapTable('refresh');
                    } else {
                        $.msg.fail(result.desc);
                    }
                },
                error: function () {
                    $.msg.fail('新增角色失败，可能是由网络原因引起的，请稍候再试');
                }
            });

        }

    });
}
//编辑
function editRole(id,permissionIds, index) {
    debugger;
    //alert(index);
    roleTable.bootstrapTable('uncheckAll');
    roleTable.bootstrapTable('check', index);
    roleTable.currentrow = roleTable.bootstrapTable('getSelections')[0];
    $.dialog.addoredit(
        {
            title: "修改角色"
            , url: baseURL + "/jsp/sysextmgr/role/role_edit.jsp?" + _csrf + '=' + token
            //,className:"my-modal"
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            , afterloaded: function () {
            //数据源：currentrow
            //console.info(currentrow);
            $('#edit_roleId').val(   roleTable.currentrow.ID);
            $('#edit_roleDesc').val(roleTable.currentrow.ROLE_DESC);
            $('#edit_roleName').val(roleTable.currentrow.ROLE_NAME);
            $('#edit_role_permissionIds').val(permissionIds);

        }
            //修改事件
            , confirmcallback: function () {
            if (!$('#role_editform').valid())return false;
            $('#role_editform').ajaxSubmit({
                dataType: 'json',
                success: function (result) {
                    if ("1" == result.code) {
                        $.msg.success('修改角色成功');
                        roleTable.bootstrapTable('refresh');
                    } else {
                        $.msg.fail(result.desc);
                    }
                },
                error: function () {
                    $.msg.fail('修改角色失败，可能是由网络原因引起的，请稍候再试');
                }
            });

        }
    })
}

function delRole(){
	$('input[name="btSelectItem"][value="001"]').removeAttr("checked");
/*	$('input[name="btSelectItem"][value="002"]').removeAttr("checked");
	$('input[name="btSelectItem"][value="003"]').removeAttr("checked");
	$('input[name="btSelectItem"][value="004"]').removeAttr("checked");
	$('input[name="btSelectItem"][value="005"]').removeAttr("checked");*/
    var ids  = $('input[name="btSelectItem"]:checked').strvalpresuff();
    
    if( !ids || ids =='' ){
    	if($('input[name="btSelectAll"]').attr("checked")){
    		$('input[name="btSelectAll"]').removeAttr("checked");
    		$.msg.toast('系统内角色无法删除');
    		return;
    	}
    	$('input[name="btSelectAll"]').removeAttr("checked");
    	$.msg.toast();
    	return;
    }
    $.msg.confirm(function(){
        $.ajax({
            url:baseURL+"/role/delete.mvc?"+_csrf+"="+token,
            data:{ids:ids},
            method:"post",
            dataType:"json",
            success:function(res){
                if(res.code=="1"){
                    $.msg.success(res.desc);
                    roleTable.bootstrapTable('refresh');
                }else{
                    $.msg.fail(res.desc);
                }
            }
        })
    },"确定要删除吗?");



}