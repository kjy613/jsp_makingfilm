<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<%@ include file="dbconn.jsp"%>

<table border=1 width="80%" align="center" class="table table-success table-striped table-hover">
	<tr align="center">
		<th><i>제목</i></th><th><i>작가</i></th><th><i>키워드</i></th><th><i>내용</i></th>
	</tr>
	<%
	Statement stat = null;
	ResultSet rs = null;
	
	String sql = "select * from board";
	
	stat = conn.createStatement();
	rs = stat.executeQuery(sql);
	 
	while(rs.next()){
		String title = rs.getString("title");
		String writer = rs.getString("writer");
		String keyword = rs.getString("keyword");
		String script = rs.getString("script");
	%>
	<tr>
		<td align="center"><%=title %></td><td align="center"><%=writer %></td>
		<td align="center"><%=keyword %></td><td align="center"><%=script %></td>
	</tr>
	<%
	}
	rs.close();
	stat.close();
	conn.close();
	%>
</table>
</body>
</html>