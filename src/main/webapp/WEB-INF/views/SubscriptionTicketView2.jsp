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
<title>당일권 사용&예약등록</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
<%
  //주소창에서 입력한 값들 저장
 String selectedDate=request.getParameter("selectedDate");
 String seatNo=request.getParameter("seatNo");
%>
	<center>
	<form action="registsTicketConfirm">
	<table width="1000" border="0" cellspacing="0" cellpadding="20">
		
		<input type="hidden" name = "selectedDate" value="<%=selectedDate%>">
		<input type="hidden" name = "seatNo" value="<%=seatNo%>">
		<tr>
			<td class="titlebox">
				<h1>시간권_예약하기</h1>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02">회원아이디:</span>
				<span class="title02"><%= sessionId %></span>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02">이용날짜:
				${selectedDate}
				</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02">좌석지정:
  					${seatNo}
				</span>
			</td>
		
		</tr>
		
		<tr>
			<td>
				<center>
					<div class="row">
						<table id="example-table-1" border="1" cellspacing="1" cellpadding="10"
						>
							<thead>
									<tr>
										<th>시간</th>
										<th>${seatNo}번 좌석현황</th>
										<th>시간지정</th>
									
									</tr>
							</thead>
							<tbody>
									<tr>
										<td class="skillbox" >8:00 ~ 9:00</td>
     													<td class="skillbox" >예약 가능</td>
														<td class="skillbox" >
														<label><input type="checkbox" name="selectedTime" value="0"></label>			
														
									</tr>
									<c:forEach begin="9" end="23" step="1" var="l" >
												<tr>
													<td class="skillbox" >${l}:00 ~ ${l+1}:00</td>
													<td class="skillbox" > 예약 가능</td>
													<td class="skillbox" >
													<label><input type="checkbox" name="selectedTime" value="${l-8}"></label>		 					 				
													</td>
												</tr>
										</c:forEach>
							
							
									
							</tbody>
				</table>
						
							<%-- <tr>
								<td class="titlebox">
									<span class="title02">시작시간 지정:
										<select name="selectTime2" >
   						 				<option value="none" name="startTIME">=== 선택 ===</option>
   						 					<c:forEach begin="8" end="23" step="1" var="t">
    					 						<option name="selectTime1" value="a${t}">${t}:00 ~ ${t+1}:00</option>
    									 	</c:forEach>
 					 				</select>
										
									</span>
									</td>
							</tr> --%>
							<tr>
										<td colspan="3">
											
											<input class="button_type01" type="submit" value="예약하기">
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
	<%@ include file="include/footer.jsp" %>
	
</body>
</html>