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
	<table width="90%" border="0" cellspacing="0" cellpadding="20" align="center">
		<div class="card text-bg-dark">
  			<img src="${pageContext.request.contextPath} /resources/img/Cafe2.jpg" class="card-img" alt="...">
  		<div class="card-img-overlay">
   			 <h1 class="card-title">STUDY CAFE</h1>
    		<p class="card-text">This is made by Nangcho_Team</p>   
  		</div>
		</div>
		
		
		<tr>
			<td>
				<center>
				<table width="50%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
									<div class="card">
 										 <h3 class="card-header" align="center">&nbsp;&nbsp;내 예약 정보 &nbsp;</h3>
  											<div class="card-body">
   												<p class="card-text">
   													<div class="innerCard">아 이 디 :<%= sessionId %></div>
   													<br>		
   													<span class="content_text01">예약 번호: </span>
													${sDto.tempUsingNo}<br><br>
  												 	<div class="innerCard">
  												 	예약중인 날짜: ${year}년${month}월${day}일</div>
  												 	<br>									
													<div class="innerCard">예약중인 좌석: ${sDto.seatNo}번좌석</div>
													<br>	
									 						<div class="innerCard">예약 시간: 
											${sDto.startTime}:00 ~ ${sDto.endTime}:00</div>
													
													</p>
  												</div>
											</div>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<input class="button_type01" type="button" value="예약 취소" onclick="script:window.location='cancelReserv?tempUsingNo=${sDto.tempUsingNo}&seatNo=${sDto.seatNo}&selectedDate=${selectedDate}'">
											&nbsp;&nbsp;&nbsp;
										<input class="button_type01" type="button" value="좌석 변경" onclick="script:window.location='changeDateSeat?tempUsingNo=${sDto.tempUsingNo}'">	
										</td>
											
									</tr>
	
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