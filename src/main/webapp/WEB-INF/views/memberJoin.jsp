<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-3.4.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/join.js"></script>

<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<%@ include file="include/header.jsp" %>
<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox1">
				<span class="title01"><img src="${pageContext.request.contextPath} /resources/img/book.png" >STUDY CAFE</span>
			</td>
		</tr>
		
		<tr>
			<td>
				<center>
				<table width="90%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>
												
							<table border="0" cellspacing="0" cellpadding="10">
							<form action="JoinOk" method="post" name= "join_frm">					
									<tr>
										<td colspan="2" align="center" class="content_text01"><font size="6">
										회원가입
										</font></td>
									</tr>
									<tr>
									<td colspan="2" align="center" class="content_text01">
										&nbsp;
										</td>
									</tr>
									<tr>
										<td>
										
										  <div class="input-box">
										  <input id="username" type="text" name="userId" placeholder="아이디">
										  <label for="userId">아이디</label>
										  </div>
					
										</td>
									</tr>
									
									
									<tr>
										<td>
										  <div class="input-box">
										  <input id="password" type="password" name="userPw" placeholder="비밀번호">
										  <label for="userPw">비밀번호</label>
										  </div>
										</td>
									</tr>
									
									<tr>
										<td>
										  <div class="input-box">
										  <input id="password" type="password" name="userPw_check" placeholder="비밀번호">
										  <label for="userPw_check">비밀번호체크</label>
										  </div>
										</td>
									</tr>
									<tr>
										<td>
										  <div class="input-box">
										  <input id="Name" type="text" name="userName" placeholder="이름">
										  <label for="userName">이름</label>
										  </div>
										</td>
									</tr>
									<tr>
										<td>
										  <div class="input-box">
										  <input id="phone" type="text" name="userPhone" placeholder="전화번호">
										  <label for="userPhone">전화번호</label>
										  </div>
										</td>
									</tr>
									<tr>
										<td>
										  <div class="input-box">
										  <input id="email" type="text" name="userEmail" placeholder="이메일">
										  <label for="userEmail">이메일</label>
										  </div>
										</td>
									</tr>
									<input type="hidden" name = "userPoint" value="200000">
									<input type="hidden" name = "usingTicket" value="0">
									<tr>
										<td colspan="">
			
											<input class="button_type01" type="button" value="회원가입" onclick="joinCheck()">&nbsp;&nbsp;
										</td>
	
									</tr>
		</form>
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
		
	
<%@ include file="include/footer.jsp" %>
</body>
</html>