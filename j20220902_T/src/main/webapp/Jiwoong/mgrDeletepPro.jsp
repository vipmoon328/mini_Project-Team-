<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String context = request.getContextPath(); %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴하기</title>

</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("탈퇴가 완료되었습니다.");
			location.href="<%=context%>/mgrList.do";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("패스워드가 일치하지 않습니다.");
			location.href="<%=context%>/mgrDeleteForm.do?id=${id}&pw=${pw}";
		</script>
	</c:if>
</body>
</html>