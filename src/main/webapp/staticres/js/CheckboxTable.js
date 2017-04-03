function CheckboxTable($target) {
    this.data = $target.data;
    this.typeRow = $target.typeRow;
    this.colsCount = $target.colsCount;
    this.checkboxValue = $target.checkboxValue;
    this.checkboxName = $target.checkboxName;
    this.modelTrStyle = $target.modelTrStyle;
    this.deatailTrClass = $target.deatailTrClass;
    this.afterrender = $target.afterrender;
    
    /* add propperty */
    this.controlName = $target.controlName; //ID值
    this.currentPage = $target.controlName; //当前页数
    this.pageMax = $target.pageMax; //一页中可输出的最大数量

    CheckboxTable.prototype.createTable = function ($divTarget) {
        var modelName = "";
        var tableHtml = "<table width='100%'><tbody>";
        var tempIndex = 0;
        var modelIndex = 0;
        if (this.typeRow == undefined)
            modelName = "全部";
        else
            modelName = "其它";
        tableHtml += "<tr><td class='" + this.modelTrStyle + "' colspan='" + this.colsCount + "'><input type='checkbox' name='modelNames' value='model_" + modelIndex + "' ><b>" + modelName + "</b></input></td></tr>";
        for (var i = 0; i < this.data.length; i++) {
            var content = this.data[i];
            if (this.typeRow != undefined) {
                if (content[this.typeRow] == "")
                    content[this.typeRow] = "其它";
                if (modelName != content[this.typeRow]) {
                    if (tempIndex % this.colsCount != 0) {
                        for (var tdIndex = 0; tdIndex < this.colsCount - (tempIndex % this.colsCount); tdIndex++) {
                            tableHtml += "<td></td>";
                        }
                    }
                    modelName = content[this.typeRow];
                    tempIndex = 0;
                    modelIndex++;
                    tableHtml += "<tr><td class='" + this.modelTrStyle + "' colspan='" + this.colsCount + "'><input type='checkbox' name='modelNames' value='" + "model_" + modelIndex + "'><b>" + content[this.typeRow] + "</b></input></td></tr>";
                }
            }
            if (tempIndex % this.colsCount == 0)
                tableHtml += "</tr><tr class='"+this.deatailTrClass+"'>";
            if(this.controlName == "" || this.controlName == null) {
            	tableHtml += "<td><input type='checkbox' name='model_" + modelIndex + "_Ids' value='" + content[this.checkboxValue] + "'>" + content[this.checkboxName] + "</input></td>";
            }
            else {
            	tableHtml += "<td><input type='checkbox' name='" + this.controlName + "' value='" + content[this.checkboxValue] + "'>" + content[this.checkboxName] + "</input></td>";
            }
            
            tempIndex++;
        }
        tableHtml += "</tbody></table>";
        $("#" + $divTarget).html(tableHtml);
        
        if(this.controlName == "" || this.controlName == null) {
        	$("[name=modelNames]").click(function () {
                if ($(this).prop('checked')) {
                    $('[name=' + $(this).val() + '_Ids]').prop('checked', true);
                } else {
                    $('[name=' + $(this).val() + '_Ids]').prop('checked', false);
                }
            });
        }
        else { 
        	var name = this.controlName;
        	$("[name=modelNames]").click(function () {
        		if ($(this).prop('checked')) {
                    $('[name='+name+']').prop('checked', true);
                } else {
                    $('[name='+name+']').prop('checked', false);
                }
        	});
        }
        
        this.afterrender&& this.afterrender.call();
       // _resetFrameHeight();
    }
}