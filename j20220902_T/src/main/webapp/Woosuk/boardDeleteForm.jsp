<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		location.href = "<%=context%>/deletePro.do"; //디폴트가 get 방식이다
	</script>

	<%-- <!-- 사용 할지 말지 여부중 -->
	<h2> 암호를 입력하세요</h2>
	<form action="deletePro.do">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="num" value="${num }">
		암호 : <input type="text" name="passwd"><p>
		<input type="submit" value="확인">
	</form> --%>
</body>
</html>