<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="index.jsp" %>
<h1 align="center"><a href="main.jsp" class="link-success">MAKING FILM of you</a></h1>
<table border="1" align="right">
<td align="center">
<%@include file="index_index.jsp"%></td>

</table>
<%@include file="boardlist.jsp"%>
<h6 align="right"><a href="uploadForm.jsp" class="link-success">내 작품 업로드하기</a></h6>

</body>
</html>