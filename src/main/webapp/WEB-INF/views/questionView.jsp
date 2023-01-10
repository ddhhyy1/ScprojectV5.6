<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/board.js"></script>
<title>내 질문</title>
</head>
<body>	
	<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox1">
				<span class="title01">STUDY CAFE</span>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" class="content_text01"><font size="6">
				내 질문
			</font></td>
		</tr>
		<tr>
			<td colspan="2" align="center" class="content_text01">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					
					<tr class="contentbox">
						<td class="content">
								<center>					
							<table border="0" cellspacing="0" cellpadding="10">
								
								<form action="questionModify" method="post" name="board_frm">
									<input type="hidden" value="${qdto.bnum }" name="bnum">
									
									<table border="0" cellspacing="0" cellpadding="10">
										
									<tr>
										
										<td>
										  <div class="input-box">
                							<input class="input_type01" type="text" name="btitle" value="${qdto.btitle }" readonly="readonly">
                								<label for="btitle"></label>
            								</div>
										</td>
									</tr>
										
									<tr>
										 
										<td>
										
										<textarea class="textarea_a1" rows="10" cols="50" name="bcontent" readonly="readonly">${qdto.bcontent }</textarea>
										
											
										</td>
									</tr>	
										
									</table>	
									<table border="0" cellspacing="0" cellpadding="10">												
									<tr>
										<td><span class="content_text01">아 이 디 : </span></td>
										<td><input class="input_type01" type="text" name="buserid" value="${qdto.buserid }" readonly="readonly"></td>
									</tr>
									<tr>
										<td><span class="content_text01">등 록 일 : </span></td>
										<td><input class="input_type01" type="text" name="bdate" value="${qdto.bdate }" readonly="readonly"></td>
									</tr>
									<tr>
										<td colspan="2">
										
										<%
											String boardId = (String) request.getAttribute("buserid");
											if((sessionId != null ) && (sessionId.equals(boardId))) {
										%>
											<input class="button_type01" type="submit" value="수정">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="삭제" onclick="script:window.location='questionDelete?bnum=${qdto.bnum}'">
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
										<%
											} else {
										%>
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
										<%
											}
										%>
										</td>
									</tr>
									</table>
								</form>
								
								</table>
								</center>
			
			<tr>
									<td colspan="2" align="center" class="content_text01">
										&nbsp;
									</td>
									</tr>					
	<center>	
		<table>
        	<form action="replyOk" method="post" name="reply_frm">
        <input type="hidden" name="bnum" value="${qdto.bnum }">
									<tr>
										<td><span class="content_text01">댓 글 :  </span></td>
										<td><input class="input_type01" type="text" name="rcontent"></td>
									</tr>	
									
									<tr>
										<td colspan="2">
										&nbsp;
											<center>
											
											<input class="button_type01" type="button" value="댓글등록" onclick="replyCheck()">
											</center>
										</td>
									</tr>
						</form>
									</table>
       <tr>
									<td colspan="2" align="center" class="content_text01">
										&nbsp;
									</td>
									</tr>	
										
        
		<table class= "reply" border="0" cellpadding="0" cellspacing="0" width="750">
        	<c:forEach items="${replylist }" var="replyDtoa">
        	
        	<tr>
        		<td class = "reply2" width="100">
					 			
        		</td>
        		<td class = "reply2" width=550>
        			<font size ="6">${replyDtoa.rid } </font>&nbsp; &nbsp; &nbsp;
        			${replyDtoa.rdate } <br><br>
        			<font size ="4">${replyDtoa.rcontent }</font>
        		</td>
        		<td class = "reply2">
        			<a href="replyDelete?rnum=${replyDtoa.rnum }&bnum=${qdto.bnum }">삭제</a>
        		</td>
        		<tr>
									<td colspan="2" align="center" class="content_text01">
										&nbsp;
									</td>
									</tr>	
        	</tr>
        	</c:forEach>
        	</table>
        	<tr>
			<td colspan="2" align="center" class="content_text01">
				&nbsp;
			</td>
			</tr>
			<tr>
			<td colspan="2" align="center" class="content_text01">
				&nbsp;
			</td>
		</tr>
        
        
								</center>
	<%@ include file="include/footer.jsp" %>
</body>
</html>