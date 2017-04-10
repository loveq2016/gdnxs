
function initAreaCity(a){
    for(var key in areaJson){
        $("#"+a).append("<option value='"+key+"'>"+key+"</option>")
    }
    $("#"+a).trigger("change")
}


function chageAreaCity(a,b){
    var val =  $("#"+a).val();
    for(var key in areaJson){
        if(key == val){
            $("#"+b).empty();
            for(var i=0;i<areaJson[key].length;i++){
                $("#"+b).append("<option value='"+areaJson[key][i]+"'>"+areaJson[key][i]+"</option>")
            }
        }

    }
}

