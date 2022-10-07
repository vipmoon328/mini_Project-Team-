<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 결과</title>
	
	<script type="text/javascript">
		console.log(${auth})
	</script>
</head>
<body>
	<c:if test="${login_result eq 1 && auth eq 1}">
		<script type="text/javascript">
			alert("${name}님 환영합니다."); 
			location.href='<%=context%>/hyojung/loginHomeView.jsp';
		</script>
	</c:if>
	
	<c:if test="${login_result eq 1 && auth eq 0}">
		<script type="text/javascript">
			alert("관리자님 환영합니다.");
			location.href='<%=context%>/mgrList.do';
		</script>
	</c:if>
	
	<c:if test="${login_result eq 0}">
		<script type="text/javascript">
			alert("로그인에 실패하셨습니다.");
			location.href='<%=context%>/GunHee/loginForm.jsp';
		</script>
	</c:if>
	
</body>
</html>