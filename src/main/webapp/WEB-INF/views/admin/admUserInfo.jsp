<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/join.js"></script>
<title>관리자-유저정보조회</title>
<script type="text/javascript"> 
  function btn(){  
     alert(변경 완료!); 
  } 
 </script>
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
		<form action="admUserEdit">
		<tr>
			<td>
				<center>
				<table width="90%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>						
							<table border="0" cellspacing="0" cellpadding="10">
									<tr>
										<td colspan="2" align="center" class="content_text01">
										회원 정보 
										</td>
									</tr>
									<tr>
									<td colspan="2" align="center" class="content_text01">
										&nbsp;
										</td>
									</tr>
									<tr>
										<td><span class="content_text01">회원 아이디 : </span></td>
										<td>${memberDto.userId}</td>
									
							
									<tr>
										<td><span class="content_text01">이&nbsp;&nbsp;&nbsp;&nbsp;름 : </span></td>
										<td>${memberDto.userName }</td>
									</tr>
									<tr>
										<td><span class="content_text01">전화번호 : </span></td>
										<td>${memberDto.userPhone }</td>
									</tr>
									<tr>
										<td><span class="content_text01">이 메 일 : </span></td>
										<td>${memberDto.userEmail }</td>
									</tr>
									
									<tr>
										<td><span class="content_text01">잔여포인트 : </span></td>
										<td>
										<input type="text" name="userPoint" value="${memberDto.userPoint}">
										</td>
									</tr>
									<tr>
										<td><span class="content_text01">이용중인 상품: </span></td>
										<td>
										<input type="text" name="usingTicket" value="${memberDto.usingTicket}">
										</td>
									</tr>
										<input type="hidden" name = "userId" value="${memberDto.userId}">
										<input type="hidden" name = "userPoint" value="${memberDto.userPoint}">
										<input type="hidden" name = "usingTicket" value="${memberDto.usingTicket}">
									<tr>
										<td colspan="2">
											<input  class="button_type01" type="submit" value="회원 수정">					
											<input class="button_type01" type="button" value="회원 강퇴"
											 onclick="script:window.location='admMemberKick?userId=${memberDto.userId}'">
											<input class="button_type01" type="button" value="뒤로" onclick="window.history.back() ">
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
		
		
	
<%@ include file="../include/footer.jsp" %>
</body>
</html>