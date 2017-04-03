var logTable = {};
var userIds=[];
$(function(){
	   
	
	$('#startTime').datetimepicker();
	$('#endTime').datetimepicker();
	
	logTable=$('#log_list_table').bootstrapTable({
		url:baseURL + '/log/getLogList?' + _csrf + '=' + token,
		method:'post',
        dataType: "json",
        cache:false,
        striped:true,
        pagination: true,
        "queryParamsType": "limit",
        singleSelect: false,
        contentType: "application/x-www-form-urlencoded",
        pageSize: 10,
        pageNumber:1,
        pageList:[10],
        search: false,
        showColumns: true,
        showRefresh:true,
        showPaginationSwitch:false,
        smartDisplay:false,
        maintainSelected:true,
        showToggle:false,
        idField:'id',
        sidePagination: "server",
        toolbar:"#log_toolbar",
        queryParams:function(params){
        	$.extend(params,{
        		//分页参数
                'offset':params.offset,			//从那条记录开始取数据,例如limit 0,10
                'limit':params.limit,			//每页显示条数
                'sort':params.sort,				//排序字段
                'order':params.order,			//排序方式
                //查询字段
                'model':$('#logModel').val(),
                'startTime':$('#startTime').data().date,
                'endTime':$('#endTime').data().date
            });
            return params;
            
        },
        responseHandler:function(response){
        	
            var griddata = {};		//表格数据
            try {
                griddata.rows = response.rows || [];			//当前页的数据
                griddata.total = response.total;				//总记录数
            }catch(e){
            	griddata.rows = [];
                griddata.total = 0;
            }
            return griddata;
        },
        onClickRow:function(row,tr){
        	logTable.currentrow = row;
//        	showMsgDetail(row);
        },
        columns:[
                  {
                      title:'序号'
                      , formatter:function(){
                          return arguments[2]+1;
                      }
                  },
                  {
                      field: 'author'
                      , title:'操作用户'
                      , sortable:true
                      , formatter:function(value,row,index){
                          return value;
                      }
                  },
                  {
                      field: 'operation'
                      , title: '操作描述'
                      , sortable:true
                      , formatter:function(value,row,index){
                    	  return value;
                      }
                  },
                  {
                      field: 'create_time'
                      ,title:'创建时间'
                      , sortable:true
                      , formatter:function(value,row,index){
                          return value;
                      }
                  },
                  {
                      field: 'status'
                      ,title:'状态'
                      , sortable:true
                      , formatter:function(value,row,index){
                      	if("0" == value){
                      		return "失败"; 
                      	}else if("1" == value){
                      		return "成功";
                      	}
                      	
                      }
                  },
                  {
                      title:'操作'
                      ,width:150
                      , align:'center'
                      , formatter:function(value,row,index){
                          return '<a href="javascript:void(0)"  class="glyphicon glyphicon-file" onclick="showLogDetail(\''+row+'\')"></a>';
                      }

                  }
              ]
	});
	
	$('#myModal').on('hide.bs.modal', function () {
		logTable.bootstrapTable('refresh');
	 });
});
function searchLog(){
	logTable.bootstrapTable('refresh');
}
function showLogDetail(row){
	//$("#modal-body").html(row["operation"]);
	$("#createTime").html(row["create_time"]);
	$("#author").html(row["author"]);
	$("#model").html(row["model"]);
	$("#description").html(row["description"]);
	$("#ip").html(row["ip"]);
	if(row["status"]=="0"){
		$("#status").html("失败");
	}else{
		$("#status").html("成功");
	}
	
	$("#myModal").modal({
	    keyboard: true
	});
}
