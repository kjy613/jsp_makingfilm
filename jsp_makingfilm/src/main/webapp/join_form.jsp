<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
<%@include file="index.jsp" %>
	<h2 align="center"><i>회원 가입</i></h2>
	<form action="join_ok.jsp" method="post">
	<table width="320px" align="center">
	<tr>
		<td align="center">아이디</td>
		<td align="center"><input type ="text" name="memid"></td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td align="center"><input type="password" name="mempw"></td>
	</tr>
	<tr>
		<td align="center">이름</td>
		<td align="center"><input type="text" name="memname"></td>
	</tr>
	<tr>
		<td align="center">전화번호</td>
		<td align="center"><input type="text" name="memphnno"></td>
	</tr>
	<tr>
		<td align="center">이메일</td>
		<td align="center"><input type="email" name="mememail"></td>
	</tr>
	<tr>
	<td colspan="2" align="center"><input class="btn btn-success btn-sm" type="submit" value= "회원 가입">
	<input class="btn btn-outline-success btn-sm" type="reset" value="취소"></td>
	</tr>
	</table>
	</form>
</body>
</html>