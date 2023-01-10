<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<tr>
									<td>
									<div class="card">
 										 <h3 class="card-header" align="center">내 예약 정보 </h3>
  											<div class="card-body">
   												<p class="card-text">
   													<div class="innerCard">아 이 디 :<%= sessionId %></div>
   													<br>		
  												 	<div class="innerCard"> 보유 포인트 : ${memberDto.userPoint}</div>
  												 	<br>
   													 <c:choose>
														<c:when test="${memberDto.usingTicket==0}">									
															<div class="innerCard">사용중인 상품 :사용중인 상품이 없습니다.</div>
														</c:when>
														<c:when test="${memberDto.usingTicket>=50}">
															<div class="innerCard">사용중인 상품 :시간권 ${memberDto.usingTicket}시간제 사용중</div>
														</c:when>
									 					<c:otherwise>
									 						<div class="innerCard">사용중인 상품 :당일권 사용중</div>
														</c:otherwise>
												</c:choose><br>
													남아있는 시간:${stDto.sremainTime}</p>
  											</div>
										</div>
									</td>
									</tr>



</body>
</html>