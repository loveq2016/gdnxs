/**
 * Created by Administrator on 2015/10/10.
 */
var usermanage_list_table;
//表格渲染
$(document).ready(function(){
    usermanage_list_table= $('#usermanage_list_table').bootstrapTable({
        url:baseURL+'/usermanage/ajaxSearch'
        ,method:'post'
        ,dataType: "json"
        ,cache:false
        ,striped:true
        , pagination: true
        ,"queryParamsType": "limit"
        ,singleSelect: false
        ,contentType: "application/x-www-form-urlencoded"
        ,pageSize: 10
        ,pageNumber:1
        ,pageList:[10]
        ,search: false //不显示 搜索框
        ,showColumns: true //不显拉框（选择显示的列示下）
        ,showRefresh:true
        ,showPaginationSwitch:false
        ,smartDisplay:false
        ,maintainSelected:true
        //,detailView:true
        //,cardView:true
        ,showToggle:false
        ,idField:'ID' //
        , sidePagination: "server"// 服务端请求
        ,toolbar:'#usermanage_toolbar'
        ,queryParams:function(params){
            // console.info(params);
            $.extend(params,{
                //查询的参数
                'name':$("#name").val()  ,
                'account':$("#account").val(),
                'status':$("#status").val(),
                '_csrf':token,
                'page':(params.offset+params.limit)/params.limit //
            });
            return params;
        }
        ,responseHandler:function(rs){
            var griddata = {};
            try {
                griddata.rows = rs.rows || [];
                griddata.total = rs.total;
            }catch(e){

            }
            //console.info(griddata);
            return griddata;
        },
        //点击当前行事件
       /* onClickRow:function(row,tr){
            usermanage_list_table.currentrow = row;
        }
        ,*/columns:[
            {
                title: '全选',
                checkbox:true
            }
            , {
                title:'序号',
                formatter:function(){
                    return arguments[2]+1;
                }
            }
            ,{
                title:'登录账号'
                ,field: 'ACCOUNT'
                ,sortable:true
                ,formatter:function(value,row,index){
                    return value;
                }
            }
            ,{
                title:'管理员名称'
                ,field: 'NAME'
                ,sortable:true
                ,formatter:function(value,row,index){
                    return value;
                }
            }
            ,{
                title:'拥有角色'
                ,field: 'ROLE_NAME'
                ,sortable:true
                ,formatter:function(value,row,index){
                    return value;
                }
            }
            ,{
                title:'上一次登陆时间'
                ,field: 'LAST_TIME_LOGIN_TIME'
                ,sortable:true
                ,formatter:function(value,row,index){
                    return value;
                }
            }
            ,{
                title:'状态'
                ,field: 'STATUS'
                ,sortable:true
                ,formatter:function(value,row,index){
                    if(value==0){
                        value="禁止登陆";
                        return value;
                    }else if(value==1){
                        value="正常";
                        return value;
                    }else if(value==2){
                        value="登陆失败超3次";
                        return value;
                    }
                }
            }
            ,{
                title:'注册时间'
                ,field: 'CREATE_TIME'
                ,sortable:true
                ,formatter:function(value,row,index){
                    return value;
                }
            }

            ,{
                title:'操作',
                align:'center',
                formatter:function(value,row,index){
                var html = "";
    html += '&nbsp;&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="ausermanage_view(\'' + index + '\')"></a>';
    html += '&nbsp;&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="agents_edit(\'' + row.ID + '\',\''+index+'\')"></a>';
    html += '&nbsp;&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="agents_delete(\'' + row.ID + '\',\''+index+'\')"></a>';
    //管理员无法修改角色
    html += '&nbsp;&nbsp;<a href="javascript:void(0)"  class="" onclick="grantRole(\' ' + row.ID + ' \',\''+index+'\')">授予角色</a>';
    if ("0" == row.STATUS) {
        html += '&nbsp;&nbsp;<a href="javascript:void(0)"  class="" onclick="updateUserManageStatus(\' ' + row.ID + ' \',1 ,\'' + row.ROLE_NAME + '\',\''+index+'\')">启用</a>';
    } else {
        html += '&nbsp;&nbsp;<a href="javascript:void(0)"  class="" onclick="updateUserManageStatus(\' ' + row.ID + ' \',0,\'' + row.ROLE_NAME+ '\',\''+index+'\')">禁用</a>';
    }
                    html += '&nbsp;<a href="javascript:void(0)" class="" onclick="resetpassw(\''+row.ID+'\',\''+index+'\')">&nbsp;重置密码</a>';
                    return html;
                }
            }
        ]
    });

});



/****************对外接口：主要用于html页面调用；定义方式和调用方式为： page_moudel.functionName(参数)；其中page_moudel为挂在在window上的全局变量，每次切换面板会自动，清空 **************************/
////查询
function  usermanage_search(){
    usermanage_list_table.bootstrapTable('refresh');
}

