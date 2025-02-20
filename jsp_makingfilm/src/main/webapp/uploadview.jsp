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
	String fileName = request.getParameter("filename");
%>
<h3>파일 내용 보기</h3>
이미지 파일명 = <%=fileName %><br><br>
<img alt ="<%=fileName%> src="fileSave/<%=fileName%>">
<button onclick=location.href="uploadForm.jsp">돌아가기</button>
</body>
</html>