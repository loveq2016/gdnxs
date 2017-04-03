var page_moudel = {};          //页面模块

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.generator_list_table = $('#generator_list_table').bootstrapTable({
                url: baseURL + "/sysextmgr/generator/list.mvc"
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
                , toolbar: '#generator_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#generator_search').serializeObject());
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
                        title: '项目根路径'
                        , field: 'rootPath'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    /*, {
                        title: 'java代码路径'
                        , field: 'srcRootPath'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: 'jsp页面路径'
                        , field: 'webRootPath'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }*/
                    , {
                        title: '表名'
                        , field: 'tableName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '数据库'
                        , field: 'dbName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: 'java文件前缀'
                        , field: 'javaName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '组件包名'
                        , field: 'componentName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '组件中文名'
                        , field: 'componentNamezhCn'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '模块包名'
                        , field: 'moduelName'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '模块中文名称'
                        , field: 'moduelNameznCn'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '生成vo的sql'
                        , field: 'voSql'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '创建人'
                        , field: 'user'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '创建时间'
                        , field: 'time'
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
                            html += '<a href="javascript:void(0)" class="glyphicon glyphicon-copy" onclick="page_moudel.copy_generator(\'' + row.id + '\',\'' + index + '\')"></a>';
                            //html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_generator(\'' + row.id + '\',\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_generator(\'' + index + '\')"></a>';
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_generator(\'' + row.id + '\')"></a>';
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

    /**
     * 查询
     */
    page_moudel.generator_query = function () {
        page_moudel.generator_list_table.bootstrapTable('refresh', {query: {offset: 0}});
    };

    /**
     * 物理删除
     * @param id
     * @private
     */
    page_moudel.batchdel_generator = function (id) {

        var ids = $.getPresuffStr(id) || $('#generator_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/generator/delete.mvc?' + _csrf + "=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.generator_list_table.bootstrapTable('refresh');
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
    page_moudel.batchlogicdel_generator = function (id) {

        var ids = $.getPresuffStr(id) || $('#generator_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/sysextmgr/generator/deleteLogicByIds.mvc?' + _csrf + "=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.generator_list_table.bootstrapTable('refresh');
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
    page_moudel.view_generator = function (index) {

        page_moudel.generator_list_table.bootstrapTable('uncheckAll');
        page_moudel.generator_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.generator_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            title: '查看代码生成器',
            url: baseURL + "/jsp/sysextmgr/generator/generator_detail.jsp?" + _csrf + "=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
                //数据源：currentrow
                $('#view_generator_id').html(currentrow.id);
                $('#view_generator_rootPath').html(currentrow.rootPath);
                $('#view_generator_srcRootPath').html(currentrow.srcRootPath);
                $('#view_generator_webRootPath').html(currentrow.webRootPath);
                $('#view_generator_tableName').html(currentrow.tableName);
                $('#view_generator_dbName').html(currentrow.dbName);
                $('#view_generator_javaName').html(currentrow.javaName);
                $('#view_generator_componentName').html(currentrow.componentName);
                $('#view_generator_componentNamezhCn').html(currentrow.componentNamezhCn);
                $('#view_generator_moduelName').html(currentrow.moduelName);
                $('#view_generator_moduelNameznCn').html(currentrow.moduelNameznCn);
                $('#view_generator_voSql').html(currentrow.voSql);
                $('#view_generator_user').html(currentrow.user);
                $('#view_generator_time').html(currentrow.time);
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
    page_moudel.add_generator = function () {

        var dialog = $.dialog.addoredit({
            title: '添加代码生成器',
            url: baseURL + "/jsp/sysextmgr/generator/generator_add.jsp?" + _csrf + "=" + token,
            confirmcallback: function () {

                if (!$('#generator_addform').valid()) {
                    return false;
                }

                //提交数据
                $('#generator_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if (result.code == "1") {
                            $.msg.success('新增代码生成器成功');
                            page_moudel.generator_list_table.bootstrapTable('refresh');
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
    page_moudel.edit_generator = function (id, index) {

        page_moudel.generator_list_table.bootstrapTable('uncheckAll');
        page_moudel.generator_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.generator_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "修改代码生成器",
            url: baseURL + "/jsp/sysextmgr/generator/generator_edit.jsp?" + _csrf + "=" + token,
            afterloaded: function () {
                $('#edit_generator_id').val(currentrow.id);
                $('#edit_generator_rootPath').val(currentrow.rootPath);
                $('#edit_generator_srcRootPath').val(currentrow.srcRootPath);
                $('#edit_generator_webRootPath').val(currentrow.webRootPath);
                $('#edit_generator_tableName').val(currentrow.tableName);
                $('#edit_generator_dbName').val(currentrow.dbName);
                $('#edit_generator_javaName').val(currentrow.javaName);
                $('#edit_generator_componentName').val(currentrow.componentName);
                $('#edit_generator_componentNamezhCn').val(currentrow.componentNamezhCn);
                $('#edit_generator_moduelName').val(currentrow.moduelName);
                $('#edit_generator_moduelNameznCn').val(currentrow.moduelNameznCn);
                $('#edit_generator_voSql').val(currentrow.voSql);
                $('#edit_generator_user').val(currentrow.user);
                $('#edit_generator_time').val(currentrow.time);
            }
            //修改事件
            , confirmcallback: function () {

                if (!$('#generator_editform').valid()) {
                    return false;
                }

                $('#generator_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('修改代码生成器成功');
                            page_moudel.generator_list_table.bootstrapTable('refresh');
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
     * 编辑
     * @param id
     * @param index
     * @private
     */
    page_moudel.copy_generator = function (id, index) {

        page_moudel.generator_list_table.bootstrapTable('uncheckAll');
        page_moudel.generator_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.generator_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "复制代码生成器",
            url: baseURL + "/jsp/sysextmgr/generator/generator_edit.jsp?" + _csrf + "=" + token,
            afterloaded: function () {
                //$('#edit_generator_id').val(currentrow.id);
                $('#edit_generator_rootPath').val(currentrow.rootPath);
                $('#edit_generator_srcRootPath').val(currentrow.srcRootPath);
                $('#edit_generator_webRootPath').val(currentrow.webRootPath);
                $('#edit_generator_tableName').val(currentrow.tableName);
                $('#edit_generator_dbName').val(currentrow.dbName);
                $('#edit_generator_javaName').val(currentrow.javaName);
                $('#edit_generator_componentName').val(currentrow.componentName);
                $('#edit_generator_componentNamezhCn').val(currentrow.componentNamezhCn);
                $('#edit_generator_moduelName').val(currentrow.moduelName);
                $('#edit_generator_moduelNameznCn').val(currentrow.moduelNameznCn);
                $('#edit_generator_voSql').val(currentrow.voSql);
                $('#edit_generator_user').val(currentrow.user);
                $('#edit_generator_time').val(currentrow.time);
            }
            //修改事件
            , confirmcallback: function () {

                if (!$('#generator_editform').valid()) {
                    return false;
                }

                $('#generator_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('复制代码生成器成功');
                            page_moudel.generator_list_table.bootstrapTable('refresh');
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