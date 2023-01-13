<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>   
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<title>내 질문</title>
</head>
<body>	
	<%@ include file="include/header.jsp" %>
	<center>
	<table width="35%" border="0" cellspacing="0" cellpadding="20">
	<div class="card text-bg-dark">
	<img src="${pageContext.request.contextPath} /resources/img/01.PNG" class="card-img" alt="...">
        <div class="card-img-overlay">
             <h1 class="card-title">STUDY CAFE</h1>
          <p class="card-text">This is made by Nangcho_Team</p>   
        </div>
      </div>
<td class="content">
		<center>	
		<form action="questionModify" method="post" name="board_frm">
			<table class="table" width="200" text-align="center">
			<input type="hidden" value="${qdto.bnum }" name="bnum">
  				<thead>
    				<tr colspan="2">
      					<th scope="col" colspan="2"><div align="center" >
      												<h3>질문</h3></div></th>
    											</tr>
  											</thead>
  											<tbody class="table-group-divider">
  											
  											<tr>
      												<th scope="row"><span class="content_text01">제목 : </span>
													<td><span class="content_text01" name="btitle" readonly="readonly">${qdto.btitle }</span></td>
    											</tr>
    											<tr>
      												<th scope="row"> <span class="content_text01">아이디 :</span></th>
      												<td> <span class="content_text01" name="buserid" readonly="readonly">${qdto.buserid }</span></td>
  											    </tr>
    											
    											<tr>																
														<th scope="row"><span class="content_text01">작성시간 : </span></th>
														<td><span class="content_text01" name="bdate" readonly="readonly">${qdto.bdate }</span></td>
    											</tr>
    											
    											<tr>
      												
													<td><span class="content_text02" name="bcontent" readonly="readonly" font-style:solid> ${qdto.bcontent }</span></td>
    											</tr>
    											
  												</tbody>
												</table>	
												
			<tr align="center">
										<td colspan="2">
										
										<%
											String boardId = (String) request.getAttribute("buserid");
											if((sessionId != null ) && (sessionId.equals(boardId))) {
										%>
											<input class="button_type01" type="submit" value="수정">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
											<input class="button_type01" type="button" value="삭제" onclick="script:window.location='questionDelete?bnum=${qdto.bnum}'">
										<%
											} else {
										%>
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
										<%
											}
										%>
										</td>
									</tr>
								</form>
		</center>
		</td>
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
									<br><br><br>
										<td><span class="content_text01">댓 글 :  </span></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input class="input_type01" type="text" name="rcontent" ></td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><input class="btn btn-primary btn-lg" type="button" value="작성" onclick="replyCheck()"></td>
									</tr>	
									
									
						</form>
									</table>
       <tr>
									<td colspan="2" align="center" class="content_text01">
										&nbsp;
									</td>
									</tr>	
		 <br><br><br><br>								
        
		
		<div>

        	<c:forEach items="${replylist }" var="replyDtoa">
        	<font size ="6" >${replyDtoa.rid } </font>&nbsp; &nbsp; &nbsp;
        			${replyDtoa.rdate } &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<br><br>
        <div class ="x" >
        	
        		
        		<br><br>
        	&nbsp;&nbsp;&nbsp;<font size ="5">${replyDtoa.rcontent }</font>	&nbsp;&nbsp;&nbsp;
        		<br><br><br>

        	</div>	
      			<br>
        		
        		<td class = "reply2" width="50" >
        			<a href="replyModify?rnum=${replyDtoa.rnum }&bnum=${qdto.bnum }"><b><font size ="4">수정</font></b></a>
        			&nbsp;&nbsp;&nbsp;
        			<a href="replyDelete?rnum=${replyDtoa.rnum }&bnum=${qdto.bnum }"><b><font size ="4">삭제</font></b></a> <br><br>
        		</td>
        		
									
									
        	</tr>
     
        	<br><br>
        	
        	</c:forEach>
        	</div>

      
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