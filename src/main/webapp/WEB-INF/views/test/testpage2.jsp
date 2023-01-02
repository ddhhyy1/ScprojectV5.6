<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 콤보박스 체인지에 관해 변화 이벤트 -->


</script>

</head>
<body>



									<tr>
										<td class="skillbox" >8:00 ~ 9:00</td>
										<c:forEach begin="0" end="9" step="1" var="s">
											
												<c:choose>
												<c:when test="${test[s] ne '1'}"> 
     													<td class="skillbox" >예약 가능</td>
														<td class="skillbox" >
														<label><input type="checkbox" name="selectedTime" value="0"></label>
													</c:when>
													<c:otherwise>
														<td class="skillbox" >이미 예약됨</td>
														<td class="skillbox" >
										
													</c:otherwise>
												</c:choose>
										
										</c:forEach>
										
										</td>
										<td rowspan="16" class="picbox">
									<br>
									<hr>
									</td>
									</tr>
									<c:forEach begin="9" end="23" step="1" var="l" >
												<tr>
													<td class="skillbox" >${l}:00 ~ ${l+1}:00</td>
													<td class="skillbox" >사용&예약 가능</td>
													<td class="skillbox" >
													<label><input type="checkbox" name="selectedTime" value="${l-8}"></label>		 					 				
													</td>
												</tr>
									</c:forEach>
							 			<c:choose>
													<c:when test="${test[s]==0}"> 
     													<td class="skillbox" >예약 가능</td>
														<td class="skillbox" >
														<label><input type="checkbox" name="selectedTime" value="0"></label>
													</c:when>
													<c:otherwise>
														<td class="skillbox" >이미 예약됨</td>
														<td class="skillbox" >
										
													</c:otherwise>
													
										</c:choose>	 
</body>
</html>