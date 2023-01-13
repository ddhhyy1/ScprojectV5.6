<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%
	/*
		데이타 베이스에서 조회하였다는 가정하에
		아래 데이타 나열.
		나열된 데이타는 이미 존재하는 아이디
		id001, id002, id003
	*/	
	String userId = request.getParameter("userId");
	//Gson 인스턴스화(객체화)
	Gson gson = new Gson();		
	//Map을 객체화 하기
	Map map = new HashMap();
	if(
		   "id001".equals(userId) 
		|| "id002".equals(userId) 
		|| "id003".equals(userId)
		|| "".equals(userId)
		|| userId == null
	){		
		map.put("result", "Y");
	}else{
		map.put("result", "N");
	}
	String result = gson.toJson(map);
	out.print(result);
%>