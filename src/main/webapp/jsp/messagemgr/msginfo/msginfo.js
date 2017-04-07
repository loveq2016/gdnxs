    
var page_moudel = {};          //页面模块

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.msginfo_list_table = $('#msginfo_list_table').bootstrapTable({
                url: baseURL + "/messagemgr/msginfo/list.mvc"
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
                , idField: 'ID'
                , sidePagination: "server" //服务端请求
                , toolbar: '#msginfo_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#msginfo_search').serializeObject());
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
                        title: '消息标题'
                        , field: 'title'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '消息接受者'
                        , field: 'name'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '接受者手机'
                        , field: 'concatPhone'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '消息明细'
                        , field: 'msgdesc'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '创建时间'
                        , field: 'createdate'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
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
    page_moudel.msginfo_query = function () {
        page_moudel.msginfo_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };

    /**
     * 物理删除
     * @param id
     * @private
     */
    page_moudel.batchdel_msginfo = function (id) {

        var ids = $.getPresuffStr(id) || $('#msginfo_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/messagemgr/msginfo/delete.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.msginfo_list_table.bootstrapTable('refresh');
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
    page_moudel.batchlogicdel_msginfo = function (id) {

        var ids =  $.getPresuffStr(id) || $('#msginfo_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/messagemgr/msginfo/deleteLogicByIds.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.msginfo_list_table.bootstrapTable('refresh');
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
    page_moudel.view_msginfo = function (index) {

        page_moudel.msginfo_list_table.bootstrapTable('uncheckAll');
        page_moudel.msginfo_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.msginfo_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            title: '查看消息管理',
            url: baseURL + "/jsp/messagemgr/msginfo/msginfo_detail.jsp?"+_csrf+"=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
            //数据源：currentrow
                        $('#view_msginfo_id').html(currentrow.id);
                        $('#view_msginfo_title').html(currentrow.title);
                        $('#view_msginfo_msgdesc').html(currentrow.msgdesc);
                        $('#view_msginfo_creatorid').html(currentrow.creatorid);
                        $('#view_msginfo_createdate').html(currentrow.createdate);
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
    page_moudel.add_msginfo = function () {

        var dialog = $.dialog.addoredit({
            title: '添加消息管理',
            url: baseURL + "/jsp/messagemgr/msginfo/msginfo_add.jsp?"+_csrf+"=" + token,
            confirmcallback: function () {

                if (!$('#msginfo_addform').valid()){
                    return false;
                }

                //提交数据
                $('#msginfo_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ( result.code == "1") {
                            $.msg.success('新增消息管理成功');
                            page_moudel.msginfo_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        $.msg.fail('新增消息管理失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.edit_msginfo = function (id, index) {

        page_moudel.msginfo_list_table.bootstrapTable('uncheckAll');
        page_moudel.msginfo_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.msginfo_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "修改消息管理" ,
            url: baseURL + "/jsp/messagemgr/msginfo/msginfo_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                        $('#edit_msginfo_id').val(currentrow.id);
                        $('#edit_msginfo_title').val(currentrow.title);
                        $('#edit_msginfo_msgdesc').val(currentrow.msgdesc);
                        $('#edit_msginfo_creatorid').val(currentrow.creatorid);
                        $('#edit_msginfo_createdate').val(currentrow.createdate);
                        }
            //修改事件
            , confirmcallback: function () {

                if (!$('#msginfo_editform').valid()){
                    return false;
                }

                $('#msginfo_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('修改消息管理成功');
                            page_moudel.msginfo_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('修改消息管理失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.copy_msginfo = function (id, index) {

        page_moudel.msginfo_list_table.bootstrapTable('uncheckAll');
        page_moudel.msginfo_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.msginfo_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "复制消息管理" ,
            url: baseURL + "/jsp/messagemgr/msginfo/msginfo_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                                    $('#edit_msginfo_id').val(currentrow.id);
                                    $('#edit_msginfo_title').val(currentrow.title);
                                    $('#edit_msginfo_msgdesc').val(currentrow.msgdesc);
                                    $('#edit_msginfo_creatorid').val(currentrow.creatorid);
                                    $('#edit_msginfo_createdate').val(currentrow.createdate);
                            }
            //修改事件
            , confirmcallback: function () {

                if (!$('#msginfo_editform').valid()){
                    return false;
                }

                $('#msginfo_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('复制消息管理成功');
                            page_moudel.msginfo_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('复制消息管理失败，请稍候再试');
                        return false;
                    }

                });

                return false;

            }
        })
    };
})()