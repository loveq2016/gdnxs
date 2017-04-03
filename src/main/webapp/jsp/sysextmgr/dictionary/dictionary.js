//新增字典分类
function addDictionarySort(id,level,dictType,dictTypeDesc){
    var viewdialog = $.dialog.addoredit({
        title:'新增字典分类'
        ,url:baseURL+'/jsp/sysextmgr/dictionary/dictionary_sort_add.jsp'
        ,confirmcallback:function(){
            if(!$('#dictionary_sort_addform').valid())
                return false;
            var btn = $(".modal-footer .btn-success");
            btn.attr("disabled","disabled");
            $('#dictionary_sort_addform').ajaxSubmit({
                dataType:'json',
                success:function (response) {
                    btn.removeAttr("disabled");
                    if(response && response.success == true) {
                        //重置表单、并查询
                        $("#dictionary_search")[0].reset();
                        dictionary_search();
                        bootbox.hideAll();	//关闭窗口
                        $.msg.success(response.msg);
                    } else {
                        $.msg.fail(response.msg);
                        return false;
                    }
                },
                error:function () {
                    btn.removeAttr("disabled");
                    $.msg.fail('新增字典分类失败，请重试！');
                    return false;
                }
            });
            return false;
        }
    });
    viewdialog.on('loaded.bs.modal', function () {
        $("#add_id").val(id);//
        $("#add_level").val(level+1);//
        $("#add_dictType").val(dictType);//
        $("#add_dictTypeDesc").val(dictTypeDesc);//
    });
}

//修改字典分类
function editDictionary(id,level,dictType,dictTypeDesc,itemCode,itemCodeDesc){
    var viewdialog = $.dialog.addoredit({
        title:'修改字典'
        ,url:baseURL+'/jsp/sysextmgr/dictionary/dictionary_edit.jsp'
        ,confirmcallback:function(){
            if(!$('#dictionary_editform').valid())
                return false;
            var btn = $(".modal-footer .btn-success");
            btn.attr("disabled","disabled");
            $('#dictionary_editform').ajaxSubmit({
                dataType:'json',
                success:function (response) {
                    btn.removeAttr("disabled");
                    if(response && response.success == true) {
                        //重置表单、并查询
                        $("#dictionary_search")[0].reset();
                        dictionary_search();
                        bootbox.hideAll();	//关闭窗口
                        $.msg.success(response.msg);
                    } else {
                        $.msg.fail(response.msg);
                        return false;
                    }
                },
                error:function () {
                    btn.removeAttr("disabled");
                    $.msg.fail('修改字典失败，请重试！');
                    return false;
                }
            });
            return false;
        }
    });
    viewdialog.on('loaded.bs.modal', function () {
        $("#edit_id").val(id);//
        $("#edit_level").val(level);//
        if(level==0){
            $('#edit_dictType').val(dictType)
            $('#edit_dictTypeDesc').val(dictTypeDesc)
            $('#edit_dictType').attr("check-type","required")//设置为非空
            $('#edit_dictTypeDesc').attr("check-type","required")//设置为非空
            $('#edit_itemCode').attr("disabled","disabled")//设置为disabled
            $('#edit_itemCodeDesc').attr("disabled","disabled")//设置为disabled
        } else{
            $('#edit_dictType').val(dictType)
            $('#edit_dictTypeDesc').val(dictTypeDesc)
            $('#edit_itemCode').val(itemCode)
            $('#edit_itemCodeDesc').val(itemCodeDesc)
            $('#edit_itemCode').attr("check-type","required")//设置为非空
            $('#edit_itemCodeDesc').attr("check-type","required")//设置为非空
            $('#edit_dictType').attr("disabled","disabled")//设置为disabled
            $('#edit_dictTypeDesc').attr("disabled","disabled")//设置为disabled
        }
        $('#dictionary_editform').validation();
    });
}

//删除
function delDictionary(id){
    $.msg.confirm(function(){
        $.post(baseURL+'/sysmgr/delDictionary',{'_csrf':token ,"id":id},function(response){
            if(response && response.success == true){
                $.msg.success("删除字典成功");
                setTimeout(function(){
                	$("#dictionary_search")[0].reset();
                    dictionary_search();
                },200);
                return false;
            }else{
                $.msg.fail("删除字典失败");
                return false;
            }
            
        },"json").error(function(){
            $.msg.fail('删除字典，请稍后再试');
        });
    })

}