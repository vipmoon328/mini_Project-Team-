<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="../memberCheck.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="$modify_result eq 1}">
		<script type="text/javascript">
			alert("회원 정보수정이 완료되었습니다.");
		</script>
	</c:if>
	
	<c:if test="${modify_result eq 0}">
		<script type="text/javascript">
			alert("회원 정보수정이 실패되었습니다.");
		</script>
	</c:if>
</body>
</html>