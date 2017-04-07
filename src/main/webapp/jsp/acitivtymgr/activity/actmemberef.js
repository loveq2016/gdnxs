    

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.ActMembeRef_list_table = $('#ActMembeRef_list_table').bootstrapTable({
                url: baseURL + "/acitivtymgr/activity/actmember/list.mvc?&id="+page_moudel.actid
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
                , toolbar: '#ActMembeRef_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#ActMembeRef_search').serializeObject());
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
                        title: '编号'
                        , field: 'no'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
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
                        title: '姓名'
                        , field: 'name'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return value;
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
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
                            var html = "";
                            html += '&nbsp;<a href="javascript:void(0)" class="glyphicon glyphicon-remove" onclick="page_moudel.batchdel_ActMembeRef(\'' + row.refid + '\')"></a>';
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
    page_moudel.ActMembeRef_query = function () {
        page_moudel.ActMembeRef_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };

    /**
     * 物理删除
     * @param id
     * @private
     */
    page_moudel.batchdel_ActMembeRef = function (id) {

        var ids = $.getPresuffStr(id) || $('#ActMembeRef_list_table input[name=btSelectItem]:checked').strvalpresuff();
        if (!ids) {
            $.msg.toast();
            return;
        }

        $.msg.confirm(function () {
            $.post(baseURL + '/acitivtymgr/activity/actmember/delete.mvc?'+_csrf+"=" + token, {"ids": ids}, function (rec) {
                if (rec.code == "1") {
                    $.msg.success();
                    page_moudel.ActMembeRef_list_table.bootstrapTable('refresh');
                } else {
                    $.msg.fail(rec.desc);
                }
            }, "json").error(function () {
                $.msg.fail()
            });
        })

    };

    page_moudel.import_member = function(){
        var dialog = $.dialog.addoredit({
            title: '导入活动团员',
            className:"my_modal",
            url: baseURL + "/jsp/acitivtymgr/activity/selectmember_list.jsp?"+_csrf+"=" + token,
            confirmcallback: function () {
                var rows =  $("#member_list_table").bootstrapTable('getSelections');

                if(rows && rows.length>0){
                    var ids =[]
                    var memberids='';
                    for(var i = 0 ; i < rows.length;i++){
                        ids.push(rows[i].id)
                    }
                    memberids = ids.join(',');

                    $.post((baseURL+'/acitivtymgr/activity/import/actmember.mvc?'+_csrf+"=" + token),{"id":page_moudel.actid,"memberids":memberids},function(rec){
                        if(rec.code == "1"){
                            $.msg.success("导入成功");
                            page_moudel.ActMembeRef_list_table.bootstrapTable('refresh');
                            dialog.modal('hide')
                        }else{
                            $.msg.fail(rec.desc);
                        }
                    },"json").error(function(){
                        $.msg.fail()
                    });

                }else{
                    $.msg.fail('请选中一行进行导入！');
                    return false;
                }
                return false;
            }
        });
    }


})()