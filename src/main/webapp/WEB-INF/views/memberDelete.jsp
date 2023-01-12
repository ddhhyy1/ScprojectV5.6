<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">

<title>회원 탈퇴</title>
</head>
<body>
<%@ include file="include/header.jsp" %>

<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<div class="card text-bg-dark">
           <img src="${pageContext.request.contextPath} /resources/img/03.PNG" class="card-img" alt="...">
        <div class="card-img-overlay">
             <h1 class="card-title">STUDY CAFE</h1>
          <p class="card-text">This is made by Nangcho_Team</p>   
        </div>
      </div>
		<tr>
			<td colspan="2" align="center" class="content_text01"><font size="6" style="font-weight:bold">
				회원탈퇴
			</font></td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="90%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content2">
							<center>	
							<form action="memberDeleteOk" method = "post" >					
							<table border="0" cellspacing="0" cellpadding="10">
						
									
									<tr>
									<td colspan="2" align="center" class="content_text01">
										&nbsp;
										</td>
									</tr>
									
							
									
									<tr>
										<td><span class="content_text01">비밀번호확인 </span></td>
										<td><input class="input_type01" type="password" name="userPw" ></td>
									</tr>
									
									<td>
									</td>
									
									<tr>
										<td colspan="2">
											
											<input class="button_type01" type="submit" value="회원탈퇴" >&nbsp;&nbsp;
											<input class="button_type01" type="button" value="취소" onclick="script:window.location='index'">
										</td>
									</tr>
								
							
	
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