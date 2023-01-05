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

  function timeCheckOk3() {
		
var count = 0; 
var check = document.getElementsByName('selectedTime'); 
for (var i = 0; i < check.length; i++) {    // 관심분야 검사 
  if (check[i].checked) { 
    count = 1; 
    break; 
  } 
} 
if (count == 0) {  //관심분야 확인 
  alert("원하시는 시간을 지정해주세요!"); 
  return false; 
 
} 
	
			
	
			document.timeCheckOk.submit();
	
}