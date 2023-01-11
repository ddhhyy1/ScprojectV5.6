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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/SubscriptionTicketPay.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/seatTable.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ticketView.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>   
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<title>시간권 구매</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
function reply_click(cliked_id)
{
alert(clicked_id);	
}
</script>
<script type="text/javascript"> 
var userPoint = '${memberdto.userPoint}';
userPoint = parseInt(userPoint);
</script>
<script type="text/javascript">
$(function(){
	
    $('.change50').click(function(e){
    	event.stopPropagation();
    	$('input[name=sticketName]').attr('value',"65,000");
    	userPoint = userPoint-65000;
    	$('input[name=afterPayingPoint]').attr('value',userPoint);
    });
});
$(function(){
    $('.change100').click(function(){
    	$('input[name=sticketName]').attr('value',"120,000");
    	userPoint = userPoint-120000  
    	$('input[name=afterPayingPoint]').attr('value',userPoint);
    });
});
$(function(){
    $('.change150').click(function(){
    	$('input[name=sticketName]').attr('value',"160,000");
    	userPoint = userPoint-160000
    	$('input[name=afterPayingPoint]').attr('value',userPoint);
    });
});
$(function(){
    $('.change200').click(function(){
    	$('input[name=sticketName]').attr('value',"200,000");
    	userPoint = userPoint-200000
    	$('input[name=afterPayingPoint]').attr('value',userPoint);
    
    });
});
</script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<table width="35%" border="0" cellspacing="0" cellpadding="20">
		<div class="card text-bg-dark">
  			<img src="${pageContext.request.contextPath} /resources/img/Cafe6.jpg" class="card-img" alt="...">
  		<div class="card-img-overlay">
   			 <h1 class="card-title">STUDY CAFE</h1>
    		<p class="card-text">This is made by Nangcho_Team</p>   
  		</div>
		</div>
		<tr>
			<td>
				<center>
				<form action="BuySubscription" name="join_frm">
				<table class="table" width="200" text-align="center">
  											<thead>
    											<tr colspan="2">
      												<th scope="col" colspan="2"><div align="center" >
      												<h3>내 예약 정보</h3></div></th>
    											</tr>
  											</thead>
  											<tbody class="table-group-divider">
    											<tr>
      												<th scope="row"> <span class="content_text01">아이디 :</span></th>
      												<td> <span class="content_text01"><%= sessionId %></span></td>
  											    </tr>
    											<tr>
      												<th scope="row"> <span class="content_text01">보유 포인트 : </span></th>
													<td> <span class="content_text01">${memberdto.userPoint}</span></td>
    											<tr>																
														<th scope="row"><span class="content_text01">시간제 이용권 : </span></th>
														<td><span class="content_text01">
														<div class="btn-group" role="group" aria-label="Basic outlined example">
  															<div class="change50"><a href=#>50시간</a></div>
  															<div class="change100"><a href=#>100시간</a></div>
  															<div class="change150"><a href=#>150시간</a></div>
   															<div class="change200"><a href=#>200시간</a></div>
														</div>
														</span></td>
    											</tr>
    											<tr>
      												<th scope="row"><span class="content_text01">차감포인트 : </span>
													<td><span class="content_text01">
													<input type="text" name="sticketName" style="width:170px;height:30px;font-size:20px;">p
													</span></td>
    											</tr>
    											<tr>
      												<th scope="row"><span class="content_text01">결제 후 보유포인트 : </span>
													<td><span class="content_text01">
													<input type="text" name="afterPayingPoint" value="0" style="width:170px;height:30px;font-size:20px;">
													</span></td>
    											</tr>
    											
  												</tbody>
												</table>	
				
									<tr>
										<td colspan="2" align="center">
											
											<input class="button_type01" type="button" value="결제하기" onclick="payingCheck()">&nbsp;&nbsp;
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
