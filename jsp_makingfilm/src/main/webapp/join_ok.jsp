<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("memid");
	String pw = request.getParameter("mempw");
	String name = request.getParameter("memname");
	int phnno = Integer.parseInt(request.getParameter("memphnno"));
	String email = request.getParameter("mememail");
	
	String jdbcURL = "jdbc:mysql://localhost:3306/makingfilm?" +
			"useSSL=false&serverTimezone=UTC";
	String dbUser = "root";
	String dbPass = "rootpw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "insert into member values(?, ?, ?, ?, ?)";
	
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
		
		// 3. pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setInt(4, phnno);
		pstmt.setString(5, email);
		
		// 4. sql문 실행
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			response.sendRedirect("join_success.jsp");
		} else{ // 실패
			response.sendRedirect("join_fail.jsp");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>