<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath} /resources/css/timer.css">
<meta charset="UTF-8">
<title>이용권 구매</title>
	
    <style>
  .main_image {
    position: relative;
  }
  .main_image_text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate( -50%, -50% );
    color: white;
  }
  </style>
   
   


</head>
<body>
<%@ include file="../include/header.jsp" %>
 
<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<div class="main_image">
      <img src="${pageContext.request.contextPath} /resources/img/SCnangcho.png" width="100%" height="700px">


    <div class="main_image_text">
 	<div class="spacer">&nbsp;</div>
 	<table width="75%" border="0" cellspacing="0" cellpadding="20">
	<tr>
	<td>
<div class="timerwrap">
    <ul id="timer">
        <li>
            <span class="days">
            <a href="TodayTicketView">&nbsp;당일권 구매</a>
            </span>
            <p class="days_text">&nbsp;&nbsp;하루만 이용하실 때!</p>
        </li>
    </ul>    
</div>
</td>
<td>
<div class="timerwrap">
    <ul id="timer">
        <li>
            <span class="days">
            <a href="SubscriptionTicketBuy">시간권 구매</a>
            </span>
            <p class="days_text">&nbsp;긴 시간을 나눠서 이용할 때!</p>
        </li>   
    </ul>    
</div>
</td>
<td>
<div class="timerwrap">
    <ul id="timer">
        <li>
            <span class="days">
            <a href="SubscriptionTicketView">바로 예약</a>
            </span>
            <p class="days_text">&nbsp;&nbsp;&nbsp;이미 시간권을 보유하신 고객님은 바로 예약!</p>
        </li>

    </ul>    
</div>
</td>
</tr>
	</table>									
			  
    </div>
</div>
	
		
		
	</table>
	</center>

<%@ include file="../include/footer.jsp" %>
</body>
</html>