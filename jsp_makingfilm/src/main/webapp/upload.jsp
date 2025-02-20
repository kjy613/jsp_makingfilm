<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

	String fileSave = "/fileSave";
	
	String real = application.getRealPath(fileSave);
	
	int max=1024*1024*10;
	
	MultipartRequest mr = new MultipartRequest(request, real, max, "utf-8", new DefaultFileRenamePolicy());
	
	String title = mr.getParameter("title");
	String writer = mr.getParameter("writer");
	String filename = mr.getFilesystemName("file");
	String original = mr.getOriginalFileName("file");
	File file = new File(real+"/"+filename);
	int size = (int)file.length();
	String script = mr.getParameter("script");
%>
<h3>업로드 결과</h3>
제목 : <%=title %><br>
작성자 : <%=writer %><br>
파일명 : <%=filename %><br>
파일 원본 : <%=original %><br>
파일 크기 : <%=size %><br>
내용 : <%=script %>

<button onclick="location.href='uploadview.jsp?filename=<%=filename %>'">파일 보기</button>
</body>
</html>