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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/board.js"></script>
<title>질문하기</title>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox1">
				<span class="title01">STUDY CAFE</span>
			</td>
		</tr>
		
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content">
							<center>						
							<table width="75%" border="0" cellspacing="0" cellpadding="20">
								<form action="questionOk" method="post" name="board_frm">
								
									<tr>
										<td colspan="0" align="center" class="content_text01"><font size="6">
										질문하기 
										</font></td>
									</tr>
									
									<tr>
										
										<td><input class="input_type01" type="hidden" name="buserid" value="${userId }" readonly="readonly"></td>
									</tr>
								</table>
									
									<table border="0" cellspacing="0" cellpadding="10">
										<center>
									<tr>
										
										<td>
										  <div class="input-box">
                							<input type="text" name="btitle" placeholder="제목">
                								<label for="btitle">제목</label>
            								</div>
										</td>
									</tr>
									
									<tr>
										 
										<td>
										
										<textarea class="textarea_a1" style = "opacity:0.7" rows="10" cols="30" name="bcontent" placeholder="질문내용"></textarea>
										
											
										</td>
									</tr>									
									
									
									<tr>
										<td colspan="2">
											<input class="button_type01" type="button" value="질문하기" onclick="boardCheck()">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
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