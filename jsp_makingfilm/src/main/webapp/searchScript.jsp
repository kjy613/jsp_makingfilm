<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	String jdbcURL = "jdbc:mysql://localhost:3306/makingfilm";
	String user = "root";
	String passwd = "rootpw";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcURL, user, passwd);
	
	
%>
	<%
		String title= request.getParameter("title");
	
		Statement stat = null;
		ResultSet rs = null;
		
		String sql="select * from board where title = " + title;
		
		stat = conn.createStatement();
		rs = stat.executeQuery(sql);
		
		while(rs.next()){
			request.setAttribute("title", rs.getString("title"));
			request.setAttribute("writer", rs.getString("writer"));
			request.setAttribute("keyword", rs.getString("keyword"));
			request.setAttribute("script", rs.getString("script"));
		}
		
		rs.close();
		stat.close();
		conn.close();
	%>
	
	<jsp:forward page="viewSearchResult.jsp"></jsp:forward>
</body>
</html>