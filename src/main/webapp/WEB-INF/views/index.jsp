<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>스터디 카페</title>
    <link rel="stylesheet" href="/resources/css/slide.css" />
  </head>
<body>
<%@ include file="include/header.jsp" %>
<div class="slide slide_wrap">
      <div class="slide_item item1"></div>
      <div class="slide_item item2"></div>
      <div class="slide_item item3"></div>
      <div class="slide_item item4"></div>
      <div class="slide_prev_button slide_button">◀</div>
      <div class="slide_next_button slide_button">▶</div>
      <ul class="slide_pagination"></ul>
</div>
<div class="W100">
	<div class="section">
		<div class="lndTxt wow fadeInUp">
			<div class="lndTxtPadding1">
				<div class='my-div'>
	  				STUDY CAFE
				</div>
			<table width=100%>
   
   				<tr>
      				<td width=50%>
						<div style = "float:right;">
							<ul>
								<li><img src="/resources/img/c7.jPG"); class="cp"></li>
							</ul>
						</div>
      				</td>
      				<td width=50%>
						<div class="imgBox2">
							<ul>
								<li><img src="/resources/img/c6.PNG"); class="cp"></li>
							</ul>
						</div>
      				</td>
				</tr>
				<tr>
      				<td width=50%>
						<div style = "float:right;">
							<ul>
								<li><img src="/resources/img/c8.jpg"); class="cp"></li>
							</ul>
						</div>
      				</td>
      				<td width=50%>
						<div class="imgBox2">
							<ul>
								<li><img src="/resources/img/c9.jpg"); class="cp"></li>
							</ul>
						</div>
      				</td>
				</tr>
				<tr>
					<td>
				
					</td>
				</tr>
			</table>
								
				
				
			</div>
		</div>
	</div>				
</div>
    <script src="/resources/js/slides.js"></script>

<%@ include file="include/footer.jsp" %>
</body>
</html>