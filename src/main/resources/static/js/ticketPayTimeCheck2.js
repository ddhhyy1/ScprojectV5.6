/**
 * 
 */
 
   function timeCheckOk2() {
      
var count = 0; 
var check_length = document.getElementsByName('selectedTime').length; 
for (var i = 0; i < check_length; i++) {    // 관심분야 검사 
  if (document.getElementsByName('selectedTime')[i].checked == true) { 
    count = count+1; 
    console.log(count);   
  } 
} 
if (count == 0) {  //관심분야 확인 
  alert("원하시는 시간을 지정해주세요!"); 
  return false; 
} 


 document.timeCheckOk.submit();

}