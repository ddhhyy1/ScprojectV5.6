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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ticketPayTimeCheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ticketPayTimeCheck2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/seatTable.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>   
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">

</script>


<meta charset="UTF-8">
<title>예약시간 변경</title>

<style>
.changeTimeButton{
	left: 650px;
	position: absolute;
}

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<%
  //주소창에서 입력한 값들 저장
 String selectedDate=request.getParameter("selectedDate");
 String seatNo=request.getParameter("seatNo");
%>
	<center>
	<form action="changeConfirm" name="timeCheckOk">
		<table width="55%" border="0" cellspacing="0" cellpadding="20">
			<tr>	
				<td align="center">
				<table width="60%" height="350">
 				 <thead>
  	  				<tr>
    				  	<th scope="col" colspan="2"><div align="center"><h2>예약시간 변경</h2></div></th>
    				</tr>
  				</thead>
  				<tbody class="table-group-divider">
  				  <tr>
      					<th scope="row"><span class="title02">회원 아이디 :</span></th>
      					<td><span class="title02"><%= sessionId %></span></td>     
    			  </tr>
    			  <tr>
      					<th scope="row"><span class="title02">변경된 날짜 :</span></th>
      					<td><span class="title02">${selectedDate}</span></td>
    			  </tr>
    			  <tr>
      					<th scope="row"><span class="title02">변경된 좌석 :</span></th>
      					<td><span class="title02">${seatNo}</span></td>
        		  </tr>
    			  <tr>
      					<th scope="row"><span class="title02">기존 이용 시간 :</span></th>
     					<td>	<span class="title02">${sTime}:00 ~ ${eTime}:00 &nbsp; -- &nbsp;${tHour}시간</span> </td>
    			  </tr>
    			  <c:choose>
						<c:when test="${mDto.usingTicket >= 50}">
							<tr>
							<td>
							</td>
							</tr>
						</c:when>
						<c:otherwise>
						<tr>
								<th scope="row"><span class="title02">이용시간:</span></th>
  									<span class="title02"><td>
  									<select name="ticketName" style="font-size:20px">
   						 				<option value="none" name="usingTIME">=== 선택 ===</option>
   						 				<option value="1" selected>1시간 - 2,000p</option>
    					 				<option value="2">2시간 - 3,000p</option>
    									<option value="4">4시간 - 5,000p</option>
    								    <option value="6">6시간 - 6,000p</option>
    					 				<option value="8">8시간 - 7,000p</option>
 					 				</select>
									</span></td>
							</tr>
							</c:otherwise>
					  </c:choose>
  					</tbody>
				</table>
			<td>
		</tr>
		<tr>
			<td align="center">
				<table class="innerTable" width="70%" border="1" cellspacing="1" cellpadding="10">
										<thead class="seatTblThead">
											<tr class="seatTblTr">
												<th class="seatTblTh">시간</th>
												<th class="seatTblTh">${seatNo}번 좌석현황</th>
												<th class="seatTblTh">시간지정</th>	
											</tr>
										</thead>
										<tbody class="seatTblBody">									
									<c:forEach begin="8" end="23" step="1" var="l" >
												<c:choose>
														<c:when test="${opTimes[l-8]==0}">
															 <c:if test="${l <= rightNow}">
	            												<tr class="seatTblTr">
																<td class="seatTblTdReserved">${l}:00 ~ ${l+1}:00</td>
																<td class="seatTblTdReserved"> 예약 불가</td>
																<td class="seatTblTdReserved"></td>
												 			</tr>
														        </c:if>
														        <c:if test="${l >= rightNow}">
														           <tr class="seatTblTr">
																   <td class="seatTblTd">${l}:00 ~ ${l+1}:00</td>
																   <td class="seatTblTd"> 예약가능</td>
																   <td class="seatTblTd">
																	<label>
																		<input class=checkTime type="checkbox" name="selectedTime" value="${l-8}">
																	</label>
																   </td>
											 					   </tr>
														        </c:if>
													 </c:when>
													<c:otherwise>
														<tr class="seatTblTr">
															<td class="seatTblTdReserved">${l}:00 ~ ${l+1}:00</td>
															<td class="seatTblTdReserved"> 예약 불가</td>
															<td class="seatTblTdReserved">
																	 					 				
															</td>
											 			</tr>
													 </c:otherwise>											
												</c:choose>
									</c:forEach>
							</tbody>
									</table>
										<input type="hidden" name = "userId" value="<%= sessionId %>">
										<input type="hidden" name = "selectedDate" value="<%=selectedDate%>">
										<input type="hidden" name = "seatNo" value="<%=seatNo%>">
										<input type="hidden" name = "tempNo" value="${tempNo}">
									<tr>
										<td class="changeTimeButton" colspan="2">
									<c:choose>
										<c:when test="${mDto.usingTicket >= 50}">
											<input class="button_type01" type="button" value="다음단계로" onclick="timeCheckOk2()">
										</c:when>
										<c:otherwise>
											<input class="button_type01" type="button" value="다음단계로" onclick="timeCheckOk3()">
										</c:otherwise>
									</c:choose>
											<input class="button_type01" type="button" value="뒤로" onclick="window.history.back() ">
										</td>
									</tr>
	
	
	
		</td>
		</tr>
	
	</table>
	</form>
	</center>

<%@ include file="../include/footer.jsp" %>
</body>
</html>