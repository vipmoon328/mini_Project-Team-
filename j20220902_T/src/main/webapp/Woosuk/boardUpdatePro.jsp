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
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("수정완료");
			location.href="boardContent.do?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if>
	<%-- <h1>결과값 result: ${result}</h1> --%>
	<c:if test="${result < 1 }">
		<script type="text/javascript">
		alert("수정 확인 해주시기 바립니다");
		location.href="updateForm.do?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if> 
</body>
</html>