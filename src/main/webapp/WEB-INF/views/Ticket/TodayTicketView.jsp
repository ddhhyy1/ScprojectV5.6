<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/searchSeatForm.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/seatjs.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ticketView.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<!-- jQuery  -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>   
<!-- bootstrap CSS -->
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">


		<!--      달력 추가 js 시작       -->
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#pickDate" ).datepicker({
            	 showOn: "button",
                 buttonImage:"${pageContext.request.contextPath }/resources/img/cal.png",
                 buttonImageOnly: true,
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 minDate: 0,
                 maxDate: "+10Y",                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 
                 maxDate: "+2Y",                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
    
   
    <!--      달력 추가 js 끝       -->

</script>

    
<meta charset="UTF-8">
<title>당일권 예약등록</title>

</head>
<body>
<%@ include file="../include/header.jsp" %>
	<center>
	<form action="searchSeat" name="searchSeatForm">
	<table class= "first" width="25%" border="1" cellspacing="0" cellpadding="20" radius="3">
		<table width="35%" border="1" cellspacing="0" cellpadding="20">
	<hr>
		<div class="card border-dark mb-3" style="max-width: 50rem; height:35rem;">
  			<div class="card-header"><h1>당일권 예약</h1></div>
  				<div class="card-body text-dark">
    			<p class="card-text">
    				<div class="card">
  						<div class="card-body">	
    						<span class="upper">
    						회원아이디	: &nbsp;&nbsp;<%= sessionId %>
    						</span>
 						 </div>
					</div>
					<br>
					<div class="card">
  						<div class="card-body">	&nbsp;&nbsp;&nbsp;
    						<span class="upper">날짜지정:&nbsp;&nbsp;
								<input type="text" id="pickDate" name="selectedDate" style="width:200px;height:30px;font-size:20px;">
							</span>
 						 </div>
					</div>
					<br>
					<div class="card">
  						<div class="card-body">	
    						<span class="upper">좌석지정:&nbsp;&nbsp;
  								<input type="text" name="seatNo" style="width:200px;height:30px;font-size:20px;">
							</span>
 						 </div>
					</div>
    				</p>
 					</div>
					</div>
		
		<table align=center>
		<hr>
		<tr>
		<td>
				<img src="${pageContext.request.contextPath} /resources/img/CafeMap2.png" usemap="#cafeMap">
				<map name="cafeMap"  id="cafeMap">
				<div class="change1"><area shape="rect" coords="834,27,881,81" href=#></div>
				<div class="change2"><area shape="rect" coords="776,27,821,81" href=#></div>
				<div class="change3"><area shape="rect" coords="717,27,764,81" href=#></div>
				<div class="change4"><area shape="rect" coords="658,27,705,81" href=#></div>
				<div class="change5"><area shape="rect" coords="600,27,645,81" href=#></div>
				<div class="change6"><area shape="rect" coords="541,27,586,81" href=#></div>
				<div class="change7"><area shape="rect" coords="480,27,529,81" href=#></div>
				<div class="change8"><area shape="rect" coords="420,27,471,81" href=#></div>
				<div class="change9"><area shape="rect" coords="360,27,411,81" href=#></div>
				<div class="change10"><area shape="rect" coords="306,27,353,81" href=#></div>
				
				<div class="change11"><area shape="rect" coords="246,27,295,81" href=#></div>
				<div class="change12"><area shape="rect" coords="172,27,225,78" href=#></div>
				<div class="change13"><area shape="rect" coords="171,87,226,137" href=#></div>
				<div class="change14"><area shape="rect" coords="171,147,225,197" href=#></div>
				<div class="change15"><area shape="rect" coords="172,206,225,257" href=#></div>
				<div class="change16"><area shape="rect" coords="171,260,225,316" href=#></div>
				<div class="change17"><area shape="rect" coords="172,320,225,376" href=#></div>
				<div class="change18"><area shape="rect" coords="19,54,79,126" href=#></div>
				<div class="change19"><area shape="rect" coords="17,141,78,212" href=#></div>
				<div class="change20"><area shape="rect" coords="18,226,78,298" href=#></div>
				
				<div class="change21"><area shape="rect" coords="17,310,78,383" href=#></div>
				<div class="change22"><area shape="rect" coords="18,397,78,470" href=#></div>	
				<div class="change23"><area shape="rect" coords="24,530,77,576" href=#></div>
				<div class="change24"><area shape="rect" coords="95,530,145,576" href=#></div>
				<div class="change25"><area shape="rect" coords="162,530,213,576" href=#></div>
				
				<div class="change26"><area shape="rect" coords="591,270,642,325" href=#></div>
				<div class="change27"><area shape="rect" coords="651,270,700,325" href=#></div>
				<div class="change28"><area shape="rect" coords="711,270,762,325" href=#></div>
				<div class="change29"><area shape="rect" coords="771,270,822,325" href=#></div>		
				<div class="change30"><area shape="rect" coords="591,202,642,257" href=#></div>
				<div class="change31"><area shape="rect" coords="654,202,702,257" href=#></div>
				<div class="change32"><area shape="rect" coords="714,202,762,257" href=#></div>
				<div class="change33"><area shape="rect" coords="774,202,822,257" href=#></div>
			</td>
		</tr>
		</table>
		</tr>
		</td>
		<br>
		<tr>
			<td>
				<button type="button" class="btn btn-primary btn-lg" onclick="seatCheckOk()">다음 단계로</button>
				<button type="button" class="btn btn-secondary btn-lg" onclick="window.history.back() ">뒤 로</button>
			</td>
		</tr>
	</table>
	
	</form>
	</center>
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>