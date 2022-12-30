/**
 * 
 */
 
 function payingCheck() {
	
	if(document.join_frm.sticketName.value == 0){
		alert("요금제를 선택해주세요!");
		return;
	}
	
	if(document.join_frm.afterPayingPoint.value < 0){
		alert("보유 포인트가 적습니다. 충전해주세요!");
		return;
	}
	
	
	document.join_frm.submit();
	
}