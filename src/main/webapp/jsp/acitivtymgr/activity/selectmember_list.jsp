<%@page language="java" contentType="text/html; charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../../jsp/common/css_common.jsp" %>
</head>
<body class="container">
<div class="panel panel-default">

    <div class="panel-heading">
        <h3 class="panel-title">&nbsp;</h3>
    </div>

    <div class="panel-body">

        <!-- 搜索表单 -->
        <form  id="member_search"  onsubmit="return false;"  autocomplete="off" >
            <div class="searchDiv">
                <div class="panel panel-default">
                    <div class="panel-body">
                       <div class="search_box row">
                                    <label for="member_name" class="search_label">姓名：</label>
                                        <div class="col-xs-3">
                                         <input name="queryParams['name']" id="member_name" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>


                                        <label for="member_concatPhone" class="search_label">联系号码：</label>
                                        <div class="col-xs-3">
                                         <input name="queryParams['phone']" id="member_concatPhone" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                           </div>



                                               <div class="search_fn_box">

                                           <input class="btn btn-default " name="search" type="button" value="查 询" onclick="javascript:page_moudel.member_query();"/>&nbsp;
                                           <input class="btn btn-default" type="button" value="重 置"  onclick="$('#member_search')[0].reset(),page_moudel.member_query();">
                                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>&nbsp;&nbsp;


                            </div>
                    </div>
                </div>

            </div>
        </form>

        <!--  表格 -->
        <table id="member_list_table"></table>

        <!--  工具栏 -->
        <div id="member_toolbar">

            <%--  <button id="member_add" class="btn btn-success" onclick="page_moudel.add_member()">
                <i class="glyphicon glyphicon-plus"></i> 新增
            </button>

            <button id="member_remove" class="btn btn-danger" onclick="page_moudel.batchdel_member();">
                <i class="glyphicon glyphicon-remove"></i> 删除
            </button>

           <button class="btn btn-success fileinput-button" id="member_export">
                <i class="glyphicon glyphicon-download-alt"></i>
                <span  onclick="page_moudel.member_exportExcel()">导出数据</span>
			</button>--%>

        </div>

    </div>
</div>

</body>
</html>
</head>

<script>

    /**
     * 查询
     */
    page_moudel.member_query = function () {
        page_moudel.member_list_table.bootstrapTable('refresh',{query:{offset:0}});
    };
    $(document).ready(function () {
        try {
            page_moudel.member_list_table = $('#member_list_table').bootstrapTable({
                url: baseURL + "/acitivtymgr/activity/actmember/import/list.mvc?&id="+page_moudel.actid
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
                        title: '区域'
                        , field: 'area'
                        , sortable: true
                        , formatter: function (value, row, index) {
                            return main_global.render.dictFormat("area",value);
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

</script>

