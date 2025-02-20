<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
		String memid = request.getParameter("memid");
		String mempw = request.getParameter("mempw");
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcURL = "jdbc:mysql://localhost:3306/makingfilm?" +
					"useSSL=false&serverTimezone=UTC";
		String dbUser = "root"; // 데이터베이스 계정과 암호
		String dbPass = "rootpw";
		conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
		pstmt = conn.prepareStatement("select * from member where memid = ?");
		pstmt.setString(1, memid);
		rs = pstmt.executeQuery();
		 
		if(rs.next()){
			if(mempw.equals(rs.getString("mempw"))){
				session.setAttribute("name", rs.getString("memname"));
			}
		}
		%>
		<script>
		location.href='<%=request.getContextPath()%>/login.jsp';
		</script>
		
		<%
		rs.close();
		pstmt.close();
		conn.close();
	%>
</body>
</html>