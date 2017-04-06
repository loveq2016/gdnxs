    
var page_moudel = {};          //页面模块

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.activity_list_table = $('#activity_list_table').bootstrapTable({
                url: baseURL + "/acitivtymgr/activity/list.mvc"
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
                , toolbar: '#activity_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#activity_search').serializeObject());
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
                        title: '首页推荐图片'
                        , field: 'homepagep'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return "<img style='width:30px;height:30px;' src='"+baseURL+value+"'/>";
                        }
                    }
                                                                                                                                                                                , {
                        title: '活动结束时间'
                        , field: 'endTime'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '是否推送图片到首页'
                        , field: 'isPushHomepage'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return main_global.render.dictFormat("YesOrNo",value);
                        }
                    }
                                                                                                                                                                                , {
                        title: '活动状态'
                        , field: 'astatus'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return main_global.render.dictFormat("ACTSTATUS",value);
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
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_activity(\'' + row.id + '\',\'' + index + '\')"></a>';
                            /*html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_activity(\'' + index + '\')"></a>';*/
                            html += '&nbsp;&nbsp;<a href="javascript:void(0)"   onclick="page_moudel.view_actmember(\'' + row.id + '\',\''+index+'\')">设置团员</a>'
                            html += '&nbsp;&nbsp;<a href="javascript:void(0)"   onclick="page_moudel.view_actphoto(\'' + row.id + '\',\''+index+'\')">管理轮播图片</a>'
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_activity(\'' + row.id + '\')"></a>';
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
    page_moudel.activity_query = function () {
        page_moudel.activity_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };

    /**
     * 物理删除
     * @param id
     * @private
     */
    page_moudel.batchdel_activity = function (id) {

        var str = '确定删除该行数据?';
        var ids = '';
        if(id){
            ids ="'"+id+"'";
        }else{
            var rows = page_moudel.activity_list_table.bootstrapTable('getSelections');
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
            $.post(baseURL + '/acitivtymgr/activity/delete.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.activity_list_table.bootstrapTable('refresh');
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
    page_moudel.batchlogicdel_activity = function (id) {

        var ids =  $.getPresuffStr(id) || $('#activity_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/acitivtymgr/activity/deleteLogicByIds.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.activity_list_table.bootstrapTable('refresh');
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
    page_moudel.view_activity = function (index) {

        page_moudel.activity_list_table.bootstrapTable('uncheckAll');
        page_moudel.activity_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.activity_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            title: '查看活动管理',
            url: baseURL + "/jsp/acitivtymgr/activity/activity_detail.jsp?"+_csrf+"=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
            //数据源：currentrow
                        $('#view_activity_id').html(currentrow.id);
                        $('#view_activity_title').html(currentrow.title);
                        $('#view_activity_homepagep').html(currentrow.homepagep);
                        $('#view_activity_endTime').html(currentrow.endTime);
                        $('#view_activity_isPushHomepage').html(currentrow.isPushHomepage);
                        $('#view_activity_activiyDesc').html(currentrow.activiyDesc);
                        $('#view_activity_astatus').html(currentrow.astatus);
                        $('#view_activity_creatorid').html(currentrow.creatorid);
                        $('#view_activity_createdate').html(currentrow.createdate);
                        $('#view_activity_modifiedid').html(currentrow.modifiedid);
                        $('#view_activity_modifieddate').html(currentrow.modifieddate);
                        $('#view_activity_deletedflag').html(currentrow.deletedflag);
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
    page_moudel.add_activity = function () {

        var dialog = $.dialog.addoredit({
            title: '添加活动管理',
            url: baseURL + "/jsp/acitivtymgr/activity/activity_add.jsp?"+_csrf+"=" + token,
            confirmcallback: function () {
                $("#add_activity_activiyDesc").val(UE.getEditor('add_activity_activiyDesc_ue').getContent());
                if (!$('#activity_addform').valid()){
                    return false;
                }

                //提交数据
                $('#activity_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ( result.code == "1") {
                            $.msg.success('新增活动管理成功');
                            page_moudel.activity_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        $.msg.fail('新增活动管理失败，可能是由网络原因引起的，请稍候再试');
                        return false;
                    }
                });

            }
        });

    };

    /**
     * 编辑
     * @param id
     * @param index
     * @private
     */
    page_moudel.edit_activity = function (id, index) {

        page_moudel.activity_list_table.bootstrapTable('uncheckAll');
        page_moudel.activity_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.activity_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "修改活动管理" ,
            url: baseURL + "/jsp/acitivtymgr/activity/activity_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                        $('#edit_activity_id').val(currentrow.id);
                        $('#edit_activity_title').val(currentrow.title);
                        $('#edit_activity_homepagep').val(currentrow.homepagep);
                        $('#edit_activity_homepagep_img').attr("src",baseURL+currentrow.homepagep);
                        $('#edit_activity_endTime').val(currentrow.endTime);
                        $('#edit_activity_isPushHomepage').val(currentrow.isPushHomepage);
                        $('#edit_activity_activiyDesc').val(currentrow.activiyDesc);
                        $('#edit_activity_astatus').val(currentrow.astatus);
                        }
            //修改事件
            , confirmcallback: function () {
                $("#edit_activity_activiyDesc").val(UE.getEditor("edit_activity_activiyDesc_ue").getContent());
                if (!$('#activity_editform').valid()){
                    return false;
                }

                $('#activity_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('修改活动管理成功');
                            page_moudel.activity_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('修改活动管理失败，可能是由网络原因引起的，请稍候再试');
                        return false;
                    }

                });


            }
        })
    };
    /**
     * 复制
     * @param id
     * @param index
     * @private
     */
    page_moudel.copy_activity = function (id, index) {

        page_moudel.activity_list_table.bootstrapTable('uncheckAll');
        page_moudel.activity_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.activity_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "复制活动管理" ,
            url: baseURL + "/jsp/acitivtymgr/activity/activity_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                                    $('#edit_activity_id').val(currentrow.id);
                                    $('#edit_activity_title').val(currentrow.title);
                                    $('#edit_activity_homepagep').val(currentrow.homepagep);
                                    $('#edit_activity_endTime').val(currentrow.endTime);
                                    $('#edit_activity_isPushHomepage').val(currentrow.isPushHomepage);
                                    $('#edit_activity_activiyDesc').val(currentrow.activiyDesc);
                                    $('#edit_activity_astatus').val(currentrow.astatus);
                                    $('#edit_activity_creatorid').val(currentrow.creatorid);
                                    $('#edit_activity_createdate').val(currentrow.createdate);
                                    $('#edit_activity_modifiedid').val(currentrow.modifiedid);
                                    $('#edit_activity_modifieddate').val(currentrow.modifieddate);
                                    $('#edit_activity_deletedflag').val(currentrow.deletedflag);
                            }
            //修改事件
            , confirmcallback: function () {

                if (!$('#activity_editform').valid()){
                    return false;
                }

                $('#activity_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('复制活动管理成功');
                            page_moudel.activity_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('复制活动管理失败，请稍候再试');
                        return false;
                    }

                });

                return false;

            }
        })
    };


    page_moudel.activity_upload=
        function(a){

            if(!$("#"+a+"_inp").val()){
                $.msg.fail("请选择图片上传！");
                return;
            }
            var suffix = $("#"+a+"_inp").val().substring($("#"+a+"_inp").val().lastIndexOf("."))
            if(picpostfix.toUpperCase().indexOf(suffix.toUpperCase())<0){
                $.msg.fail("上传格式不正确，允许上传文件的后缀格式为："+picpostfix)
                return;
            }
            setImagePreview(a+"_inp",a+'_img')
        }


    page_moudel.view_actmember = function (id,index) {

        page_moudel.activity_list_table.bootstrapTable('uncheckAll');
        page_moudel.activity_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.activity_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            title: '设置团员',
            className:"my_modal",
            url: baseURL + "/jsp/acitivtymgr/activity/actmemberef_list.jsp?"+_csrf+"=" + token+"&id="+id,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
            },
            //关闭事件
            closecallback: function () {
            }
        });

    };

    page_moudel.view_actphoto = function (id,index) {

        page_moudel.activity_list_table.bootstrapTable('uncheckAll');
        page_moudel.activity_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.activity_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            title: '管理轮播图片',
            url: baseURL + "/acitivtymgr/activity/actphoto/list?"+_csrf+"=" + token+"&id="+id,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {

            },
            //关闭事件
            closecallback: function () {
            }
        });

    };
})()