<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="../memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String passwd = request.getParameter("passwd");
		UserDao ud = UserDao.getInstance();
		System.out.println("myDeletePro id->"+id);
		int result = ud.delete(id, passwd); 
		if (result == 1) {
			session.invalidate();
	%>
		<script type="text/javascript">
			alert("탈퇴되었습니다.");
			location.href="main.jsp";
		</script>
	<%	} else if (result==0) { %>
		<script type="text/javascript">
			alert("암호를 다시 입력해주세요.");
			history.go(-1);
		</script>
	<%	} else { %>
		<script type="text/javascript">
			alert("유저가 다릅니다.");
			history.go(-1);
		</script>
	<% } %>
</body>
</html>