    
var page_moudel = {};          //页面模块

(function () {

    var currentrow;           //当前行对象

    /**
     * 表格渲染
     */
    $(document).ready(function () {
        try {
            page_moudel.activityquery_list_table = $('#activityquery_list_table').bootstrapTable({
                url: baseURL + "/acitivtymgr/activityquery/list.mvc"
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
                , toolbar: '#activityquery_toolbar'
                , queryParams: function (params) {
                    $.extend(params, $('#activityquery_search').serializeObject());
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
                    /*{
                        title: '全选',
                        checkbox: true
                    }
                    ,*/
                    {
                        title: '序号',
                        formatter: function () {
                            return arguments[2] + 1;
                        }
                    }
                    ,{
                        title: '活动'
                        , field: 'title'
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
                        title: '民族'
                        , field: 'people'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return main_global.render.dictFormat("people",value);
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
                        title: '获得票数'
                        , field: 'votenum'
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
    page_moudel.activityquery_query = function () {
        page_moudel.activityquery_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };


    page_moudel.activityquery_export = function (){
        $.msg.confirm(function(){
            window.open(baseURL+"/acitivtymgr/activityquery/export.mvc?"+_csrf+"=" + token)
        },"确认导出数据？");



    }

})()