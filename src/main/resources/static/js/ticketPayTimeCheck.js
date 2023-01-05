/**
 * 
 */
 
 

$(function(){
    $(".checkTime").click(function(){
        var fruit = new Array();
        var i=0;
        $(".checkTime").each(function(index){
            if($(this).is(":checked")){
                fruit[i]=index;
                i++;
            }
        });
        if(fruit.length != 1){
            var temp = fruit[0];
            for(var k=1; k<fruit.length; k++){
                if(temp+k != fruit[k]){
                    alert("시간 예약은 연속으로만 가능합니다.");
                    if($(this).is(":checked"))
                        $(this).is(":checked",false);
                    else
                        $(this).is(":checked",true);
                    return false;
                }
            }
        }
    });    
});	

 
 
 function timeCheckOk() {
		 


	
	
	document.timeCheckOk.submit();
	
}