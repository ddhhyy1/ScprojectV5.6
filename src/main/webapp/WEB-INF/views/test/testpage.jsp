<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 콤보박스 체인지에 관해 변화 이벤트 -->
<script type="text/javascript">
$(document).ready(function() {
	  $('#selectBox').change(function() {
	    var result = $('#selectBox option:selected').val();
	    if (result == '1') {
	    	$('.change02').text("9:00");
	    } else {
	    	
	    }
	  }); 
	}); 
		
</script>
<script type="text/javascript">
$(document).ready(function() {
	  $('#startTimeSelect2').change(function() {
	    var result = $('#startTimeSelect2 option:selected').val();
	    if (result == 'a1') {
	    	var text = $("#country :selected").text();
	    	var new_string = text.substr(:,0);
	    	console.log(new_string);
	    } else {
	    	$('.change03').text("동작하니?");
	    }
	  }); 
	}); 
</script>
<!-- 끝 -->

<script>

function categoryChange(e) {
	var good_a = ["지수", "제니", "로제", "리사"];
	var good_b = ["빅토리아", "엠버", "루나", "크리스탈"];
	var good_c = ["LE", "하니", "정화", "혜린", "솔지"];
	var target = document.getElementById("good");

	if(e.value == "a") var d = good_a;
	else if(e.value == "b") var d = good_b;
	else if(e.value == "c") var d = good_c;

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}	
}



</script>

</head>
<body>
ㅎㅇ
<select id="selectBox" name="selectBox">
  <option value="" selected="selected">이용할 시간</option>
  <option value="1">1시간</option>
  <option value="2">2시간</option>
  <option value="3">3시간</option>
</select>

<select id="startTimeSelect2" name="startTimeSelect2">
  <option value="" selected="selected">시작시간 선택</option>
  	<option value="a1">8:00</option>
	<option value="a2">9:00</option>
	<option value="a3">10:00</option>
	<option value="a4">11:00</option>
	<option value="a5">12:00</option>
	<option value="a6">13:00</option>
	<option value="a7">14:00</option>
</select>
gdgdgdsgdsdfsd
dsa
<div class="change02">0</div>
<div class="change03"></div>


<!-- <select id="startTimeSelect" onchange="categoryChange(this)">
	<option>시작시간 선택</option>
	<option value="a1">8:00</option>
	<option value="a2">9:00</option>
	<option value="a3">10:00</option>
	<option value="a4">11:00</option>
	<option value="a5">12:00</option>
	<option value="a6">13:00</option>
	<option value="a7">14:00</option>
</select>


<hr>
<select id="good">
<option>종료시간 선택</option>
</select>
 -->

</body>
</html>