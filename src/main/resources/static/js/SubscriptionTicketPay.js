/**
 * 
 */
 
 function payingCheck() {
		 
		 var loginForm = document.join_frm;
            var sticketName = loginForm.sticketName.value;
            
            if(!sticketName){
                alert("요금제를 선택해주세요!");
                return;
			}

	
	
	
	if(document.join_frm.afterPayingPoint.value < 0){
		alert("보유 포인트가 적습니다. 충전해주세요!");
		return;
	}
	
	 
    
	alert("시간권 구매가 완료되었습니다. 좌석 예약으로 넘어갑니다");
	
	document.join_frm.submit();
	
}