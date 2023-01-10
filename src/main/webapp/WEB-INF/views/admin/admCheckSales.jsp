<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/Chart.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/utils.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<meta charset="UTF-8">
 <title>챠트</title>
    <style>
    canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
    </style>
 <script type="text/javascript">
 var date = new Date();

 var aMonthago = date.getMonth() + 1;
</script>

</head>
<body>
<%@ include file="../include/header.jsp" %>
<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox1">
				<span class="title01"><img src="${pageContext.request.contextPath} /resources/img/book5.png" >STUDY CAFE</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox1">
				<span class="title02">매출 현황&조회</span>
			</td>
		</tr>
		<tr>
		<td colspan="2" align="center">
		<div id="container" style="width: 1000px;height:580px;">
        <canvas id="canvas" ></canvas>
    </div>
    <script>
    var beforeweek= new Date(year, month, day - 7).toLocaleDateString();
    </script>
    <script>
   	
    	
        var color = Chart.helpers.color;
        var ChartData = {            
            labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', aMonthago], // 챠트의 항목명 설정
            datasets: [{
                label: '2022년 총 매출',  // 데이터셑의 이름
                pointRadius: 15, // 꼭지점의 원크기
                pointHoverRadius: 30, // 꼭지점에 마우스 오버시 원크기                                   
                backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(), // 챠트의 백그라운드 색상
                borderColor: window.chartColors.red, // 챠트의 테두리 색상
                borderWidth: 1, // 챠트의 테두리 굵기
                lineTension:0, // 챠트의 유연성( 클수록 곡선에 가깝게 표시됨)
                fill:false,  // 선챠트의 경우 하단 부분에 색상을 채울지 여부                  
                data: [${SalesForMonth2[0]}, ${SalesForMonth2[1]}, ${SalesForMonth2[2]}, ${SalesForMonth2[3]},
                	   ${SalesForMonth2[4]}, ${SalesForMonth2[5]}, ${SalesForMonth2[6]}, ${SalesForMonth2[7]},
                	   ${SalesForMonth2[8]}, ${SalesForMonth2[9]}, ${SalesForMonth2[10]}, ${SalesForMonth2[11]},
                	]  // 해당 데이터셋의 데이터 리스트
            },
            /* /* {
                label: '영업2팀', 
                pointRadius: 5,
                pointHoverRadius: 10,                                    
                backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(), 
                borderColor: window.chartColors.green, 
                borderWidth: 1,
                lineTension:0, 
                fill:false,                   
                data: [31,24,23,42,25,14,37,21,13,44,35,23,0] // 해당 데이터셋의 데이터 리스트
            } */
            ]
 
        };
 
        window.onload = function() {
            var ctx = document.getElementById('canvas').getContext('2d');
            window.myHorizontalBar = new Chart(ctx, {
                // type 을 변경하면 선차트, 가로막대차트, 세로막대차트 등을 선택할 수 있습니다 
                // ex) horizontalBar, line, bar, pie, bubble
                type: 'line', 
                data: ChartData,
                options: {
                    responsive: true,                    
                    maintainAspectRatio: false    ,
                    title: {
                        display: true,
                        text: '1년간 영업현황'
                    }
                }
            });
 
        };
    </script>
		
		</td>
		</tr>
	</table>
	</center>
<%@ include file="../include/footer.jsp" %>
</body>
</html>