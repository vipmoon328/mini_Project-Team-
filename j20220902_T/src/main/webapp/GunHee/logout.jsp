<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  String context = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("로그아웃 되었습니다.")
	location.href='<%=context%>/hyojung/mainHomeView.jsp';
</script>
</head>
<body>

</body>
</html>