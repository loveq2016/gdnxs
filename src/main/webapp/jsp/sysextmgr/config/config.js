    
var page_moudel = {};          //页面模块

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.config_list_table = $('#config_list_table').bootstrapTable({
                url: baseURL + "/sysextmgr/config/list.mvc"
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
                , idField: 'configKey'
                , sidePagination: "server" //服务端请求
                , toolbar: '#config_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#config_search').serializeObject());
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
                    , {
                        title: '序号',
                        formatter: function () {
                            return arguments[2] + 1;
                        }
                    }
                    , {
                        title: '配置键'
                        , field: 'configKey'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '配置值'
                        , field: 'configValue'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '描述'
                        , field: 'description'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
                            console.info(row);
                            var html = "";
                            html += '<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_config(\'' + row.CONFIG_KEY + '\',\'' + index + '\')"></a>';
                            // html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_config(\'' + index + '\')"></a>';
                            // html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_config(\'' + row.CONFIG_KEY + '\')"></a>';
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
    page_moudel.config_query = function () {
        page_moudel.config_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };

    /**
     * 物理删除
     * @param id
     * @private
     */
    page_moudel.batchdel_config = function (id) {

        var ids = $.getPresuffStr(id) || $('#config_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/config/delete.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.config_list_table.bootstrapTable('refresh');
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
    page_moudel.batchlogicdel_config = function (id) {

        var ids =  $.getPresuffStr(id) || $('#config_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/config/deleteLogicByIds.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.config_list_table.bootstrapTable('refresh');
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
    page_moudel.view_config = function (index) {

        page_moudel.config_list_table.bootstrapTable('uncheckAll');
        page_moudel.config_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.config_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            title: '查看配置',
            url: baseURL + "/jsp/sysextmgr/config/config_detail.jsp?"+_csrf+"=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
            //数据源：currentrow
                        $('#view_config_configKey').html(currentrow.configKey);
                        $('#view_config_configValue').html(currentrow.configValue);
                        $('#view_config_description').html(currentrow.description);
                        $('#view_config_readOnly').html(currentrow.readOnly);
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
    page_moudel.add_config = function () {

        var dialog = $.dialog.addoredit({
            title: '添加配置',
            url: baseURL + "/jsp/sysextmgr/config/config_add.jsp?"+_csrf+"=" + token,
            confirmcallback: function () {

                if (!$('#config_addform').valid()){
                    return false;
                }

                //提交数据
                $('#config_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ( result.code == "1") {
                            $.msg.success('新增配置成功');
                            page_moudel.config_list_table.bootstrapTable('refresh');
                            $(".modal-footer button[data-bb-handler='cancel']").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        $.msg.fail('新增配置失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.edit_config = function (id, index) {

        page_moudel.config_list_table.bootstrapTable('uncheckAll');
        page_moudel.config_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.config_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "修改配置" ,
            url: baseURL + "/jsp/sysextmgr/config/config_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                        $('#edit_config_configKey').val(currentrow.configKey);
                        $('#edit_config_configValue').val(currentrow.configValue);
                        $('#edit_config_description').val(currentrow.description);
                        $('#edit_config_readOnly').val(currentrow.readOnly);
                        }
            //修改事件
            , confirmcallback: function () {

                if (!$('#config_editform').valid()){
                    return false;
                }

                $('#config_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('修改配置成功');
                            page_moudel.config_list_table.bootstrapTable('refresh');
                            $(".modal-footer button[data-bb-handler='cancel']").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('修改配置失败，可能是由网络原因引起的，请稍候再试');
                        return false;
                    }

                });

                return false;

            }
        })
    };

})()