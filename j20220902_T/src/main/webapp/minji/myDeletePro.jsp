<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String context = request.getContextPath();
%>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("탈퇴가 완료되었습니다.");
			location.href="main.do";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("헐 ~ ㅠㅠ 암호 틀려");
			location.href="myDeleteForm.do?id=${id}&pw=${pw}";
		</script>
	</c:if>
</body>
</html>