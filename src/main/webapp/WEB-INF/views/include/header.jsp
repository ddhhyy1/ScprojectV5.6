<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hyperlink.css">
<title>header</title>
</head>
<body>
	<% 
		String sessionId = (String) session.getAttribute("userId");
		//로그인중이라면 로그인한 아이디가 저장되고 비로그인 중이면 sessionId==null 임
	%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr class="headline01">
			<td width="5%"  class="menu01"><a href="index">StudyCafe</a></td>
			<td width="40%" class="menu01">&nbsp;</td>
			<td width="5%" class="menu01">
			<% 
				if(sessionId == null) { 
			%>
        		&nbsp;
        	<% 
        		} else if(sessionId != null && sessionId.equals("admin")) { 
        	%>
        		<a href="adminMain">관리자</a>
        	<% 
        		} 
        	%>
        	</td>
			<td width="5%" class="menu01">
			<% 
				if(sessionId == null) { 
			%>
        		<a href="memberLogin">로그인</a>
        	<% 
        		} else { 
        	%>
        		<a href="logout">로그아웃</a>
        	<% 
        		} 
        	%>
        	</td>
			<td width="5%" class="menu01">
			<%
				if(sessionId == null) {
			%>
				<a href="memberJoin">회원가입</a>
			<%
				} else {	
			%>
				<a href="memberInfo">내 정보</a>
			<% 
				} 
			%>	
			</td>
			
			<%
				if(sessionId == null) {
			%>
				
			<%
				} else {	
			%>
				<td width="5%" class="menu01"><a href="memberInfo">예약정보</a>	</td>
			<% 
				} 
			%>	
		
			
			
			<td width="5%" class="menu01"><a href="TicketPrice">이용금액</a></td>
			<td width="7%" class="menu01"><a href="ChooseTicket">이용권구매</a></td>
			<td width="5%" class="menu01">문의Q&A</td>
			
			<td width="2%">&nbsp;</td>
		</tr>
		
	</table>
</body>
</html>