//为用户授予角色
function grantRole(id,index){
    usermanage_list_table.bootstrapTable('uncheckAll');
    usermanage_list_table.bootstrapTable('check', index);
    usermanage_list_table.currentrow = usermanage_list_table.bootstrapTable('getSelections')[0];
	var dlg = bootbox.dialog({
         title:'选择角色'
         ,url:baseURL + "/jsp/sysextmgr/usermanage/role_tree_checkbox.jsp"
          ,size:"small"		//small
         ,closeButton: true
         ,className: "my-modal"
         ,
         buttons: {
             cancel:{
                 label:'取消'
                 , className: "btn-light-blue"
                 , callback: function() {}
             },
             success: {
                 label: "确定"
                 , className: "btn-light-blue"
                 , callback: function() { 
                	 
					//得到选中节点
					var treeObj = $.fn.zTree.getZTreeObj("tree");
					var nodes = treeObj.getCheckedNodes();
					
					if(nodes.length > 0){
						
						var ids = "";
						for(var i = 0 ; i < nodes.length ; i++){
							ids += nodes[i].ID + ",";
						}
						
						//授予权限
						$.ajax({
							type:"post",
							url:baseURL + "/usermanage/grantRoleToUser?" + _csrf + "=" + token,
							dataType:"json",
							data:{userId:usermanage_list_table.currentrow.ID,roleIds:ids},
							success:function(response){
								
	             				if(response && response.success == true) {
	             					
	             					bootbox.hideAll();										//关闭窗口
	             					$.msg.success(response.msg);
	             					usermanage_list_table.bootstrapTable('refresh');		//刷新页面
	             					
		        				} else {
		        					alert(response.msg);
		        					return false;
		        				}
	             				
							},
							error:function(e){
					             $.msg.fail("授予角色失败 ,请稍后重试！");
		                         return false;
							}
							
						});
						
					}else{
						alert("请选择一个角色！");
						return false;
					}
					
					return false;
					
                 }

              }
         }
	 
     });
			
}

//查看
function ausermanage_view(index) {
    usermanage_list_table.bootstrapTable('uncheckAll');
    usermanage_list_table.bootstrapTable('check', index);
    usermanage_list_table.currentrow = usermanage_list_table.bootstrapTable('getSelections')[0];
    var viewdialog = bootbox.dialog({
        title: '查看用户'
        , url:baseURL+"/jsp/sysextmgr/usermanage/usermanage_view.jsp"
        , closeButton: true
        , className: "permission-view-modal"//自定义宽度
        , buttons: {
            // 另一个按钮配置
            cancel: {
                label: '取消',
                className: "btn-danger",
                callback: function () {

                }
            }
        }
    });
    viewdialog.on('loaded.bs.modal', function () {
        $("#view_account").val(usermanage_list_table.currentrow.ACCOUNT);
        $("#view_name").val(usermanage_list_table.currentrow.NAME);//
        $("#view_password").val(usermanage_list_table.currentrow.PASSWORD);//
        if(usermanage_list_table.currentrow.STATUS==0){
            $("#view_status").val("禁止登陆");//
        }else if(usermanage_list_table.currentrow.STATUS==1){
            $("#view_status").val("正常");//
        }else{
            $("#view_status").val("登陆失败超3次");//
        }
        
        $("#view_role_list").val(usermanage_list_table.currentrow.ROLE_NAME);//
        $("#view_lastTimeLoginTime").val(usermanage_list_table.currentrow.LAST_TIME_LOGIN_TIME);//
        $("#view_lastTimeLoginIp").val(usermanage_list_table.currentrow.LAST_TIME_LOGIN_IP);//
        $("#view_createTime").val(usermanage_list_table.currentrow.CREATE_TIME);//
        $("#view_createByUsr").val(usermanage_list_table.currentrow.CREATE_BY_USR);//

    });
}
//重置密码
function resetpassw(id,index){
    usermanage_list_table.bootstrapTable('uncheckAll');
    usermanage_list_table.bootstrapTable('check', index);
    usermanage_list_table.currentrow = usermanage_list_table.bootstrapTable('getSelections')[0];
    var dialog= $.dialog.addoredit({
        title:'重置密码'
        ,url:baseURL+'/jsp/sysextmgr/usermanage/usermanage_resetpassw.jsp'

        ,confirmcallback:function(){

            if(!$('#usermanage_restpasswform').valid())return false;

            $('#usermanage_restpasswform').ajaxSubmit({
                dataType:'json',
                data: {'_csrf':token,"id":id},
                //data:{'dqdp_csrf_token': dqdp_csrf_token},
                success:function (response) {
                    if(response && response.success == true) {
                        $.msg.success(response.msg);
                        usermanage_list_table.bootstrapTable('refresh');
                        bootbox.hideAll();//关闭窗口
                    } else {
                        $.msg.success(response.msg);
                        return false;
                    }
                },
                error:function () {
                    $.msg.fail('重置密码，请稍后再试');
                    return false;
                }
            });
            return false;

        }

    });

}

