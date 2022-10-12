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
		function mgrBrdMgt() {
			location.href="<%=context%>/mgrBrdMgt.do";
		}
  
</script>
<body>
	<input type="button" value="관리자로그인" onclick="login()"><p>  <!-- Id :김우석 비번:121412141214 -->
	<input type="button" value="관리자 회원가입 페이지로" onclick="mgrList()">
	<input type="button" value="게시판관리로" onclick="mgrBrdMgt()">
</body>
</html>