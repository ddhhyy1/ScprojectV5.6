<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/seatTable.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ReservInfoList.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/join.js"></script>
<title>과거 예약목록&현황</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
	
	
	<center>
	<table width="70%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox1">
				<span class="title01"><img src="${pageContext.request.contextPath} /resources/img/book.png" >STUDY CAFE</span>
			</td>
		</tr>	
		<tr>
			<td class="titlebox">
				<h1 align="center">과거 예약목록</h1>
			</td>
			<tr height="150">
			&nbsp;
			</tr>
			<tr>
			<td>
				<center>
				<table class="table" width="80%">
				  <thead>
				    <tr>
				      <th scope="col">예약번호</th>
				      <th scope="col">좌석번호</th>
				      <th scope="col">아이디</th>
				      <th scope="col">이용시간</th>
				      <th scope="col">이용날짜</th>
				      <th scope="col">등록된날짜</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider">
				    <c:forEach items="${sDto}" var="sdto">									
						<tr class="seatTblTr">	
							<th scope="row">${sdto.reservNo}</th>
							<td>${sdto.seatNo}번</td>
							<td>${sdto.userId}</td>
							<td>${sdto.ticketName}시간</td>
							<td>${sdto.selectedDate}</td>
							<td>${sdto.reservDate}</td>
						</tr>
					</c:forEach>
				  </tbody>
				</table>
				<tr>
								<td colspan="6" align="center">
									<c:if test="${pageMaker.prev}">
										<a href="admOldReservList?pageNum=${pageMaker.startPage-5 }"> Prev</a>&nbsp;&nbsp;&nbsp;
									</c:if>
								 
									<c:forEach begin = "${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
									 	<c:choose>
									 	<c:when test="${currPage == num }">
									 		<u>${num}</u>&nbsp;&nbsp;&nbsp;
										</c:when>
										<c:otherwise>
											<a href="admOldReservList?pageNum=${num }">${num }</a>&nbsp;&nbsp;&nbsp;
										</c:otherwise>
										
										</c:choose>
									</c:forEach>
									
									<c:if test="${pageMaker.next}">
										<a href="admOldReservList?pageNum=${pageMaker.startPage+5 }"> Next </a>
									</c:if>
									
								</td>
							</tr>
							
							<tr>
								<td align="center">
									<input class="button_type01" type="button" value="뒤로" onclick="window.history.back() ">	
								</td>
							</tr>
				
				
				
				
				
				
				</td>
				</tr>
				</center>
			</table>
		</center>
				
			


<%@ include file="../include/footer.jsp" %>
</body>
</html>