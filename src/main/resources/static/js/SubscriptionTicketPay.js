/**
 * 
 */
 
 function payingCheck() {
		 
		 var loginForm = document.join_frm;
            var sticketName = loginForm.sticketName.value;
            
            if(!sticketName){
                alert("요금제 선택하셈!")
                return;
			}

	
	if(document.join_frm.afterPayingPoint.value < 0){
		alert("보유 포인트가 적습니다. 충전해주세요!");
		return;
	}
	
	
	document.join_frm.submit();
	
}