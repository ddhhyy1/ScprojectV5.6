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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ticketView.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>   
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">

	

<meta charset="UTF-8">
<title>시간권 사용&예약등록</title>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<%
  //주소창에서 입력한 값들 저장
 String selectedDate=request.getParameter("selectedDate");
 String seatNo=request.getParameter("seatNo");
%>
	<center>
	<form action="registToday" name="timeCheckOk">
	<table width="1000" border="0" cellspacing="0" cellpadding="20">
		
		
		<input type="hidden" name = "selectedDate" value="<%=selectedDate%>">
		<input type="hidden" name = "seatNo" value="<%=seatNo%>">
		<table width="35%" border="0" cellspacing="0" cellpadding="20">
	<hr>
		<div class="card border-dark mb-3" style="max-width: 50rem; height:38rem;">
  			<div class="card-header"><h1>당일권 예약</h1></div>
  				<div class="card-body text-dark">
    			<p class="card-text">
    				<div class="card">
  						<div class="card-body">	
    						<span class="upper">
    						회원아이디	: &nbsp;&nbsp;<%= sessionId %>
    						</span>
 						 </div>
					</div>
					<br>
					<div class="card">
  						<div class="card-body">	&nbsp;&nbsp;&nbsp;
    					<span class="upper">이용날짜:&nbsp;&nbsp;${selectedDate}
							</span>
 						 </div>
					</div>
					<br>
					<div class="card">
  						<div class="card-body">	
    						<span class="upper">지정좌석:&nbsp;&nbsp;${seatNo}
							</span>
 						 </div>
					</div>
					<br>
					<div class="card">
  						<div class="card-body">	
						<span class="upper" name="ticketName2">이용시간:
  							<select name="ticketName" >
   						 		<option value="none" name="usingTIME">=== 선택 ===</option>
   						 		<option value="1" selected>1시간 - 2,000p</option>
    					 		<option value="2">2시간 - 3,000p</option>
    							<option value="4">4시간 - 5,000p</option>
    							<option value="6">6시간 - 6,000p</option>
    					 		<option value="8">8시간 - 7,000p</option>
 					 		</select>
						</span>
						</div>
					</div>
    				</p>
 					</div>
					</div>
		
		
		
		<tr>
			<td>
				<center>
					<div class="row">
						<table class="innerTable" width="60%" border="1" cellspacing="1" cellpadding="10" align="center">
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
						<tr>
							<td align="center">
								<input class="button_type01" type="button" value="다음 단계로" onclick="timeCheckOk3()">&nbsp;&nbsp;
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