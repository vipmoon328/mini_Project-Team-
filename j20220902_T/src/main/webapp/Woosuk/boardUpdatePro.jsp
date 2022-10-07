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
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			alert("수정완료");
			location.href="<%=context%>/boardContent.do?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if>
	
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("작성자와 수정자가 일치하지 않습니다.");
			location.href="<%=context%>/updateForm.do?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if>
	
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("수정 확인 해주시기 바립니다");
			location.href="<%=context%>/updateForm.do?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if> 
</body>
</html>