<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
	<h3>데이터베이스 연결</h3>
	<%
		// 1.JDBC 드라이버 로딩 // JDBC에 해당하는 클래스들은 Class.forName() 메소드를 통해서 로딩될 때 자동으로 JDBC 드라이버를 등록
		Class.forName("com.mysql.jdbc.Driver");
	
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		String jdbcURL = "jdbc:mysql://localhost:3306/makingfilm?" + // 데이터베이스 식별을 위한 JDBC URL
						"useSSL=false&serverTimezone=UTC";
		String dbUser = "root"; // 데이터베이스 계정과 암호
		String dbPass = "rootpw";
		
		String sql = "select * from member";
		
		//2. 데이터베이스 커넥션 생성

		conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass); // JDBC를 이용해서 데이터베이스를 사용하려면 데이터베이스와 연결된 커넥션을 구해야 한다
		
		// 3. Statement 생성
		stat = conn.createStatement();
		
		// 4. 쿼리 실행
		rs = stat.executeQuery(sql);
		
		// 5. 쿼리 실행 결과 출력
		if(rs != null)
			out.println("데이터베이스 연결 성공~~!"+"<br>");
		else
			out.println("데이터베이스 연결 실패...");
		
		// 6. 사용한 Statement 종료
		rs.close();
		
		// 7. 커넥션 종료
		conn.close();
	%>
</body>
</html>