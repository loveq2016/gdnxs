/**
 * User: zjt
 * DateTime: 2016/12/19 09:41
 */
$.extend({

    /**
     * 生成内链码
     * @param option
     */
    generateInnerCode: function(option){

        var type = option.type;
        var refId = option.refId;
        var postType = option.postType;

        $.ajax({
            type: "post",
            url: baseURL + "/common/generateInnerCode?_csrf=" + token,
            data:{"type":type , "refId":refId , "postType":postType},
            dataType: "json",
            success: function (response) {
                if (response && response.success == true) {

                    var innerCode = response.result;

                    var html = "<div style='position:absolute; top:18px; left: 180px;' class='form-inline' >";
                    html += "内链码: <input type='text' class='form-control' value='"+innerCode+"' readonly id='inputInnerCode'  />";
                    html += "&nbsp;&nbsp;<button style='btn btn-defualt' id='btnCopyInnerCode' onclick='document.getElementById(\"inputInnerCode\").select(); document.execCommand(\"copy\",false,null);' >点击复制</button>";
                    html += "</div>";

                    $(".modal-header").append(html);

                }
            }
        });

    }

});

