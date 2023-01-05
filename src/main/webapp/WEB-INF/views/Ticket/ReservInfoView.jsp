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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
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
											<td><span class="content_text01">예약 번호: </span></td>
											<td>${sDto.tempUsingNo}</td>
									</tr>
									<tr>
											<td><span class="content_text01">예약중인 날짜: </span></td>
											<td>${year}년${month}월${day}일</td>
									</tr>
									<tr>
											<td><span class="content_text01">예약중인 좌석: </span></td>
											<td>${sDto.seatNo}번좌석</td>
									</tr>
									<tr>
											<td><span class="content_text01">예약 시간: </span></td>
											<td>${sDto.startTime}:00 ~ ${sDto.endTime}:00</td>
									</tr>
									<tr>
										<td>
											<input class="button_type01" type="button" value="예약 취소" onclick="script:window.location='cancelReserv?tempUsingNo=${sDto.tempUsingNo}&seatNo=${sDto.seatNo}&selectedDate=${selectedDate}'">
										</td>
										<td>
											<input class="button_type01" type="button" value="좌석 변경" onclick="script:window.location='changeDateSeat'">	
										</td>
									</tr>
		</table>
		
		</center>
		</td>
		</tr>
		</table>
		</center>
		</td>
		</tr>
		</table>
		</center>
		
		
	
<%@ include file="../include/footer.jsp" %>
</body>
</html>