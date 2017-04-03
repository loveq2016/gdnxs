    
var page_moudel = {};          //页面模块

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.mvoice_list_table = $('#mvoice_list_table').bootstrapTable({
                url: baseURL + "/sysextmgr/mvoice/list.mvc"
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
                , showToggle: false
                , idField: 'id'
                , sidePagination: "server" //服务端请求
                , toolbar: '#mvoice_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#mvoice_search').serializeObject());
                    return params;
                }
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
                    ,{
                        title: '序号',
                        formatter: function () {
                            return arguments[2] + 1;
                        }
                    }
                                                                                                                                                                                                                                                                                                            , {
                        title: '键名'
                        , field: 'keyName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '中文名'
                        , field: 'chinaName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '英文名'
                        , field: 'englishName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '状态'
                        , field: 'status'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '创建人'
                        , field: 'createPerson'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '创建时间'
                        , field: 'createTime'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                , {
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
                            var html = "";
                            html += '<a href="javascript:void(0)" class="glyphicon glyphicon-copy" onclick="page_moudel.copy_mvoice(\'' + row.id + '\',\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_mvoice(\'' + row.id + '\',\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_mvoice(\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_mvoice(\'' + row.id + '\')"></a>';
                            return html;
                        }

                    }
                ]
            });

        }catch(e) {
            try{
                console.info(e.stack);
            }catch(e2){
                alert(e.stack);
            }

        }
    });

    /**
     * 查询
     */
    page_moudel.mvoice_query = function () {
        page_moudel.mvoice_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };

    /**
     * 物理删除
     * @param id
     * @private
     */
    page_moudel.batchdel_mvoice = function (id) {

        var ids = $.getPresuffStr(id) || $('#mvoice_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/mvoice/delete.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.mvoice_list_table.bootstrapTable('refresh');
                } else {
                    $.msg.fail(rec.desc);
                }
            }, "json").error(function () {
                $.msg.fail()
            });
        })

    };

    /**
     * 逻辑删除
     * @param id
     * @private
     */
    page_moudel.batchlogicdel_mvoice = function (id) {

        var ids =  $.getPresuffStr(id) || $('#mvoice_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/mvoice/deleteLogicByIds.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.mvoice_list_table.bootstrapTable('refresh');
                } else {
                    $.msg.fail(rec.desc);
                }
            }, "json").error(function () {
                $.msg.fail()
            });
        })

    };

    /**
     * 查看详情
     * @param index
     * @private
     */
    page_moudel.view_mvoice = function (index) {

        page_moudel.mvoice_list_table.bootstrapTable('uncheckAll');
        page_moudel.mvoice_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.mvoice_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            title: '查看代码生成器',
            url: baseURL + "/jsp/sysextmgr/mvoice/mvoice_detail.jsp?"+_csrf+"=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
            //数据源：currentrow
                        $('#view_mvoice_id').html(currentrow.id);
                        $('#view_mvoice_keyName').html(currentrow.keyName);
                        $('#view_mvoice_chinaName').html(currentrow.chinaName);
                        $('#view_mvoice_englishName').html(currentrow.englishName);
                        $('#view_mvoice_status').html(currentrow.status);
                        $('#view_mvoice_createPerson').html(currentrow.createPerson);
                        $('#view_mvoice_createTime').html(currentrow.createTime);
                        },
            //关闭事件
            closecallback: function () {
            }
        });

    };

    /**
     * 新增
     * @private
     */
    page_moudel.add_mvoice = function () {

        var dialog = $.dialog.addoredit({
            title: '添加代码生成器',
            url: baseURL + "/jsp/sysextmgr/mvoice/mvoice_add.jsp?"+_csrf+"=" + token,
            confirmcallback: function () {

                if (!$('#mvoice_addform').valid()){
                    return false;
                }

                //提交数据
                $('#mvoice_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ( result.code == "1") {
                            $.msg.success('新增代码生成器成功');
                            page_moudel.mvoice_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        $.msg.fail('新增代码生成器失败，可能是由网络原因引起的，请稍候再试');
                        return false;
                    }
                });

                return false;
            }
        });

    };

    /**
     * 编辑
     * @param id
     * @param index
     * @private
     */
    page_moudel.edit_mvoice = function (id, index) {

        page_moudel.mvoice_list_table.bootstrapTable('uncheckAll');
        page_moudel.mvoice_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.mvoice_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "修改代码生成器" ,
            url: baseURL + "/jsp/sysextmgr/mvoice/mvoice_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                        $('#edit_mvoice_id').val(currentrow.id);
                        $('#edit_mvoice_keyName').val(currentrow.keyName);
                        $('#edit_mvoice_chinaName').val(currentrow.chinaName);
                        $('#edit_mvoice_englishName').val(currentrow.englishName);
                        $('#edit_mvoice_status').val(currentrow.status);
                        $('#edit_mvoice_createPerson').val(currentrow.createPerson);
                        $('#edit_mvoice_createTime').val(currentrow.createTime);
                        }
            //修改事件
            , confirmcallback: function () {

                if (!$('#mvoice_editform').valid()){
                    return false;
                }

                $('#mvoice_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('修改代码生成器成功');
                            page_moudel.mvoice_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('修改代码生成器失败，可能是由网络原因引起的，请稍候再试');
                        return false;
                    }

                });

                return false;

            }
        })
    };
    /**
     * 复制
     * @param id
     * @param index
     * @private
     */
    page_moudel.copy_mvoice = function (id, index) {

        page_moudel.mvoice_list_table.bootstrapTable('uncheckAll');
        page_moudel.mvoice_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.mvoice_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "复制代码生成器" ,
            url: baseURL + "/jsp/sysextmgr/mvoice/mvoice_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                                    $('#edit_mvoice_id').val(currentrow.id);
                                    $('#edit_mvoice_keyName').val(currentrow.keyName);
                                    $('#edit_mvoice_chinaName').val(currentrow.chinaName);
                                    $('#edit_mvoice_englishName').val(currentrow.englishName);
                                    $('#edit_mvoice_status').val(currentrow.status);
                                    $('#edit_mvoice_createPerson').val(currentrow.createPerson);
                                    $('#edit_mvoice_createTime').val(currentrow.createTime);
                            }
            //修改事件
            , confirmcallback: function () {

                if (!$('#mvoice_editform').valid()){
                    return false;
                }

                $('#mvoice_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('复制代码生成器成功');
                            page_moudel.mvoice_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('复制代码生成器失败，请稍候再试');
                        return false;
                    }

                });

                return false;

            }
        })
    };
})()