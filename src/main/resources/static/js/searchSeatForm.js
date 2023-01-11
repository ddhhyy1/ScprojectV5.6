 /**
 * 
 */
 
 
 
 
 function seatCheckOk() {
	

	if(document.searchSeatForm.selectedDate.value.length == 0){
		alert("날짜를 선택해주세요!");
		return;
	}
	
	if(document.searchSeatForm.seatNo.value.length == 0){
		alert("좌석을 선택해주세요!");
		return;
	}
	
	
	document.searchSeatForm.submit();
	
}