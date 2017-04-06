    
var page_moudel = {};          //页面模块

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.notice_list_table = $('#notice_list_table').bootstrapTable({
                url: baseURL + "/messagemgr/notice/list.mvc"
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
                , toolbar: '#notice_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#notice_search').serializeObject());
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
                        title: '通知图片'
                        , field: 'purl'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return "<img style='width:30px;height:30px;' src='"+baseURL+value+"'/>";
                        }
                    }
                                                                                                                                                                                , {
                        title: '区域'
                        , field: 'area'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return main_global.render.dictFormat("area",value);
                        }
                    }
                                                                                                                                                                                , {
                        title: '附件名'
                        , field: 'attachmentname'
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
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_notice(\'' + row.id + '\',\'' + index + '\')"></a>';
                            /*html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_notice(\'' + index + '\')"></a>';*/
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_notice(\'' + row.id + '\')"></a>';
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
    page_moudel.notice_query = function () {
        page_moudel.notice_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };

    /**
     * 物理删除
     * @param id
     * @private
     */
    page_moudel.batchdel_notice = function (id) {

        var str = '确定删除该行数据?';
        var ids = '';
        if(id){
            ids ="'"+id+"'";
        }else{
            var rows = page_moudel.notice_list_table.bootstrapTable('getSelections');
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

        /*var ids = $.getPresuffStr(id) || $('#notice_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }*/

        $.msg.confirm(function () {
            $.post(baseURL + '/messagemgr/notice/delete.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.notice_list_table.bootstrapTable('refresh');
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
    page_moudel.batchlogicdel_notice = function (id) {

        var ids =  $.getPresuffStr(id) || $('#notice_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/messagemgr/notice/deleteLogicByIds.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.notice_list_table.bootstrapTable('refresh');
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
    page_moudel.view_notice = function (index) {

        page_moudel.notice_list_table.bootstrapTable('uncheckAll');
        page_moudel.notice_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.notice_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            title: '查看通知管理',
            url: baseURL + "/jsp/messagemgr/notice/notice_detail.jsp?"+_csrf+"=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
            //数据源：currentrow
                        $('#view_notice_id').html(currentrow.id);
                        $('#view_notice_title').html(currentrow.title);
                        $('#view_notice_purl').html(currentrow.purl);
                        $('#view_notice_ndesc').html(currentrow.ndesc);
                        $('#view_notice_area').html(currentrow.area);
                        $('#view_notice_attachmentname').html(currentrow.attachmentname);
                        $('#view_notice_attachment').html(currentrow.attachment);
                        $('#view_notice_creatorid').html(currentrow.creatorid);
                        $('#view_notice_createdate').html(currentrow.createdate);
                        $('#view_notice_modifiedid').html(currentrow.modifiedid);
                        $('#view_notice_modifieddate').html(currentrow.modifieddate);
                        $('#view_notice_deletedflag').html(currentrow.deletedflag);
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
    page_moudel.add_notice = function () {

        var dialog = $.dialog.addoredit({
            title: '添加通知管理',
            url: baseURL + "/jsp/messagemgr/notice/notice_add.jsp?"+_csrf+"=" + token,
            confirmcallback: function () {

                $("#add_notice_ndesc").val(UE.getEditor('add_notice_ndesc_ue').getContent());
                if (!$('#notice_addform').valid()){
                    return false;
                }

                //提交数据
                $('#notice_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ( result.code == "1") {
                            $.msg.success('新增通知管理成功');
                            page_moudel.notice_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                            dialog.modal('hide')
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        $.msg.fail('新增通知管理失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.edit_notice = function (id, index) {

        page_moudel.notice_list_table.bootstrapTable('uncheckAll');
        page_moudel.notice_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.notice_list_table.bootstrapTable('getSelections')[0];

        var dialog =  $.dialog.addoredit({
            title: "修改通知管理" ,
            url: baseURL + "/jsp/messagemgr/notice/notice_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                        $('#edit_notice_id').val(currentrow.id);
                        $('#edit_notice_title').val(currentrow.title);
                        $('#edit_notice_purl').val(currentrow.purl);
                $('#edit_notice_purl_img').attr("src",baseURL+currentrow.purl);
                $('#edit_notice_ndesc').val(currentrow.ndesc);
                $('#edit_notice_area').val(currentrow.area);
                $('#edit_notice_attachmentname').val(currentrow.attachmentname);
                $('#edit_notice_attachment').val(currentrow.attachment);
                $('#edit_notice_attachment_a').attr("href",baseURL+currentrow.attachment);
                $('#edit_notice_attachment_a').html(currentrow.attachmentname);
                $('#notice_attachmentname').val(currentrow.attachmentname);
                        }
            //修改事件
            , confirmcallback: function () {
                $("#edit_notice_ndesc").val(UE.getEditor('edit_notice_ndesc_ue').getContent());
                if (!$('#notice_editform').valid()){
                    return false;
                }

                $('#notice_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('修改通知管理成功');
                            page_moudel.notice_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                            dialog.modal('hide')
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('修改通知管理失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.copy_notice = function (id, index) {

        page_moudel.notice_list_table.bootstrapTable('uncheckAll');
        page_moudel.notice_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.notice_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "复制通知管理" ,
            url: baseURL + "/jsp/messagemgr/notice/notice_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                                    $('#edit_notice_id').val(currentrow.id);
                                    $('#edit_notice_title').val(currentrow.title);
                                    $('#edit_notice_purl').val(currentrow.purl);
                                $('#edit_notice_purl_img').attr("src",baseURL+currentrow.purl);
                                    $('#edit_notice_ndesc').val(currentrow.ndesc);
                                    $('#edit_notice_area').val(currentrow.area);
                                    $('#edit_notice_attachmentname').val(currentrow.attachmentname);
                                    $('#edit_notice_attachment').val(currentrow.attachment);
                $('#edit_notice_attachment_a').attr("href",baseURL+currentrow.attachment);
                $('#edit_notice_attachment_a').html(currentrow.attachmentname);
                $('#notice_attachmentname').val(currentrow.attachmentname);
                                    $('#edit_notice_creatorid').val(currentrow.creatorid);
                                    $('#edit_notice_createdate').val(currentrow.createdate);
                                    $('#edit_notice_modifiedid').val(currentrow.modifiedid);
                                    $('#edit_notice_modifieddate').val(currentrow.modifieddate);
                                    $('#edit_notice_deletedflag').val(currentrow.deletedflag);
                            }
            //修改事件
            , confirmcallback: function () {

                if (!$('#notice_editform').valid()){
                    return false;
                }

                $('#notice_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('复制通知管理成功');
                            page_moudel.notice_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('复制通知管理失败，请稍候再试');
                        return false;
                    }

                });

                return false;

            }
        })
    };




    page_moudel.noticep_upload=
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

            /*$.ajaxFileUpload({
             url: baseURL+'/acitivtymgr/member/uploadImg.mvc?'+_csrf+'=' + token+'&folder=menmber',
             secureuri:false,
             fileElementId:a+"_inp",
             type: 'POST',
             dataType: 'json',
             success: function (rec) {
             if (rec && rec.success == true) {
             alert("#"+a+"_img")
             $("#"+a).val(rec.fileName);
             $("#"+a+"_img").attr("src",baseURL+rec.fileName);
             } else {
             $.msg.fail(rec.msg);
             }
             }
             });
             */
        }


    page_moudel.noticeacc_upload=
        function(a){

            if(!$("#"+a+"_inp").val()){
                $.msg.fail("请选择文件上传！");
                return;
            }
            var suffix = $("#"+a+"_inp").val().substring($("#"+a+"_inp").val().lastIndexOf("."))
            if(attachmentpostfix.toUpperCase().indexOf(suffix.toUpperCase())<0){
                $.msg.fail("上传格式不正确，允许上传文件的后缀格式为："+attachmentpostfix)
                return;
            }

            var formData = new FormData();
            formData.append('upFile', $("#"+a+"_inp")[0].files[0]);

            $.ajax({
                data: formData,
                type: "POST",
                url: baseURL+'/messagemgr/notice/uploadFile.mvc?'+_csrf+'=' + token+'&folder=notice',
                cache: false,
                contentType: false,
                processData: false,
                dataType:"json",
                success:function (rec) {
                    console.info(rec)
                    if (rec && rec.success == true) {
                    $("#"+a).val(rec.fileName);
                    $("#"+a+"_a").attr("href",baseURL+rec.fileName);
                    $("#"+a+"_a").html(rec.realName);
                    $("#notice_attachmentname").val(rec.realName);
                } else {
                    $.msg.fail(rec.msg);
                    }
                }
            });

            /*$.ajaxFileUpload({
                 url: baseURL+'/messagemgr/notice/uploadFile.mvc?'+_csrf+'=' + token+'&folder=notice',
                 secureuri:false,
                 fileElementId:a+"_inp",
                 type: 'POST',
                 success: function (rec) {
                     rec = jQuery.parseJSON(rec);
                     alert(rec.success)
                     /!*if (rec && rec.success == true) {
                      alert(123)
                      $("#"+a).val(rec.fileName);
                      $("#"+a+"_a").attr("href",baseURL+rec.fileName);
                      $("#"+a+"_a").html(rec.realName);
                      $("#notice_attachmentname").html(rec.realName);
                      } else {
                      $.msg.fail(rec.msg);
                      }*!/
                 }
                ,error:function(){
                    alert("上传失败")
                }

             });*/
        }
})()