/**
 * 
 */
 
 function payingCheck() {
	
	if(document.join_frm.sticketName.value.length == 1){
		alert("요금제를 선택해주세요!");
		return;
	}
	
	
	document.join_frm.submit();
	
}