/**
 * User: zjt
 * DateTime: 2016/10/13 19:41
 *
 * 扩展juqery对象方法
 */
$.fn.extend({

    /**
     * 获取表格选中的i按,号拼接后返回
     * @returns {string}
     */
    getCheckedIds: function (id) {

        //id不为空: 代表单选,直接返回该id即可
        if ($.validate.isNotEmpty(id)) {
            return "'" + id + "'";
        }
        //id为空: 代表通过多选操作触发, 遍历自身, 拼接id
        else {

            if ($(this).length > 0) {

                var ids = "";

                $(this).each(function (index, obj) {
                    ids += "'" + $(obj).val() + "',";
                });

                return ids.substring(0, ids.length - 1);

            }
            else {
                return "";
            }

        }

    },

    /**
     * 获取树选中的ids
     */
    getTreeCheckedIds: function () {

        if (this.length > 0) {

            var ids = "";

            $(this).each(function (index, obj) {
                ids += obj.id + ",";
            });

            return ids.substring(0, ids.length - 1);

        }
        else {
            return "";
        }
    },

    /**
     * 初始化bootstrapTable
     */
    initBootstrapTable: function (option) {

        return $(this).bootstrapTable({
            url: option.url,
            method: option.method || "post",
            dataType: option.dataType || "json",
            cache: false,
            classes: 'table table-hover',
            striped: true,
            pagination: true,
            onClickRow: option.onClickRow || function (item, $element){},
            "queryParamsType": "limit",
            singleSelect: false,
            contentType: "application/x-www-form-urlencoded",
            pageSize: 10,
            pageNumber: 1,
            pageList: [10, 30, 50],
            search: false,          //不显示 搜索框
            showColumns: true,      //不显拉框（选择显示的列示下）
            showRefresh: true,
            showPaginationSwitch: false,
            smartDisplay: false,
            maintainSelected: true,
            showToggle: false,
            idField: option.idField || 'id',
            sidePagination: "server",
            toolbar: option.toolbar,
            queryParams: option.queryParams,
            responseHandler:option.responseHandler ||  function (response) {
                var griddata = {};
                try {

                    if ($.validate.isNotEmpty(response.data)) {
                        griddata.rows = response.data.rows || [];
                        griddata.total = response.data.total || 0;
                    }
                    else {
                        griddata.rows = response.rows || [];
                        griddata.total = response.total || 0;
                    }

                } catch (e) {

                }
                return griddata;
            },
            columns: option.columns
        });

    },

    /**
     * 加载用户社区列表 (平台管理员获取所有,社区管理员则只有自身)
     */
    loadCurrentUserCommunityList: function (isPrompt, edit_Id) {

        var $this = $(this);

        $.ajax({
            type: "post",
            url: baseURL + "/community/queryCurrentUserCommunityList?_csrf=" + token,
            dataType: "json",
            success: function (response) {

                if (response && response.success == true) {

                    var html = "";
                    
                    if (isPrompt&&response.data.length>1) {
                        html += "<option value='' >请选择</option>";
                    }

                    for (var i = 0; i < response.data.length; i++) {

                        if (response.data[i].ID == edit_Id) {
                            html += "<option selected='selected' value='" + response.data[i].ID + "' >" + response.data[i].NAME + "</option>";
                        } else {
                            html += "<option value='" + response.data[i].ID + "' >" + response.data[i].NAME + "</option>";
                        }

                    }

                    $this.html(html);
                }

            }
        });

    },

    /**
     * 加载用户门店列表(商户管理员获取所有,门店管理员则只有自身)
     */
    loadCurrentUserStoreList: function () {

        var $this = $(this);

        $.ajax({
            type: "post",
            url: baseURL + "/order/queryStoreList?_csrf=" + token,
            dataType: "json",
            success: function (response) {

                if (response && response.success == true) {

                    var html = "<option value='' >请选择</option>";
                    for (var i = 0; i < response.result.length; i++) {
                        html += "<option value='" + response.result[i].ID + "' >" + response.result[i].STORE_NAME + "</option>";
                    }

                    $this.html(html);

                }

            }
        });

    },

    /**
     * 加载用户门店列表(商户管理员获取所有,门店管理员则只有自身)
     */
    loadStoreListForEdit: function (id) {

        var $this = $(this);

        $.ajax({
            type: "post",
            url: baseURL + "/order/queryStoreList?_csrf=" + token,
            dataType: "json",
            success: function (response) {

                if (response && response.success == true) {

                    var html = "";
                    for (var i = 0; i < response.result.length; i++) {

                        if (id && id == response.result[i].ID) {
                            html += "<option value='" + response.result[i].ID + "' selected >" + response.result[i].STORE_NAME + "</option>";
                        } else {
                            html += "<option value='" + response.result[i].ID + "' >" + response.result[i].STORE_NAME + "</option>";
                        }

                    }

                    $this.html(html);

                }

            }
        });

    }

});

