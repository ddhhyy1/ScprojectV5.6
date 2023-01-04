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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/join.js"></script>
<title>내 정보</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox1">
				<span class="title01">STUDY CAFE</span>
			</td>
		</tr>
		
		<tr>
			<td>
				<center>
				<table width="90%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>						
							<table border="0" cellspacing="0" cellpadding="10">
									<tr>
										<td colspan="2" align="center" class="content_text01">
										내 예약 정보 
										</td>
									</tr>
									<tr>
									<td colspan="2" align="center" class="content_text01">
										&nbsp;
										</td>
									</tr>
									<tr>
										<td><span class="content_text01">아 이 디 : </span></td>
										<td><%= sessionId %></td>		
									<tr>
										<td><span class="content_text01">보유 포인트 : </span></td>
										<td>${memberDto.userPoint}</td>
									</tr>
									<!-- 사용중인 상품에 없거나 어떤 상품이냐에 따라 표시가 다름 -->
									<c:choose>
											<c:when test="${memberDto.usingTicket==0}">
												<tr>
													<td><span class="content_text01">사용중인 상품 : </span></td>
													<td> 사용중인 상품이 없습니다.</td>
												</tr>
									
											</c:when>
											<c:when test="${memberDto.usingTicket>50}">
												<tr>
													<td><span class="content_text01">사용중인 상품 : </span></td>
													<td>시간권 ${memberDto.usingTicket}시간제 사용중</td>
												</tr>
											</c:when>
									 		<c:otherwise>
									 			<tr>
													<td><span class="content_text01">사용중인 상품 : </span></td>
													<td>당일권 사용중</td>
												</tr>
									
									 		</c:otherwise>
									</c:choose>
									
									<tr>
										<td><span class="content_text01">남아있는 시간 : </span></td>
										<td>${stDto.sremainTime}</td>
									</tr>
									</table>
							
					
					<tr>
					<td>
						<table class="innerTable" border="1" cellspacing="1" cellpadding="10" align="center">
							<thead class="seatTblThead">
									<tr class="seatTblTr">
										<th class="seatTblTh">예약번호</th>
										<th class="seatTblTh">예약날짜</th>
										<th class="seatTblTh">예약좌석</th>
										<th class="seatTblTh">예약시간</th>
									</tr>
							</thead>
							<tbody class="seatTblBody">
								<c:forEach items="${AllReservInfo}" var="Dto">									
									<tr>
									<td class="skillbox" >
									<a href="ReservInfoView?tempUsingNo=${Dto.tempUsingNo}">
									${Dto.tempUsingNo}</a></td>
									<td class="skillbox" >${Dto.selectedDate}</td>
									<td class="skillbox" >${Dto.seatNo}</td>
									<td class="skillbox" >${Dto.startTime}~ ${Dto.endTime}</td>
									</tr>
								</c:forEach>
							</tbody>
					</table>
				</tr>
				</td>					
				
		</center>
		</td>
		</tr>
		</table>
		</td>
		</tr>
		</table>
		</center>
		
		
	
<%@ include file="../include/footer.jsp" %>
</body>
</html>