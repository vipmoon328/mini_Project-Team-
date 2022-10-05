<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 사용 할지 말지 여부중 -->
	<h2> 암호를 입력하세요</h2>
	<form action="deletePro.do">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="num" value="${num }">
		암호 : <input type="text" name="passwd"><p>
		<input type="submit" value="확인">
	</form>
</body>
</html>