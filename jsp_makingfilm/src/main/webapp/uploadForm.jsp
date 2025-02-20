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
	<form action="board.jsp" method="post">
	<h2 align="center"><i>작품 등록하기</i></h2>
	<div class="card" style="width: 120rem;">
  <div class="card-body">
 
		<table align="center">
		<tr>
			<th align="center">제목</th>
			<td align="center"><input type="text" name="title" required="required"></td>
		</tr>
		<tr>
			<th align="center">작성자</th>
			<td align="center"><input type="text" name="writer" required="required"></td>
		</tr>
		<tr>
			<th align="center">키워드</th>
			<td align="center"><input type="text" name="keyword" required="required"></td>
		</tr>
		<tr>
		<th>내용</th>
		<td><textarea rows="30" cols="160" name="script"></textarea></td>
		</tr>
		<tr>
		<td colspan="2" align="center"><input type="submit" value="등록" class="btn btn-success btn-sm"></td>
		</tr>
		</table>
	 </div>
</div>
	</form>
</body>
</html>