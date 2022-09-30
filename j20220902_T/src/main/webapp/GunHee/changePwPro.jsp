<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result eq 1}">
		<script type="text/javascript">
			alert("비밀번호 변경이 성공 했습니다.");
			location.href='loginForm.jsp';
		</script>
	</c:if>
	
	<c:if test="${result eq 0}">
		<script type="text/javascript">
			alert("비밀번호 변경이 실패 했습니다.");
			location.href = "findPwForm.jsp";
		</script>
	</c:if>
</body>
</html>