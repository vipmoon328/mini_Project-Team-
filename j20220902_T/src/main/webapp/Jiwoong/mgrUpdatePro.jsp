<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String context = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 정보 수정</title>
</head>
<body>
	<c:if test="${result eq 1}">
		<script type="text/javascript">
			alert("회원 정보수정이 완료되었습니다.");
			location.href='<%=context%>/mgrList.do';
		</script>
	</c:if>
	
	<c:if test="${result eq 0}">
		<script type="text/javascript">
			alert("회원 정보수정이 실패되었습니다.");
			location.href='<%=context%>/mgrList.do';
		</script>
	</c:if>
</body>
</html>