var page_moudel = {};
(function () {
//函数内局部变量
    var currentrow;
//表格渲染
    $(document).ready(function () {
        try {

            page_moudel.menu_list_table = $('#menu_list_table').bootstrapTable({
                url: baseURL + "/sysextmgr/menu/list.mvc"
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
                , toolbar: '#menu_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#menu_search').serializeObject());
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
                        title: '菜单名称'
                        , field: 'menuName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '菜单类型'
                        , field: 'menuType'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return main_global.render.dictFormat("menuType",value);
                        }
                    }
                    , {
                        title: '菜单地址'
                        , field: 'menuLink'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    /*, {
                        title: '打开位置'
                        , field: 'menuTarget'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }*/
                    , {
                        title: '菜单权限'
                        , field: 'menuPermission'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '显示顺序'
                        , field: 'orderNum'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '上级菜单名称'
                        , field: 'parentMenuName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '备注'
                        , field: 'desc'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }

                    , {
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
//console.info(arguments);
                            var html = "";
                            html += '<a href="javascript:void(0)" class="glyphicon glyphicon-copy" onclick="page_moudel.copy_menu(\'' + row.id + '\',\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_menu(\'' + row.id + '\',\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_menu(\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_menu(\'' + row.id + '\')"></a>';
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
    page_moudel.menu_query = function () {
        page_moudel.menu_list_table.bootstrapTable('refresh');
    }
    //物理删除
    page_moudel.batchdel_menu = function (id) {
        var ids = $.getPresuffStr(id) || $('#menu_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }
        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/menu/delete.mvc?' + _csrf + "=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.menu_list_table.bootstrapTable('refresh');
                } else {
                    $.msg.fail(rec.desc);
                }
            }, "json").error(function () {
                $.msg.fail()
            });
        })
    }
    //逻辑删除
    page_moudel.batchlogicdel_menu = function (id) {
        var ids = $.getPresuffStr(id) || $('#menu_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }
        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/menu/deleteLogicByIds.mvc?' + _csrf + "=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.menu_list_table.bootstrapTable('refresh');
                } else {
                    $.msg.fail(rec.desc);
                }
            }, "json").error(function () {
                $.msg.fail()
            });
        })
    }

    //查看
    page_moudel.view_menu = function (index) {
        page_moudel.menu_list_table.bootstrapTable('uncheckAll');
        page_moudel.menu_list_table.bootstrapTable('check', index);
        currentrow = page_moudel.menu_list_table.bootstrapTable('getSelections')[0];
        var dialog = $.dialog.view({
            title: '查看菜单',
            url: baseURL + "/jsp/sysextmgr/menu/menu_detail.jsp?" + _csrf + "=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
                //数据源：currentrow
                $('#view_menu_id').html(currentrow.id);
                $('#view_menu_menuName').html(currentrow.menuName);
                $('#view_menu_menuType').html(main_global.render.dictFormat("menuType",currentrow.menuType));
                $('#view_menu_menuLink').html(currentrow.menuLink);
                $('#view_menu_menuTarget').html(currentrow.menuTarget);
                $('#view_menu_menuPermission').html(currentrow.menuPermission);
                $('#view_menu_parentMenuName').html(currentrow.parentMenuName);
            },
            //关闭事件
            closecallback: function () {
            }
        });
    }

    //新增
    page_moudel.add_menu = function () {
        var dialog = $.dialog.addoredit({
            title: '添加菜单',
            url: baseURL + "/jsp/sysextmgr/menu/menu_add.jsp?" + _csrf + "=" + token,
            //新增事件
            confirmcallback: function () {
               console.info(arguments)
                if (!$('#menu_addform').valid())return false;
                if($('#add_menu_orderNum').val()==''){
                	$('#add_menu_orderNum').val(9);
                }
                // 提交数据
                $('#menu_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {
                        if (result.code == "1") {
                            $.msg.success('新增菜单成功');
                            page_moudel.menu_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }
                    },
                    error: function () {
                        $.msg.fail('新增菜单失败，可能是由网络原因引起的，请稍候再试');
                        return false;
                    }
                });
                return false;
            }

        });
    }
    //编辑
    page_moudel.edit_menu = function (id, index) {
        page_moudel.menu_list_table.bootstrapTable('uncheckAll');
        page_moudel.menu_list_table.bootstrapTable('check', index);
        currentrow = page_moudel.menu_list_table.bootstrapTable('getSelections')[0];
        $.dialog.addoredit(
            {
                title: "修改菜单"
                ,
                url: baseURL + "/jsp/sysextmgr/menu/menu_edit.jsp?" + _csrf + "=" + token,
                //,className:"my-modal"
                //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
                afterloaded: function () {
                    //数据源：currentrow
                    $('#edit_menu_id').val(currentrow.id);
                    $('#edit_menu_menuName').val(currentrow.menuName);
                    $('#edit_menu_menuType').val(currentrow.menuType);
                    $('#edit_menu_menuLink').val(currentrow.menuLink);
                    $('#edit_menu_menuTarget').val(currentrow.menuTarget);
                    $('#edit_menu_menuPermission').val(currentrow.menuPermission);
                    $('#edit_menu_parentMenuName').val(currentrow.parentId);
                    $('#edit_menu_parentId').val(currentrow.parentId);
                    $('#edit_menu_orderNum').val(currentrow.orderNum);
                    $('#edit_menu_desc').val(currentrow.desc);
                }
                //修改事件
                ,
                confirmcallback: function () {
                    if (!$('#menu_editform').valid())return false;
                    $('#menu_editform').ajaxSubmit({
                        dataType: 'json',
                        success: function (result) {
                            if ("1" == result.code) {
                                $.msg.success('修改菜单成功');
                                page_moudel.menu_list_table.bootstrapTable('refresh');
                                $(".modal-footer .btn-danger").trigger("click");
                            } else {
                                $.msg.fail(result.desc);
                                return false;
                            }
                        },
                        error: function () {
                            window.parent.msg_alert('修改菜单失败，可能是由网络原因引起的，请稍候再试');
                            return false;
                        }
                    });
                    return false;
                }
            })
    }
    //编辑
    page_moudel.copy_menu = function (id, index) {
        page_moudel.menu_list_table.bootstrapTable('uncheckAll');
        page_moudel.menu_list_table.bootstrapTable('check', index);
        currentrow = page_moudel.menu_list_table.bootstrapTable('getSelections')[0];
        $.dialog.addoredit(
            {
                title: "复制菜单"
                ,
                url: baseURL + "/jsp/sysextmgr/menu/menu_edit.jsp?" + _csrf + "=" + token,
                //,className:"my-modal"
                //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
                afterloaded: function () {
                    //数据源：currentrow
                    //$('#edit_menu_id').val(currentrow.id);
                    $('#edit_menu_menuName').val(currentrow.menuName);
                    $('#edit_menu_menuType').val(currentrow.menuType);
                    $('#edit_menu_menuLink').val(currentrow.menuLink);
                    $('#edit_menu_menuTarget').val(currentrow.menuTarget);
                    $('#edit_menu_menuPermission').val(currentrow.menuPermission);
                    $('#edit_menu_parentMenuName').val(currentrow.parentId);
                    $('#edit_menu_parentId').val(currentrow.parentId);
                    $('#edit_menu_orderNum').val(currentrow.orderNum);
                    $('#edit_menu_desc').val(currentrow.desc);
                }
                //修改事件
                ,
                confirmcallback: function () {
                    if (!$('#menu_editform').valid())return false;
                    $('#menu_editform').ajaxSubmit({
                        dataType: 'json',
                        success: function (result) {
                            if ("1" == result.code) {
                                $.msg.success('复制菜单成功');
                                page_moudel.menu_list_table.bootstrapTable('refresh');
                                $(".modal-footer .btn-danger").trigger("click");
                            } else {
                                $.msg.fail(result.desc);
                                return false;
                            }
                        },
                        error: function () {
                            $.msg.fail('复制菜单失败，请稍候再试');
                            return false;
                        }
                    });
                    return false;
                }
            })
    }
//生成结束,下方自定函数,请放在page_moudel对象中
})()