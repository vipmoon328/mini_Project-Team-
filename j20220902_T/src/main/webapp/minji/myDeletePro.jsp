<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../memberCheck.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴하기</title>
<%
	String context = request.getContextPath();
%>
<script type="text/javascript">
	console.log(${result});
</script>
</head>
<body>
	<c:if test="${result eq 1 }">
		<script type="text/javascript">
			alert("탈퇴가 완료되었습니다.");
			location.href="<%=context%>/hyojung/mainHomeView.jsp";
		</script>
	</c:if>
	<c:if test="${result eq 0 }">
		<script type="text/javascript">
			alert("패스워드가 일치하지 않습니다.");
			location.href="<%=context%>/minji/myDeleteForm.jsp";
		</script>
	</c:if>
</body>
</html>