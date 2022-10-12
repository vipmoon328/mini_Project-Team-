<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
   
		function login() {
			location.href="<%=context%>//GunHee/loginForm.jsp";
		}
		   
		function mgrList() {
			location.href="<%=context%>/mgrList.do";
		}
  
</script>
<body>
	<input type="button" value="관리자로그인" onclick="login()"><p>  <!-- Id :김우석 비번:121412141214 -->
	<input type="button" value="관리자페이지로" onclick="mgrList()">
	
</body>
</html>