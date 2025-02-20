<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEARCH</title>
</head>
<body>
<%@include file="index.jsp" %>
	<h2 align="center">WHAT YOU LOOKING FOR?</h2>
	<h4 align="center">무엇을 검색할까요?</h4>
	<form action="searchScript.jsp">
	<h4 align="center">제목 <input type ="text" name="title"></h4><br>
	<h4 align="center"><input type="submit" value= "조회"></h4>
	<h4 align="center"><input type="reset" value="취소"></h4>
	</form>
</body>
</html>