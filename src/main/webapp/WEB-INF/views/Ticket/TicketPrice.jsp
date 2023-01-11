<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<meta charset="UTF-8">
<title>이용권 구매</title>
<style>
.TodayTicketBuy {
  background:#cdcdcd;
  opacity: 0.5;
}

.TodayTicketBuy {
  opacity: 1.0;
}

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<center>
	<table width="90%" border="0" cellspacing="0" cellpadding="20" align="center">
		<div class="card text-bg-dark">
  			<img src="${pageContext.request.contextPath} /resources/img/Cafe3.jpg" class="card-img" alt="...">
  		<div class="card-img-overlay">
   			 <h1 class="card-title">STUDY CAFE</h1>
    		<p class="card-text">This is made by Nangcho_Team</p>   
  		</div>
		</div>

		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>						
							<table border="0" cellspacing="0" cellpadding="10">
									<tr>
										<td colspan="2" align="center" class="content_text01">
										<img src="${pageContext.request.contextPath }/resources/img/TicketPrice.png" width="700">
										</td>
										<td>
										</td>
									</tr>
									<tr>
									<td colspan="2" align="center">
									<div class="card text-bg-light mb-3" style="max-width: 20rem;">
 													 <div class="card-header">
 											 			<a href="ChooseTicket">이용권 구매 바로가기!</a>
 											 		</div>
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