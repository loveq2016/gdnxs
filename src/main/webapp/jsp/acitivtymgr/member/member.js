    
var page_moudel = {};          //页面模块

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.member_list_table = $('#member_list_table').bootstrapTable({
                url: baseURL + "/acitivtymgr/member/list.mvc"
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
                , toolbar: '#member_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#member_search').serializeObject());
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
                        title: '姓名'
                        , field: 'name'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '性别'
                        , field: 'gender'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return main_global.render.dictFormat("personSex",value);
                        }
                    }
                                                                                                                                                                                , {
                        title: '单位'
                        , field: 'work'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '民族'
                        , field: 'people'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return main_global.render.dictFormat("people",value);
                        }
                    }
                                                                                                                                                                                , {
                        title: '联系号码'
                        , field: 'concatPhone'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '生日'
                        , field: 'birthday'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                    , {
                        title: '城市'
                        , field: 'city'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '区域'
                        , field: 'area'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }
                                                                                                                                                                                , {
                        title: '特长'
                        , field: 'specialty'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
                        }
                    }

                        , {
                        title: '头像'
                        , field: 'avatar'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return "<img style='width:30px;height:30px;' src='"+baseURL+value+"'/>";
                        }

                    }

                    , {
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
                            var html = "";
                            /*html += '<a href="javascript:void(0)" class="glyphicon glyphicon-copy" onclick="page_moudel.copy_member(\'' + row.id + '\',\'' + index + '\')"></a>';*/
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-pencil" onclick="page_moudel.edit_member(\'' + row.id + '\',\'' + index + '\')"></a>';
                            /*html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-file" onclick="page_moudel.view_member(\'' + index + '\')"></a>';*/
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_member(\'' + row.id + '\')"></a>';
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
    page_moudel.member_query = function () {
        page_moudel.member_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };

    /**
     * 物理删除
     * @param id
     * @private
     */
    page_moudel.batchdel_member = function (id) {
        var str = '确定删除该行数据?';
        var ids = '';
        if(id){
            ids ="'"+id+"'";
        }else{
            var rows = page_moudel.member_list_table.bootstrapTable('getSelections');
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
            $.post(baseURL + '/acitivtymgr/member/delete.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.member_list_table.bootstrapTable('refresh');
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
    page_moudel.batchlogicdel_member = function (id) {
        var str = '确定删除该行数据?';
        var ids = '';
        if(id){
            ids ="'"+id+"'";
        }else{
            var rows = page_moudel.member_list_table.bootstrapTable('getSelections');
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
            $.post(baseURL + '/acitivtymgr/member/deleteLogicByIds.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.member_list_table.bootstrapTable('refresh');
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
    page_moudel.view_member = function (index) {

        page_moudel.member_list_table.bootstrapTable('uncheckAll');
        page_moudel.member_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.member_list_table.bootstrapTable('getSelections')[0];

        var dialog = $.dialog.view({
            className:"my-modal",
            title: '查看团员管理',
            url: baseURL + "/jsp/acitivtymgr/member/member_detail.jsp?"+_csrf+"=" + token,
            //页面加载完毕事件 ，主要用于完成页面诗句填充渲染
            afterloaded: function () {
            //数据源：currentrow
                        $('#view_member_id').html(currentrow.id);
                        $('#view_member_name').html(currentrow.name);
                        $('#view_member_gender').html(currentrow.gender);
                        $('#view_member_work').html(currentrow.work);
                        $('#view_member_concatPhone').html(currentrow.concatPhone);
                        $('#view_member_birthday').html(currentrow.birthday);
                        $('#view_member_area').html(currentrow.area);
                        $('#view_member_specialty').html(currentrow.specialty);
                        $('#view_member_selfdesc').html(currentrow.selfdesc);
                        $('#view_member_avatar').html(currentrow.avatar);
                        $('#view_member_profile').html(currentrow.profile);
                        $('#view_member_creatorid').html(currentrow.creatorid);
                        $('#view_member_createdate').html(currentrow.createdate);
                        $('#view_member_modifiedid').html(currentrow.modifiedid);
                        $('#view_member_modifieddate').html(currentrow.modifieddate);
                        $('#view_member_deletedflag').html(currentrow.deletedflag);
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
    page_moudel.add_member = function () {

        var dialog = $.dialog.addoredit({
            title: '添加团员管理',
            className:"my-modal",
            url: baseURL + "/jsp/acitivtymgr/member/member_add.jsp?"+_csrf+"=" + token,
            confirmcallback: function () {
                $("#add_member_profile").val(UE.getEditor('add_member_profile_ue').getContent());
                if (!$('#member_addform').valid()){
                    return false;
                }
                //提交数据
                $('#member_addform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ( result.code == "1") {
                            $.msg.success('新增团员管理成功');
                            page_moudel.member_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        $.msg.fail('新增团员管理失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.edit_member = function (id, index) {

        page_moudel.member_list_table.bootstrapTable('uncheckAll');
        page_moudel.member_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.member_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "修改团员管理" ,
            className:"my-modal",
            url: baseURL + "/jsp/acitivtymgr/member/member_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                        $('#edit_member_id').val(currentrow.id);
                        $('#edit_member_name').val(currentrow.name);
                        $('#edit_member_gender').val(currentrow.gender);
                        $('#edit_member_work').val(currentrow.work);
                        $('#edit_member_concatPhone').val(currentrow.concatPhone);
                        $('#edit_member_birthday').val(currentrow.birthday);
                $('#edit_member_mtype').val(currentrow.mtype);
                $('#edit_member_city').val(currentrow.city);
                $('#edit_member_people').val(currentrow.people);
                        $('#edit_member_area').val(currentrow.area);
                        $('#edit_member_specialty').val(currentrow.specialty);
                        $('#edit_member_selfdesc').val(currentrow.selfdesc);
                        $('#edit_member_avatar').val(currentrow.avatar);
                        $('#edit_member_avatar_img').attr("src",baseURL+currentrow.avatar);
                        $('#edit_member_profile').val(currentrow.profile);
                        $('#edit_member_creatorid').val(currentrow.creatorid);
                        $('#edit_member_createdate').val(currentrow.createdate);
                        $('#edit_member_modifiedid').val(currentrow.modifiedid);
                        $('#edit_member_modifieddate').val(currentrow.modifieddate);
                        $('#edit_member_deletedflag').val(currentrow.deletedflag);
                        }
            //修改事件
            , confirmcallback: function () {
                $("#edit_member_profile").val(UE.getEditor('edit_member_profile_ue').getContent());
                if (!$('#member_editform').valid()){
                    return false;
                }


                $('#member_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('修改团员管理成功');
                            page_moudel.member_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('修改团员管理失败，可能是由网络原因引起的，请稍候再试');
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
    page_moudel.copy_member = function (id, index) {

        page_moudel.member_list_table.bootstrapTable('uncheckAll');
        page_moudel.member_list_table.bootstrapTable('check', index);

        currentrow = page_moudel.member_list_table.bootstrapTable('getSelections')[0];

        $.dialog.addoredit({
            title: "复制团员管理" ,
            url: baseURL + "/jsp/acitivtymgr/member/member_edit.jsp?"+_csrf+"=" + token,
            afterloaded: function () {
                                    $('#edit_member_id').val(currentrow.id);
                                    $('#edit_member_name').val(currentrow.name);
                                    $('#edit_member_gender').val(currentrow.gender);
                                    $('#edit_member_work').val(currentrow.work);
                                    $('#edit_member_concatPhone').val(currentrow.concatPhone);
                                    $('#edit_member_birthday').val(currentrow.birthday);
                                    $('#edit_member_area').val(currentrow.area);
                                    $('#edit_member_specialty').val(currentrow.specialty);
                                    $('#edit_member_selfdesc').val(currentrow.selfdesc);
                                    $('#edit_member_avatar').val(currentrow.avatar);
                                    $('#edit_member_profile').val(currentrow.profile);
                                    $('#edit_member_creatorid').val(currentrow.creatorid);
                                    $('#edit_member_createdate').val(currentrow.createdate);
                                    $('#edit_member_modifiedid').val(currentrow.modifiedid);
                                    $('#edit_member_modifieddate').val(currentrow.modifieddate);
                                    $('#edit_member_deletedflag').val(currentrow.deletedflag);
                            }
            //修改事件
            , confirmcallback: function () {

                if (!$('#member_editform').valid()){
                    return false;
                }

                $('#member_editform').ajaxSubmit({
                    dataType: 'json',
                    success: function (result) {

                        if ("1" == result.code) {
                            $.msg.success('复制团员管理成功');
                            page_moudel.member_list_table.bootstrapTable('refresh');
                            $(".modal-footer .btn-danger").trigger("click");
                        } else {
                            $.msg.fail(result.desc);
                            return false;
                        }

                    },
                    error: function () {
                        window.parent.msg_alert('复制团员管理失败，请稍候再试');
                        return false;
                    }

                });


            }
        })
    };




    page_moudel.menmber_upload=
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
})()