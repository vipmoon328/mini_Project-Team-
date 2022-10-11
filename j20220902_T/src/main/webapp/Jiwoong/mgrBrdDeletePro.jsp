<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String context = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result >=1 }">
		<script type="text/javascript">
			alert("게시글 삭제 완료");
			location.href="<%=context%>/mgrBrdMgt.do?pageNum=${pageNum}";
		</script>
	</c:if>
	
	
	<c:if test="${result <1 }">
		<script type="text/javascript">
			alert("게시물 삭제 오류");
			location.href="<%=context%>/mgrBrdMgt.do?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if>
</body>
</html>