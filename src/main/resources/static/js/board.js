 
function boardCheck() {
   
   if(document.board_frm.btitle.value.length == 0) {
      alert("제목은 필수입력 사항입니다.");
      return;
   }
   
   if(document.board_frm.bcontent.value.length == 0) {
      alert("질문은 필수입력 사항입니다.");
      return;
   }
   
   document.board_frm.submit();
} 

function replyCheck() {
   
   if(document.reply_frm.rcontent.value.length == 0) {
      alert("댓글 내용을 입력해주세요.");
      return;
   }
   
   
   
   document.reply_frm.submit();
} 