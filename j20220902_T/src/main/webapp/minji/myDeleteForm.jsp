<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="../memberCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>탈퇴 화면</title>
</head>
<body>
	<h2>탈퇴하려면 암호를 입력하세요</h2>
		<form action="myDeletePro.do">
		<input type="hidden" 	 name="id" value="${id}">
		<input type="hidden" 	 name="pw" 	value="${pw}">
		암호 : <input type="text" name="PW"><p>
		<input type="submit" value="확인" />
</form>
</body>
</html>
