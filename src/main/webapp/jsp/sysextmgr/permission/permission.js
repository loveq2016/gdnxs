var page_moudel = {};
(function () {
//函数内局部变量
    var currentrow;
//表格渲染
    $(document).ready(function () {
        try {

            page_moudel.permission_list_table = $('#permission_list_table').bootstrapTable({
                url: baseURL + "/sysextmgr/permission/list.mvc"
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
                , search: false //不显示 搜索框
                , showColumns: true //显示拉框（选择显示的列示下）
                , showRefresh: true
                , showPaginationSwitch: false
                , smartDisplay: true
                //,detailView:true
                //,cardView:true
                , showToggle: false
                , idField: 'id'
                , sidePagination: "server" //服务端请求
                , toolbar: '#permission_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#permission_search').serializeObject());
                    return params;
                }/**,
                 onClickRow:function(row,tr){
                currentrow = row;
                }**/
                , responseHandler: function (rs) {
                    if (rs.code == "1") {
                        return rs.data;
                    } else {
                        $.msg.fail(rs.desc);
                        return {total: 0, rows: []};
                    }
                }
                , columns: [
                    {
                        title: '全选',
                        checkbox: true
                    }
                    , {
                        title: '序号',
                        formatter: function () {
                            return arguments[2] + 1;
                        }
                    }
                   /* , {
                        title: 'id'
                        , field: 'id'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }*/
                    , {
                        title: '权限代码'
                        , field: 'permissionCode'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '权限名称'
                        , field: 'name'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '模块名称'
                        , field: 'moduelName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '模块代码'
                        , field: 'moduelCode'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    /*, {
                        title: '权限类型'
                        , field: 'permissionType'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }*/
                    , {
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
//console.info(arguments);
                            var html = "";
                            html += '<a href="javascript:void(0)" class="glyphicon glyphicon-copy" onclick="page_moudel.copy_permission(\'' + row.id + '\',\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_permission(\'' + row.id + '\',\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_permission(\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_permission(\'' + row.id + '\')"></a>';
                            return html;
                        }

                    }
                ]
            });

        } catch (e) {
            try {
                console.info(e.stack);
            } catch (e2) {
                alert(e.stack);
            }

        }
    });


    /****************对外接口：主要用于html页面调用；定义方式和调用方式为： page_moudel.functionName(参数)；其中page_moudel为挂在在window上的全局变量，每次切换面板会自动，清空 **************************/
        //查询
    page_moudel.permission_query = function () {
        page_moudel.permission_list_table.bootstrapTable('refresh');
    }
    //物理删除
    page_moudel.batchdel_permission = function (id) {
        var ids = $.getPresuffStr(id) || $('#permission_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }
        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/permission/delete.mvc?' + _csrf + "=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.permission_list_table.bootstrapTable('refresh');
                } else {
                    $.msg.fail(rec.desc);
                }
            }, "json").error(function () {
                $.msg.fail()
            });
        })
    }
    //逻辑删除
    page_moudel.batchlogicdel_permission = function (id) {
        var ids = $.getPresuffStr(id) || $('#permission_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }
        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/permission/deleteLogicByIds.mvc?' + _csrf + "=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.permission_list_table.bootstrapTable('refresh');
                } else {
                    $.msg.fail(rec.desc);
                }
            }, "json").error(function () {
                $.msg.fail()
            });
        })
    }

    //查看
    page_moudel.view_permission = function (index) {
        page_moudel.permission_list_table.bootstrapTable('uncheckAll');
        page_moudel.permission_list_table.bootstrapTable('check', index);
        currentrow = page_moudel.permission_list_table.bootstrapTable('getSelections')[0];
        var dialog = $.dialog.view({
            title: '查看权限',
            url: baseURL + "/jsp/sysextmgr/permission/permission_detail.jsp?" + _csrf + "=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
                //数据源：currentrow
                $('#view_permission_id').html(currentrow.id);
                $('#view_permission_permissionCode').html(currentrow.permissionCode);
                $('#view_permission_name').html(currentrow.name);
                $('#view_permission_moduelName').html(currentrow.moduelName);
                $('#view_permission_moduelCode').html(currentrow.moduelCode);
                $('#view_permission_permissionType').html(currentrow.permissionType);
            },
            //关闭事件
            closecallback: function () {
            }
        });
    }

    //新增
    page_moudel.add_permission = function () {
        var dialog = $.dialog.addoredit({
            title: '添加权限',
            url: baseURL + "/jsp/sysextmgr/permission/permission_add.jsp?" + _csrf + "=" + token,
            //新增事件
            confirmcallback: function () {
                if (!$('#permission_addform').valid())return false;
                // 提交数据
                $('#permission_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {
                        if (result.code == "1") {
                            $.msg.success('新增权限成功');
                            page_moudel.permission_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }
                    },
                    error: function () {
                        $.msg.fail('新增权限失败，可能是由网络原因引起的，请稍候再试');
                        return false;
                    }
                });
                return false;
            }

        });
    }
    //编辑
    page_moudel.edit_permission = function (id, index) {
        page_moudel.permission_list_table.bootstrapTable('uncheckAll');
        page_moudel.permission_list_table.bootstrapTable('check', index);
        currentrow = page_moudel.permission_list_table.bootstrapTable('getSelections')[0];
        $.dialog.addoredit(
            {
                title: "修改权限"
                ,
                url: baseURL + "/jsp/sysextmgr/permission/permission_edit.jsp?" + _csrf + "=" + token,
                //,className:"my-modal"
                //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
                afterloaded: function () {
                    //数据源：currentrow
                    $('#edit_permission_id').val(currentrow.id);
                    $('#edit_permission_permissionCode').val(currentrow.permissionCode);
                    $('#edit_permission_name').val(currentrow.name);
                    $('#edit_permission_moduelName').val(currentrow.moduelName);
                    $('#edit_permission_moduelCode').val(currentrow.moduelCode);
                    $('#edit_permission_permissionType').val(currentrow.permissionType);
                }
                //修改事件
                ,
                confirmcallback: function () {
                    if (!$('#permission_editform').valid())return false;
                    $('#permission_editform').ajaxSubmit({
                        dataType: 'json',
                        success: function (result) {
                            if ("1" == result.code) {
                                $.msg.success('修改权限成功');
                                page_moudel.permission_list_table.bootstrapTable('refresh');
                                $(".modal-footer .btn-danger").trigger("click");
                            } else {
                                $.msg.fail(result.desc);
                                return false;
                            }
                        },
                        error: function () {
                            window.parent.msg_alert('修改权限失败，请稍候再试');
                            return false;
                        }
                    });
                    return false;
                }
            })
    }


