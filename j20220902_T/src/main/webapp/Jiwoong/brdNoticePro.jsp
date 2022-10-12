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
	<c:if test="${result >0 }">
		<script type="text/javascript">
			alert("공지사항 등록완료");
			location.href="<%=context%>/mgrBrdMgt.do?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if>
	<c:if test="${result ==0 }">
		<script type="text/javascript">
			alert("공지사항 등록중 오류가 발생했습니다");
			location.href="<%=context%>/brdNoticeForm.do?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if>
</body>
</html>