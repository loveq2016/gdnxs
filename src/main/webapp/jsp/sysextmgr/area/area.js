    
var page_moudel = {};          //页面模块

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.area_list_table = $('#area_list_table').bootstrapTable({
                url: baseURL + "/sysextmgr/area/list.mvc"
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
                , toolbar: '#area_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#area_search').serializeObject());
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
                        title: 'id'
                        , field: 'id'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: ''
                        , field: 'city'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: ''
                        , field: 'areatext'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: ''
                        , field: 'createdate'
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
                            html += '<a href="javascript:void(0)" class="glyphicon glyphicon-copy" onclick="page_moudel.copy_area(\'' + row.ID + '\',\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_area(\'' + row.ID + '\',\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_area(\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_area(\'' + row.ID + '\')"></a>';
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
    page_moudel.area_query = function () {
        page_moudel.area_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };

    /**
     * 物理删除
     * @param id
     * @private
     */
    page_moudel.batchdel_area = function (id) {

        var ids = $.getPresuffStr(id) || $('#area_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/area/delete.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.area_list_table.bootstrapTable('refresh');
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
    page_moudel.batchlogicdel_area = function (id) {

        var ids =  $.getPresuffStr(id) || $('#area_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/area/deleteLogicByIds.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.area_list_table.bootstrapTable('refresh');
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
    page_moudel.view_area = function (index) {

        page_moudel.area_list_table.bootstrapTable('uncheckAll');
        page_moudel.area_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.area_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            title: '查看区域管理',
            url: baseURL + "/jsp/sysextmgr/area/area_detail.jsp?"+_csrf+"=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
            //数据源：currentrow
                        $('#view_area_id').html(currentrow.id);
                        $('#view_area_city').html(currentrow.city);
                        $('#view_area_areatext').html(currentrow.areatext);
                        $('#view_area_createdate').html(currentrow.createdate);
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
    page_moudel.add_area = function () {

        var dialog = $.dialog.addoredit({
            title: '添加区域管理',
            url: baseURL + "/jsp/sysextmgr/area/area_add.jsp?"+_csrf+"=" + token,
            confirmcallback: function () {

                if (!$('#area_addform').valid()){
                    return false;
                }

                //提交数据
                $('#area_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ( result.code == "1") {
                            $.msg.success('新增区域管理成功');
                            page_moudel.area_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        $.msg.fail('新增区域管理失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.edit_area = function (id, index) {

        page_moudel.area_list_table.bootstrapTable('uncheckAll');
        page_moudel.area_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.area_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "修改区域管理" ,
            url: baseURL + "/jsp/sysextmgr/area/area_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                        $('#edit_area_id').val(currentrow.id);
                        $('#edit_area_city').val(currentrow.city);
                        $('#edit_area_areatext').val(currentrow.areatext);
                        $('#edit_area_createdate').val(currentrow.createdate);
                        }
            //修改事件
            , confirmcallback: function () {

                if (!$('#area_editform').valid()){
                    return false;
                }

                $('#area_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('修改区域管理成功');
                            page_moudel.area_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('修改区域管理失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.copy_area = function (id, index) {

        page_moudel.area_list_table.bootstrapTable('uncheckAll');
        page_moudel.area_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.area_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "复制区域管理" ,
            url: baseURL + "/jsp/sysextmgr/area/area_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                                    $('#edit_area_id').val(currentrow.id);
                                    $('#edit_area_city').val(currentrow.city);
                                    $('#edit_area_areatext').val(currentrow.areatext);
                                    $('#edit_area_createdate').val(currentrow.createdate);
                            }
            //修改事件
            , confirmcallback: function () {

                if (!$('#area_editform').valid()){
                    return false;
                }

                $('#area_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('复制区域管理成功');
                            page_moudel.area_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('复制区域管理失败，请稍候再试');
                        return false;
                    }

                });

                return false;

            }
        })
    };
})()