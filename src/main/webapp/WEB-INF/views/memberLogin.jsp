<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
<meta charset="UTF-8">
<title>사용&예약 확인 후 결제</title>

<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
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
							
							<form action="loginOk">						
							<table border="0" cellspacing="0" cellpadding="10">
									<tr>
										<td colspan="2" align="center" class="content_text01"><font size="6">
										로그인
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
										<td><div class="input-box">
                							<input id="password" type="password" name="userPw" placeholder="비밀번호">
              									  <label for="userPw">비밀번호</label>
           									 </div>
										</td>
									</tr>
			
									
									<tr>
										<td colspan="">
											<input class="btn btn-primary btn-lg" type="submit" value="로그인">
											<a href="memberJoin"><button type ="button" class="btn btn-secondary btn-lg">회원가입</button></a>
										</td>
	
									</tr>
								<td>&nbsp;</td>			
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
	
<%@ include file="include/footer.jsp" %>
</body>
</html>