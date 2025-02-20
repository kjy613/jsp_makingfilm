<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makingfilm_login</title>
</head>
<body>
<%@include file="index.jsp" %>
	<%
		String name = (String)session.getAttribute("name");
		if(name == null){
	%>

	<h1 align="center"><i>LOGIN</i></h1>


  </div>
</div>
	<form action="<%=request.getContextPath() %>/loginQuery.jsp" method="post">
	<table align="center">
	<tr>
	<td align="center">아이디</td><td align="center"><input type ="text" name="memid"></td>
	</tr>
	<tr><td align="center">비밀번호</td><td align="center"><input type="password" name="mempw"></td>
	</tr>
	<tr>
	<td colspan="2" align="center"><input class="btn btn-success btn-sm" type="submit" value= "로그인">
	<input class="btn btn-outline-success btn-sm" type="reset" value="취소"></td>
	</tr>
	</table>
	</form>
	</div>
	<%
		}else{
	%>
    	
    	<h3 align="center"><i><%=name%>님 로그인 중</i></h3>
    	<br>
    	<p align="center"><a href="logOut.jsp" class="link-success">로그아웃</a></p>
    	<br>
    	<p align="center"><a href="main.jsp" class="link-success">메인 화면</a>
    	</p>
    <%
		}
	%>

</body>
</html>