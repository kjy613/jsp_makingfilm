<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Date"%>
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
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String writer =  request.getParameter("writer");
	String keyword = request.getParameter("keyword");
	String script = request.getParameter("script");
	
	Date date = new Date();
	Long time = date.getTime(); // 현재 시각을 밀리세컨드 단위로 가져오는 메소드
	String fileName = time + ".txt";
	String filePath = application.getRealPath("/WEB-INF/board/"+fileName);
	
	String jdbcURL = "jdbc:mysql://localhost:3306/makingfilm?" +
			"useSSL=false&serverTimezone=UTC";
	String dbUser = "root";
	String dbPass = "rootpw";
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "insert into board values(?, ?, ?, ?)";
	
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
		
		// 3. pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, writer);
		pstmt.setString(3, keyword);
		pstmt.setString(4, script);

		
		// 4. sql문 실행
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			response.sendRedirect("upload_success.jsp");
		} else{ // 실패
			response.sendRedirect("upload_fail.jsp");
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