//生成结束,下方自定函数,请放在page_moudel对象中
    //编辑
    page_moudel.copy_permission = function (id, index) {
        page_moudel.permission_list_table.bootstrapTable('uncheckAll');
        page_moudel.permission_list_table.bootstrapTable('check', index);
        currentrow = page_moudel.permission_list_table.bootstrapTable('getSelections')[0];
        $.dialog.addoredit(
            {
                title: "修改权限"
                ,
                url: baseURL + "/jsp/sysextmgr/permission/permission_edit.jsp?" + _csrf + "=" + token,
                //,className:"my-modal"
                //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
                afterloaded: function () {
                    //数据源：currentrow
                    //$('#edit_permission_id').val(currentrow.id);
                    $('#edit_permission_permissionCode').val(currentrow.permissionCode);
                    $('#edit_permission_name').val(currentrow.name);
                    $('#edit_permission_moduelName').val(currentrow.moduelName);
                    $('#edit_permission_moduelCode').val(currentrow.moduelCode);
                    $('#edit_permission_permissionType').val(currentrow.permissionType);
                }
                //修改事件
                ,
                confirmcallback: function () {
                    if (!$('#permission_editform').valid())return false;
                    $('#permission_editform').ajaxSubmit({
                        dataType: 'json',
                        success: function (result) {
                            if ("1" == result.code) {
                                $.msg.success('修改权限成功');
                                page_moudel.permission_list_table.bootstrapTable('refresh');
                                $(".modal-footer .btn-danger").trigger("click");
                            } else {
                                $.msg.fail(result.desc);
                                return false;
                            }
                        },
                        error: function () {
                            $.msg.fail('修改权限失败，请稍候再试');
                            return false;
                        }
                    });
                    return false;
                }
            })
    }
})()