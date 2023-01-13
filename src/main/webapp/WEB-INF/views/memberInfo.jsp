<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>   
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<title>내 정보</title>
</head>
<body>
<%@ include file="include/header.jsp" %>

<center>
	<table width="35%" border="0" cellspacing="0" cellpadding="20">
		<div class="card text-bg-dark">
           <img src="${pageContext.request.contextPath} /resources/img/01.PNG" class="card-img" alt="...">
        <div class="card-img-overlay">
             <h1 class="card-title">STUDY CAFE</h1>
          <p class="card-text">This is made by Nangcho_Team</p>   
        </div>
      </div>
      
						<td class="content">
							<center>	
							<table class="table" width="350" text-align="center">
  											<thead>
    											<tr colspan="2">
      												<th scope="col" colspan="2"><div align="center" >
      												<h3>내 정보</h3></div></th>
    											</tr>
  											</thead>
  											<tbody class="table-group-divider">
    											<tr>
      												<th scope="row"> <span class="content_text01">아이디 :</span></th>
      												<td> <span class="content_text01">${memberDto.userId }</span></td>
  											    </tr>
    											<tr>
      												<th scope="row"> <span class="content_text01">이&nbsp;&nbsp;&nbsp;&nbsp;름: </span></th>
													<td> <span class="content_text01">${memberDto.userName }</span></td>
    											<tr>																
														<th scope="row"><span class="content_text01">전화번호 : </span></th>
														<td><span class="content_text01">${memberDto.userPhone }</span></td>
    											</tr>
    											<tr>
      												<th scope="row"><span class="content_text01">이메일 : </span>
													<td><span class="content_text01">${memberDto.userEmail }</span></td>
    											</tr>
    											<tr>
      												<th scope="row"><span class="content_text01">잔여 포인트 : </span>
													<td><span class="content_text01">${memberDto.userPoint }</span></td>
    											</tr>
    											
  												</tbody>
												</table>	
												
			<tr>
										<td colspan="2" align="center">
											<input class="button_type01" type="button" value="정보 수정" onclick="script:window.location='memberModify'">
											<input class="button_type01" type="button" value="회원 탈퇴" onclick="script:window.location='memberDelete'">
										</td>
									</tr>
		
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