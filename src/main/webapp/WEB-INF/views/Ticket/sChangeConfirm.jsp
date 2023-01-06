<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<meta charset="UTF-8">
<title>예약변경 확인 후 결제</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<%-- <%@ String[] selectedTimes=request.getParameterValues("selectedTime"); %> --%>
<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox1">
				<span class="title01">STUDY CAFE</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox1">
				<span class="title02">예약변경 확인 후 결제</span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<form action="sChangeTimeComplete">
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>						
							<table border="0" cellspacing="0" cellpadding="10">
									<tr>
										<td colspan="2" align="center" class="content_text01">
										변경 상품 정보
										</td>
									</tr>
									<tr>
										<td><span class="content_text01">아 이 디 : </span>
										&nbsp;&nbsp;<%= sessionId %>
										
										</td>
									</tr>
									<tr>
										<td><span class="content_text01">이용날짜 : </span>
										&nbsp;&nbsp;${sDto.selectedDate} > ${selectedDate}
										
										</td>
									</tr>
									
									<tr>
										<td><span class="content_text01">지정좌석 : </span>
										&nbsp;&nbsp;${sDto.seatNo}번 좌석 > ${seatNo}번 좌석
										
										</td>
									</tr>
									<tr>
										<td><span class="content_text01">이용시간 : </span>
										&nbsp;&nbsp;${sDto.ticketName}시간 > ${ticketName}시간
										
										</td>
									</tr>
										<tr>
										<td><span class="content_text01">지정한 시간대 : </span>
										&nbsp;&nbsp;
										
										</td>
									</tr>
										</tr>
										<tr>
										<td>
										${sDto.startTime}:00 ~ ${sDto.endTime}:00	> ${startTime}:00 ~ ${endTime}:00
										</td>
										</tr>
										<c:choose>
													<c:when test="${result > 0}">
														<tr class="seatTblTr">
															<td><span class="content_text01">환불될 시간 : ${changeTime} 시간</span>
											 				</td>
											 			</tr>
											 				<tr class="seatTblTrReserved">
															<td><span class="content_text01">변경 후 보유시간 : ${finalTime}</span>
											 				</td>	
														</tr>
													 </c:when>
													 <c:when test="${result == 0}">
														<tr class="seatTblTr">
															<td><span class="content_text01">시간 변동 없음</span>
															</td>
											 			</tr>
													 </c:when>
													 <c:otherwise>
											 			<tr class="seatTblTrReserved">
															<td><span class="content_text01">추가 결제시간 : ${changeTime} 시간</span>
											 				</td>	
														</tr>
														<tr class="seatTblTrReserved">
															<td><span class="content_text01">변경 후 보유시간 : ${finalTime}</span>
											 				</td>	
														</tr>
													</c:otherwise>
										</c:choose>	
										</tr>											
										</td>
									</tr>
									<input type="hidden" name = "userId" value="<%= sessionId %>">
									<input type="hidden" name = "selectedDate" value="${selectedDate}">
									<input type="hidden" name = "seatNo" value="${seatNo}">
									<input type="hidden" name = "ticketName" value="${ticketName}">
									<input type="hidden" name = "PayingPoint" value="${PayingPoint}">
									<input type="hidden" name = "selectedTime" value="${selectedTime}">
									<input type="hidden" name = "startTime" value="${startTime}">
									<input type="hidden" name = "endTime" value="${endTime}">
									<input type="hidden" name = "finalTime" value="${finalTime}">
									<input type="hidden" name = "tempNo" value="${tempNo}">
									
									<tr>
										<td colspan="2">
											<input class="button_type01" type="submit" value="변경 완료" >&nbsp;&nbsp;
											<input class="button_type01" type="button" value="뒤로" onclick="window.history.back() ">
										</td>
									</tr>
												
							</table>
							</form>
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