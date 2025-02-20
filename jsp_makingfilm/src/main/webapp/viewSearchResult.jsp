<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="searchScript_form.jsp">
<table border="1" align="center">
		<tr>
			<th>제목</th>
			<td>${title }</td>
		</tr>
		<tr>
			<th>작가</th>
			<td>${writer }</td>
		</tr>
		<tr>
			<th>키워드</th>
			<td>${keyword }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${script }</td>
		</tr>
</table>
<br><br>
<input type="submit" value="다시 검색하기">
</form>
</body>
</html>