//批量禁用
function batchStatus(){

    var ids = $('#usermanage_list_table input[name=btSelectItem]:checked').strval();

    if(!ids){
        $.msg.toast();
        return;
    }

    updateUserManageStatus(ids,0);

}

//批量启用
function batchCancelStatus(){

    var ids = $('#usermanage_list_table input[name=btSelectItem]:checked').strval();

    if(!ids){
        $.msg.toast();
        return;
    }

    updateUserManageStatus(ids,1);

}

/*
 * 修改状态
 */
function updateUserManageStatus(ids,status,rolename,index){
    //if(rolename=="代理商"){
    //    $.msg.fail('代理商"状态"请至代理商列表设置');
    //    return;
    //}else{
        usermanage_list_table.bootstrapTable('uncheckAll');
        usermanage_list_table.bootstrapTable('check', index);
        usermanage_list_table.currentrow = usermanage_list_table.bootstrapTable('getSelections')[0];
    $.ajax({
        url:baseURL + '/usermanage/updateUserStatus',
        type:"post",
        data: {'_csrf':token,"ids":ids,"status":status},
        dataType:"json",
        success:function(response){
            if(response && response.success == true) {
                $.msg.success(response.msg);
                usermanage_list_table.bootstrapTable('refresh');	//刷新页面
            } else {
                $.msg.fail(response.msg);;
            }

        },error:function(e){
            $.msg.fail(response.msg);;
        }

      });
    //}
}

function agents_add(){
   var dialog= $.dialog.addoredit({
        title:'新增用户'
        ,url:baseURL+'/jsp/sysextmgr/usermanage/usermanage_add.jsp'

        ,confirmcallback:function(){

            if(!$('#usermanage_addform').valid())return false;

            $('#usermanage_addform').ajaxSubmit({
                dataType:'json',
                data: {'_csrf':token},
                //data:{'dqdp_csrf_token': dqdp_csrf_token},
                success:function (response) {
                    if(response && response.success == true) {
                        $.msg.success(response.msg);
                        usermanage_list_table.bootstrapTable('refresh');
                        bootbox.hideAll();//关闭窗口
                    } else {
                        $.msg.success(response.msg);
                        return false;
                    }
                },
                error:function () {
                    $.msg.fail('网络异常，稍后重试');
                    return false;
                }
            });
            return false;

        }

    });
}



function agents_delete(id,index) {

    var ids = $.getPresuffStr(id) || $('#usermanage_list_table input[name=btSelectItem]:checked').strvalpresuff();
    if (!ids) {
        $.msg.toast();
        return;
    }
    $.msg.confirm(function () {
        $.post(baseURL + '/usermanage/deleteUser?' + _csrf + "=" + token, {"ids": ids}, function (rec) {
            if (rec.success) {
                $.msg.success();
                usermanage_list_table.bootstrapTable('refresh');
            } else {
                $.msg.fail(rec.desc);
            }
        }, "json").error(function () {
            $.msg.fail()
        });
    })

}

function agents_edit(id,index){
    usermanage_list_table.bootstrapTable('uncheckAll');
    usermanage_list_table.bootstrapTable('check', index);
    usermanage_list_table.currentrow = usermanage_list_table.bootstrapTable('getSelections')[0];
	var viewdialog = bootbox.dialog({
        title: '修改用户'
        , url:baseURL+"/jsp/sysextmgr/usermanage/usermanage_edit.jsp"
        , closeButton: true
        , className: "permission-view-modal"//自定义宽度
        , buttons: {
            // 另一个按钮配置
            cancel: {
                label: '取消',
                className: "btn-light-blue",
                callback: function () {

                }
            }
	
			,ok: {
		        label: '确定',
		        className: "btn-light-blue",
		        callback: function () {
			        	if(!$('#usermanage_editform').valid())return false;
	
			            $('#usermanage_editform').ajaxSubmit({
			                dataType:'json',
			                data: {'_csrf':token,'id':id},
			                //data:{'dqdp_csrf_token': dqdp_csrf_token},
			                success:function (response) {
			                    if(response && response.success == true) {
			                        $.msg.success(response.msg);
			                        usermanage_list_table.bootstrapTable('refresh');
			                        bootbox.hideAll();//关闭窗口
			                    } else {
			                        $.msg.success(response.msg);
			                        return false;
			                    }
			                },
			                error:function () {
			                    $.msg.fail('网络异常，稍后重试');
			                    return false;
			                }
			            });
			            return false;
			        }
		    }
			
			
        }
    });
    viewdialog.on('loaded.bs.modal', function () {
        $("#edit_account").val(usermanage_list_table.currentrow.ACCOUNT);
        $("#edit_name").val(usermanage_list_table.currentrow.NAME);//
        $("#edit_phone").val(usermanage_list_table.currentrow.PHONE);//
    });
}