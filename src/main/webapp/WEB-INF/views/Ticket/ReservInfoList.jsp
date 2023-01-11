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
<title>내 정보</title>
<style>

table{
	border-radius: 25px;
}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<center>
	<table width="90%" border="0" cellspacing="0" cellpadding="20" align="center">
		<div class="card text-bg-dark">
  			<img src="${pageContext.request.contextPath} /resources/img/Cafe4.jpg" class="card-img" alt="...">
  		<div class="card-img-overlay">
   			 <h1 class="card-title">STUDY CAFE</h1>
    		<p class="card-text">This is made by Nangcho_Team</p>   
  		</div>
		</div>
		
				<center>
				<table width="40%" border="0" cellspacing="0" cellpadding="0">
					<tr class="contentbox">
						<td class="content">
										<table class="table" width="200" text-align="center">
  											<thead>
    											<tr colspan="2">
      												<th scope="col" colspan="2"><div align="center" >
      												<h2>내 예약 정보</h2></div></th>
    											</tr>
  											</thead>
  											<tbody class="table-group-divider">
    											<tr>
      												<th scope="row">아이디 :</th>
      												<td><%= sessionId %></td>
  											    </tr>
    											<tr>
      												<th scope="row"> 보유 포인트 : </th>
     											    <td>${memberDto.userPoint}</td> 
    											</tr>
    											<tr>
    											<c:choose>
													<c:when test="${memberDto.usingTicket==0}">									
														<th scope="row">사용중인 상품 :</th>
														<td>사용중인 상품이 없습니다.</td>
													</c:when>
													<c:when test="${memberDto.usingTicket>=50}">
														<th scope="row">사용중인 상품 :</th>
														<td>시간권 ${memberDto.usingTicket}시간제 사용중</td>
													</c:when>
									 				<c:otherwise>
									 					<th scope="row">사용중인 상품 :</th>
									 					<td>당일권 사용중</td>
													</c:otherwise>
												</c:choose>
    											</tr>
    											<tr>
      												<th scope="row"> 남아있는 시간 : </th>
     											    <td>${stDto.sremainTime}</td> 
    											</tr>
  												</tbody>
												</table>
										<br>
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
													<td class="skillbox" >${Dto.seatNo}번 좌석</td>
													<td class="skillbox" >${Dto.startTime}:00 ~ ${Dto.endTime}:00
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
										<tr>
											<td><br>
											</td>
										</tr>
									<tr>
										<td align="center"><span class="content_text01">*예약정보를 변경하시려면, 해당 예약번호를 클릭해주세요!</span>
										</td>
									</tr>
		
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