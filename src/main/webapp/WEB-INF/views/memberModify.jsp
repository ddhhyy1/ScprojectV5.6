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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/modify.js"></script>
<title>내 정보</title>
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
							<form action="memberInfo" method="post" name="modify_frm">
									<tr>
										<td colspan="2" align="center" class="content_text01"><font size="6">
										정보 수정 
										</font></td>
									</tr>
									<tr>
									<td colspan="2" align="center" class="content_text01">
										&nbsp;
										</td>
									</tr>
									<tr>
										<td><span class="content_text01">아 이 디 : </span></td>
										<td><input class="input_type01" type="text" name="userId" value="${memberDto.userId }" readonly="readonly"></td>
									</tr>
									<tr>
										<td><span class="content_text01">비밀번호 </span></td>
										<td><input class="input_type01" type="password" name="userPw"></td>
									</tr>
									<tr>
										<td><span class="content_text01">비밀번호체크 : </span></td>
										<td><input class="input_type01" type="password" name="userPw_check"></td>
									</tr>
									<tr>
										<td><span class="content_text01">이&nbsp;&nbsp;&nbsp;&nbsp;름 : </span></td>
										<td><input class="input_type01" type="text" name="userName" value="${memberDto.userName }"></td>
									</tr>
									<tr>
										<td><span class="content_text01">전화번호 : </span></td>
										<td><input class="input_type01" type="text" name="userPhone" value="${memberDto.userPhone }"></td>
									</tr>
									<tr>
										<td><span class="content_text01">이 메 일 : </span></td>
										<td><input class="input_type01" type="text" name="userEmail" value="${memberDto.userEmail }"></td>
									</tr>
									
									<tr>
										<td><span class="content_text01">잔여 포인트 : </span></td>
										<td><input class="input_type01" type="text" name="userPoint" value="${memberDto.userPoint }" readonly="readonly"></td>
									</tr>
									<tr>
										<td colspan="2">
											<input class="button_type01" type="button" value="수정완료" onclick="modifyCheck()">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="수정취소" onclick="script:window.location='index'">
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