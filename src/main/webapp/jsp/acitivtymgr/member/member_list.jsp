<%@ page import="cn.com.gzqinghui.common.util.DictUtil" %>
<%@page language="java" contentType="text/html; charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../../jsp/common/css_common.jsp" %>
    <style>
        .my-modal .modal-dialog{
            width: 60%;
        }

    </style>

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
                                         <input name="member.name" id="member_name" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>

                                       <%-- <label for="member_gender" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.gender" id="member_gender" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-3">
                                                                                                                                                                                                        <label for="member_work" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.work" id="member_work" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>--%>

                                        <label for="member_concatPhone" class="search_label">联系号码：</label>
                                        <div class="col-xs-3">
                                         <input name="member.concatPhone" id="member_concatPhone" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                           </div>


                                       <%--<label for="member_birthday" class="search_label">：</label> <div class="col-xs-3">
                                         <input name="member.birthday" id="member_birthday" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-6">
                                                                                                                                                                                                        <label for="member_area" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.area" id="member_area" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="member_specialty" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.specialty" id="member_specialty" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="member_selfdesc" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.selfdesc" id="member_selfdesc" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-9">
                                                                                                                                                                                                        <label for="member_avatar" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.avatar" id="member_avatar" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="member_profile" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.profile" id="member_profile" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="member_creatorid" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.creatorid" id="member_creatorid" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-12">
                                                                                                                                                                                                        <label for="member_createdate" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.createdate" id="member_createdate" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="member_modifiedid" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.modifiedid" id="member_modifiedid" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                                                                                                                                         <label for="member_modifieddate" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.modifieddate" id="member_modifieddate" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div>
                                                                                 </div>
                                        <div class="search_box row row-15">
                                                                                                                                                                                                        <label for="member_deletedflag" class="search_label">：</label>
                                        <div class="col-xs-3">
                                         <input name="member.deletedflag" id="member_deletedflag" type="text"
                                                        class="form-control btn-block" placeholder="" aria-describedby="basic-addon1"/></td>
                                        </div></div>--%>

                                               <div class="search_fn_box">

                                           <input class="btn btn-default " name="search" type="button" value="查 询" onclick="javascript:page_moudel.member_query();"/>&nbsp;
                                           <input class="btn btn-default" type="button" value="重 置"  onclick="$('#member_search')[0].reset(),page_moudel.member_query();">
                                           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>&nbsp;&nbsp;
                                           <a href="javascript:void(0);"   onclick="page_moudel.add_member();">
                                           <i class="glyphicon glyphicon-plus"></i>&nbsp;添加</a>
                                           <a href="javascript:void(0);" onclick="page_moudel.batchdel_member();">
                                           <i class="glyphicon glyphicon-remove"></i>&nbsp;删除
                                           </a>
<%--
                                           <a href="javascript:void(0);" onclick="page_moudel.generator_member()">
                                           <i class="glyphicon glyphicon-download-alt"></i>&nbsp;导出数据
                            </a>
--%>


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
    <%@include file="../../../jsp/common/js_common.jsp" %>
    <script type="text/javascript" src="${baseURL}/jsp/acitivtymgr/member/member.js"></script>
</head>

