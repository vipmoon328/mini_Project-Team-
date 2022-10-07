<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			alert("확인 완료");
			location.href="<%=context%>/boardContent.do?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if>
	<c:if test="${result != 1 }">
		<script type="text/javascript">
			alert("작성자만 게시글을 볼 수 있습니다");
			location.href="<%=context%>/secretCheckForm.do?num=${board.brd_bid}&pageNum=${currentPage}";
		</script>
	</c:if>
</body>
</html>