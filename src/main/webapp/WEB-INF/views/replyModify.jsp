<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
<title>질문 수정</title>
</head>
<body>	
	<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<div class="card text-bg-dark">
           <img src="${pageContext.request.contextPath} /resources/img/06.PNG" class="card-img" alt="...">
        <div class="card-img-overlay">
             <h1 class="card-title">STUDY CAFE</h1>
          <p class="card-text">This is made by Nangcho_Team</p>   
        </div>
      </div>
		<tr>
			<td colspan="2" align="center" class="content_text01"><font size="6" style="font-weight:bold">
				댓글 수정
			</font></td>
		</tr>
			
		<tr>
				<td colspan="2" align="center" class="content_text01">
					&nbsp;
				</td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="10">
					<tr class="contentbox">
						<td class="content2">
							<center>						
							<table border="0" cellspacing="0" cellpadding="10">
								<form action="replyModifyOk" method="post" >
									<input type="hidden" value="${rnum }" name="rnum">
	
										<textarea class="textarea_a1" name="rcontent" >${rDto.rcontent}</textarea>
										
											
																			<tr>
										<td colspan="2">
										
										<input class="button_type01" type="submit" value="수정완료">&nbsp;&nbsp;										
				
										<input class="button_type01" type="button" value="취소" onclick="script:window.location='list'">										
										
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