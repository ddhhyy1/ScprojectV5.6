<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath} /resources/css/timer.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath} /resources/css/adminMain.css">
<meta charset="UTF-8">
<title>관리자 메뉴</title>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox1">
				<span class="title01"><img src="${pageContext.request.contextPath} /resources/img/book.png" >STUDY CAFE</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox1">
				<h1 class="display-6">관리자 메뉴</h1>
			</td>
		</tr>
		<tr>
			<td>
				<center>
					<table width="80%" border="0" cellspacing="0" cellpadding="10">
						
  					
							<div style="position: relative;">
    							<!-- 배경에 쓰일 이미지 URL 지정-->
   								 <img src="${pageContext.request.contextPath} /resources/img/data.jpg" width="100%" height="700px" style="border: 1px solid black">
 								<tr>
  									<td class="tdMainContent">
  								 		<div class="mainContent2">
  								 			<div class="card text-bg-secondary mb-3" style="max-width: 18rem;">
 												<div class="card-header">
 											 		<a href="admMemberList">회원목록&관리</a>
 											 	</div>
  								  			</div>
  									</td>
  									<td class="tdMainContent">
  								 		<div class="mainContent">
  								  			<div class="card text-bg-light mb-3" style="max-width: 18rem;">
  												<div class="card-header">
  													<a href="admCheckSales">매출조회&현황</a>
  												</div> 							
  								 			 </div>
  									</td>
  									<td class="tdMainContent">
  								 		<div class="mainContent3">
  								  			<div class="card text-bg-light mb-3" style="max-width: 18rem;">
  												<div class="card-header" style="background-color: #999999;">
  													<a href="admReservList">예약목록&현황</a>
  												</div> 							
  								 			 </div>
  									</td>
  								<tr>  
							</div>
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