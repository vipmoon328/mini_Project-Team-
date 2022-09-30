<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과창</title>
</head>
<body>	
	<c:if test="${result eq 1}">
		<script type="text/javascript">
			alert('${name} 님 회원 가입 축하합니다');
			location.href='<%=context%>/GunHee/loginForm.jsp';
		</script>
	</c:if>
	
	<c:if test="${result eq 0}">
		<script type="text/javascript">
			alert('회원 가입에 실패하셨습니다. 로그인창으로 돌아갑니다.');
			location.href='<%=context%>/GunHee/loginForm.jsp';
		</script>
	</c:if>
</body>
</html>