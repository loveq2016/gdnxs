var page_moudel = {};
(function () {
//函数内局部变量
    var currentrow;
//表格渲染
    $(document).ready(function () {
        try {
            $('#operationlog_beginTime').datetimepicker();
            $('#operationlog_endTime').datetimepicker();

            page_moudel.operationlog_list_table = $('#operationlog_list_table').bootstrapTable({
                url: baseURL + "/sysextmgr/operationlog/list.mvc"
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
                , toolbar: '#operationlog_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#operationlog_search').serializeObject());
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
                    /*, {
                        title: '操作用户ID'
                        , field: 'authorId'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }*/
                    , {
                        title: '操作用户'
                        , field: 'author'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: 'IP地址'
                        , field: 'ip'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '操作模块'
                        , field: 'model'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '操作动作'
                        , field: 'operation'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                  /*  , {
                        title: '详细说明'
                        , field: 'description'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }*/
                    , {
                        title: '操作时间'
                        , field: 'createTime'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '操作结果'
                        , field: 'status'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return main_global.render.dictFormat("operationResult",value);
                        }
                    }
                    , {
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
//console.info(arguments);
                            var html = "";
                            //html += '<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_operationlog(\'' + row.id + '\',\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_operationlog(\'' + index + '\')"></a>';
                            //html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_operationlog(\'' + row.id + '\')"></a>';
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
    page_moudel.operationlog_query = function () {
        page_moudel.operationlog_list_table.bootstrapTable('refresh');
    }
    //物理删除
    page_moudel.batchdel_operationlog = function (id) {
        var ids = $.getPresuffStr(id) || $('#operationlog_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }
        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/operationlog/delete.mvc?' + _csrf + "=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.operationlog_list_table.bootstrapTable('refresh');
                } else {
                    $.msg.fail(rec.desc);
                }
            }, "json").error(function () {
                $.msg.fail()
            });
        })
    }
    //逻辑删除
    page_moudel.batchlogicdel_operationlog = function (id) {
        var ids = $.getPresuffStr(id) || $('#operationlog_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }
        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/operationlog/deleteLogicByIds.mvc?' + _csrf + "=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.operationlog_list_table.bootstrapTable('refresh');
                } else {
                    $.msg.fail(rec.desc);
                }
            }, "json").error(function () {
                $.msg.fail()
            });
        })
    }

    //查看
    page_moudel.view_operationlog = function (index) {
        page_moudel.operationlog_list_table.bootstrapTable('uncheckAll');
        page_moudel.operationlog_list_table.bootstrapTable('check', index);
        currentrow = page_moudel.operationlog_list_table.bootstrapTable('getSelections')[0];
        var dialog = $.dialog.view({
            title: '查看日志',
            url: baseURL + "/jsp/sysextmgr/operationlog/operationlog_detail.jsp?" + _csrf + "=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
                //数据源：currentrow
                //$('#view_operationlog_id').html(currentrow.id);
                $('#view_operationlog_authorId').html(currentrow.authorId);
                $('#view_operationlog_author').html(currentrow.author);
                $('#view_operationlog_ip').html(currentrow.ip);
                $('#view_operationlog_model').html(currentrow.model);
                $('#view_operationlog_operation').html(currentrow.operation);
                $('#view_operationlog_description').html(currentrow.description);
                $('#view_operationlog_createTime').html(currentrow.createTime);
                $('#view_operationlog_status').html(main_global.render.dictFormat("operationResult",currentrow.status));
            },
            //关闭事件
            closecallback: function () {
            }
        });
    }

    //新增
    page_moudel.add_operationlog = function () {
        var dialog = $.dialog.addoredit({
            title: '添加日志',
            url: baseURL + "/jsp/sysextmgr/operationlog/operationlog_add.jsp?" + _csrf + "=" + token,
            //新增事件
            confirmcallback: function () {
                if (!$('#operationlog_addform').valid())return false;
                // 提交数据
                $('#operationlog_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {
                        if (result.code == "1") {
                            $.msg.success('新增日志成功');
                            page_moudel.operationlog_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }
                    },
                    error: function () {
                        $.msg.fail('新增日志失败，可能是由网络原因引起的，请稍候再试');
                        return false;
                    }
                });
                return false;
            }

        });
    }
    //编辑
    page_moudel.edit_operationlog = function (id, index) {
        page_moudel.operationlog_list_table.bootstrapTable('uncheckAll');
        page_moudel.operationlog_list_table.bootstrapTable('check', index);
        currentrow = page_moudel.operationlog_list_table.bootstrapTable('getSelections')[0];
        $.dialog.addoredit(
            {
                title: "修改日志"
                ,
                url: baseURL + "/jsp/sysextmgr/operationlog/operationlog_edit.jsp?" + _csrf + "=" + token,
                //,className:"my-modal"
                //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
                afterloaded: function () {
                    //数据源：currentrow
                    $('#edit_operationlog_id').val(currentrow.id);
                    $('#edit_operationlog_authorId').val(currentrow.authorId);
                    $('#edit_operationlog_author').val(currentrow.author);
                    $('#edit_operationlog_ip').val(currentrow.ip);
                    $('#edit_operationlog_model').val(currentrow.model);
                    $('#edit_operationlog_operation').val(currentrow.operation);
                    $('#edit_operationlog_description').val(currentrow.description);
                    $('#edit_operationlog_createTime').val(currentrow.createTime);
                    $('#edit_operationlog_status').val(currentrow.status);
                }
                //修改事件
                ,
                confirmcallback: function () {
                    if (!$('#operationlog_editform').valid())return false;
                    $('#operationlog_editform').ajaxSubmit({
                        dataType: 'json',
                        success: function (result) {
                            if ("1" == result.code) {
                                $.msg.success('修改日志成功');
                                page_moudel.operationlog_list_table.bootstrapTable('refresh');
                                $(".modal-footer .btn-danger").trigger("click");
                            } else {
                                $.msg.fail(result.desc);
                                return false;
                            }
                        },
                        error: function () {
                            window.parent.msg_alert('修改日志失败，可能是由网络原因引起的，请稍候再试');
                            return false;
                        }
                    });
                    return false;
                }
            })
    }
//生成结束,下方自定函数,请放在page_moudel对象中
})()