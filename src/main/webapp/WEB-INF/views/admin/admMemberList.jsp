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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/seatTable.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<!-- jQuery  -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>   
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">


		
</script>


<meta charset="UTF-8">
<title>회원 목록 및 관리</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<%
  //주소창에서 입력한 값들 저장
 String selectedDate=request.getParameter("selectedDate");
 String seatNo=request.getParameter("seatNo");
%>
	<center>
	<form >
	<table width="50%" border="0" cellspacing="0" cellpadding="20">
		<input type="hidden" name = "userId" value="">

		<tr>
			<td class="titlebox">
				<h1>회원목록</h1>
			</td>
			<tr height="150">
			&nbsp;
			</tr>
				<center>
					<div>
						<table class="innerTable" border="1" cellspacing="1" cellpadding="10">
							<thead class="seatTblThead">
									<tr class="seatTblTr">
										<th class="seatTblTh">아이디</th>
										<th class="seatTblTh">이름</th>
										<th class="seatTblTh">전화번호</th>
										<th class="seatTblTh">이메일</th>
										<th class="seatTblTh">잔여포인트</th>
										<th class="seatTblTh">이용권</th>
										
									</tr>
							</thead>
							<tbody class="seatTblBody">
								<c:forEach items="${memberDto}" var="Dto">									
									<tr>
									<td class="skillbox" >
									<a href="admUserInfo?userId=${Dto.userId}">
									${Dto.userId}</a></td>
									<td class="skillbox" >${Dto.userName}</td>
									<td class="skillbox" >${Dto.userPhone}</td>
									<td class="skillbox" >${Dto.userEmail}</td>
									<td class="skillbox">
									${Dto.userPoint}</td>
									<td class="skillbox" >${Dto.usingTicket}</td>
									
									</tr>
								</c:forEach>
							</tbody>
					</table>
					<br>
					
					<tr>
								<td colspan="7" align="center">
									<c:if test="${pageMaker.prev}">
										<a href="admMemberList?pageNum=${pageMaker.startPage-5 }"> Prev</a>&nbsp;&nbsp;&nbsp;
									</c:if>
								 
									<c:forEach begin = "${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
									 	<c:choose>
									 	<c:when test="${currPage == num }">
									 		<u>${num}</u>&nbsp;&nbsp;&nbsp;
										</c:when>
										<c:otherwise>
											<a href="admMemberList?pageNum=${num }">${num }</a>&nbsp;&nbsp;&nbsp;
										</c:otherwise>
										
										</c:choose>
									</c:forEach>
									
									<c:if test="${pageMaker.next}">
										<a href="admMemberList?pageNum=${pageMaker.startPage+5 }"> Next </a>
									</c:if>
									
								</td>
							</tr>
							<tr height="150">
							<td>&nbsp;</td>
							</tr><br><br><br><br>
							<tr>
										<td colspan="3">
			
											<input class="button_type01" type="button" value="뒤로" onclick="window.history.back() ">
										</td>
									</tr>
				</div>
				</center>			
			</td>
		</tr>
	</table>
	
	</form>
	</center>
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>