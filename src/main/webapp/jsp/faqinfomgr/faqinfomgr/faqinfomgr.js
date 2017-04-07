    
var page_moudel = {};          //页面模块

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.faqinfomgr_list_table = $('#faqinfomgr_list_table').bootstrapTable({
                url: baseURL + "/faqinfomgr/faqinfomgr/list.mvc"
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
                , toolbar: '#faqinfomgr_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#faqinfomgr_search').serializeObject());
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
                        title: '标题'
                        , field: 'title'
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
                                                                                                                                                                                , {
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
                            var html = "";
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_faqinfomgr(\'' + row.id + '\',\'' + index + '\')"></a>';
                           /* html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_faqinfomgr(\'' + index + '\')"></a>';*/
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_faqinfomgr(\'' + row.id + '\')"></a>';
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
    page_moudel.faqinfomgr_query = function () {
        page_moudel.faqinfomgr_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };

    /**
     * 物理删除
     * @param id
     * @private
     */
    page_moudel.batchdel_faqinfomgr = function (id) {

        var str = '确定删除该行数据?';
        var ids = '';
        if(id){
            ids ="'"+id+"'";
        }else{
            var rows = page_moudel.faqinfomgr_list_table.bootstrapTable('getSelections');
            str = '确认删除所选数据?';
            if(rows.length<=0){
                $.msg.toast("请至少选中一项数据进行操作!");
                return;
            }
            var strids = [];
            for(var i = 0 ; i < rows.length; i++){
                strids.push("'"+rows[i].id+"'");
            }
            ids = strids.join(',');

        }


        $.msg.confirm(function () {
            $.post(baseURL + '/faqinfomgr/faqinfomgr/delete.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.faqinfomgr_list_table.bootstrapTable('refresh');
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
    page_moudel.batchlogicdel_faqinfomgr = function (id) {

        var ids =  $.getPresuffStr(id) || $('#faqinfomgr_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/faqinfomgr/faqinfomgr/deleteLogicByIds.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.faqinfomgr_list_table.bootstrapTable('refresh');
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
    page_moudel.view_faqinfomgr = function (index) {

        page_moudel.faqinfomgr_list_table.bootstrapTable('uncheckAll');
        page_moudel.faqinfomgr_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.faqinfomgr_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            title: '查看问题管理',
            url: baseURL + "/jsp/faqinfomgr/faqinfomgr/faqinfomgr_detail.jsp?"+_csrf+"=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
            //数据源：currentrow
                        $('#view_faqinfomgr_id').html(currentrow.id);
                        $('#view_faqinfomgr_title').html(currentrow.title);
                        $('#view_faqinfomgr_faqDesc').html(currentrow.faqDesc);
                        $('#view_faqinfomgr_creatorid').html(currentrow.creatorid);
                        $('#view_faqinfomgr_createdate').html(currentrow.createdate);
                        $('#view_faqinfomgr_modifiedid').html(currentrow.modifiedid);
                        $('#view_faqinfomgr_modifieddate').html(currentrow.modifieddate);
                        $('#view_faqinfomgr_deletedflag').html(currentrow.deletedflag);
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
    page_moudel.add_faqinfomgr = function () {

        var dialog = $.dialog.addoredit({
            title: '添加问题管理',
            url: baseURL + "/jsp/faqinfomgr/faqinfomgr/faqinfomgr_add.jsp?"+_csrf+"=" + token,
            confirmcallback: function () {
                $("#add_faqinfomgr_faqDesc").val(UE.getEditor('add_faqinfomgr_faqDesc_ue').getContent());
                if (!$('#faqinfomgr_addform').valid()){
                    return false;
                }

                //提交数据
                $('#faqinfomgr_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ( result.code == "1") {
                            $.msg.success('新增问题管理成功');
                            page_moudel.faqinfomgr_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                            dialog.modal('hide')
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        $.msg.fail('新增问题管理失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.edit_faqinfomgr = function (id, index) {

        page_moudel.faqinfomgr_list_table.bootstrapTable('uncheckAll');
        page_moudel.faqinfomgr_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.faqinfomgr_list_table.bootstrapTable('getSelections')[0];

        var dialog =  $.dialog.addoredit({
            title: "修改问题管理" ,
            url: baseURL + "/jsp/faqinfomgr/faqinfomgr/faqinfomgr_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                        $('#edit_faqinfomgr_id').val(currentrow.id);
                        $('#edit_faqinfomgr_title').val(currentrow.title);
                        $('#edit_faqinfomgr_faqDesc').val(currentrow.faqDesc);
                        }
            //修改事件
            , confirmcallback: function () {
                $("#edit_faqinfomgr_faqDesc").val(UE.getEditor('edit_faqinfomgr_faqDesc_ue').getContent());
                if (!$('#faqinfomgr_editform').valid()){
                    return false;
                }

                $('#faqinfomgr_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('修改问题管理成功');
                            page_moudel.faqinfomgr_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                            dialog.modal('hide')
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('修改问题管理失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.copy_faqinfomgr = function (id, index) {

        page_moudel.faqinfomgr_list_table.bootstrapTable('uncheckAll');
        page_moudel.faqinfomgr_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.faqinfomgr_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "复制问题管理" ,
            url: baseURL + "/jsp/faqinfomgr/faqinfomgr/faqinfomgr_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                                    $('#edit_faqinfomgr_id').val(currentrow.id);
                                    $('#edit_faqinfomgr_title').val(currentrow.title);
                                    $('#edit_faqinfomgr_faqDesc').val(currentrow.faqDesc);
                                    $('#edit_faqinfomgr_creatorid').val(currentrow.creatorid);
                                    $('#edit_faqinfomgr_createdate').val(currentrow.createdate);
                                    $('#edit_faqinfomgr_modifiedid').val(currentrow.modifiedid);
                                    $('#edit_faqinfomgr_modifieddate').val(currentrow.modifieddate);
                                    $('#edit_faqinfomgr_deletedflag').val(currentrow.deletedflag);
                            }
            //修改事件
            , confirmcallback: function () {

                if (!$('#faqinfomgr_editform').valid()){
                    return false;
                }

                $('#faqinfomgr_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('复制问题管理成功');
                            page_moudel.faqinfomgr_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('复制问题管理失败，请稍候再试');
                        return false;
                    }

                });

                return false;

            }
        })
    };
})()