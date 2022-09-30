<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%   String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
		function res() {
			location.href="<%=context%>/reschange.do?USERNUM=2";
		}
		
		function myres() {
			location.href="<%=context%>/myRes.do?USERNUM=2";
		}
	</script>
<body>
	<input type="button" value="나의예약으로" onclick="myres()"><p>
	<input type="button" value="예약하기로" onclick="res()">
</body>
</html>