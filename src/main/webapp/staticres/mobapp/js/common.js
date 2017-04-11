
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


function getEvent(){
    if(window.event)    {return window.event;}
    func=getEvent.caller;
    while(func!=null){
        var arg0=func.arguments[0];
        if(arg0){
            if((arg0.constructor==Event || arg0.constructor ==MouseEvent
                || arg0.constructor==KeyboardEvent)
                ||(typeof(arg0)=="object" && arg0.preventDefault
                && arg0.stopPropagation)){
                return arg0;
            }
        }
        func=func.caller;
    }
    return null;
}
//阻止事件冒泡
function stopEvent(){
    try{
        (window.event.cancelBubble = true)
    }catch(e){
        getEvent().stopPropagation()
    }
}