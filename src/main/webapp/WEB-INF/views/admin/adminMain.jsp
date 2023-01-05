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
<title>관리자 메뉴</title>
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
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox1">
				<span class="title01">STUDY CAFE</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox1">
				<span class="title02">관리자 메뉴</span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>						
								<table border="0" cellspacing="0" cellpadding="10">
									<tr>
										<td colspan="1" align="center" class="content_text01">
											<div class="TodayTicketBuy">
												<div class="card text-bg-light mb-3" style="max-width: 18rem;">
 													 <div class="card-header">
 											 			<a href="admMemberList">회원목록&관리</a>
 											 		</div>
  													<!--  <div class="card-body">
  												  		<h5 class="card-title"></h5>
    														<p class="card-text">
    														</p>
											   		 </div> -->
												  </div>
											  </div>
										</td>
										<td align="center">
										<div class="card text-bg-secondary mb-3" style="max-width: 18rem;">
  											<div class="card-header">
  												<a href="admCheckSales">매출조회&현황</a>
  											</div>
  												<!-- <div class="card-body">
   												   <h5 class="card-title"></h5>
    												<p class="card-text"></p>
 												 </div> -->
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