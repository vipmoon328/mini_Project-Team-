<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 유저복구 결과창</title>
</head>
<body>
<!-- 지웅씨의 관리자 권한시 유저 복구 기능 구현 [김건희] -->
	<c:if test="${result eq 1}">
		<script type="text/javascript">
			alert('회원님의 계정 복구 성공했습니다.');
			location.href="<%=context%>/mgrList.do";
		</script>
	</c:if>
	
	<c:if test="${result eq 0}">
		<script type="text/javascript">
			alert('회원님의 계정 복구 실패했습니다.');
			location.href="<%=context%>/mgrList.do";
		</script>
	</c:if>
</body>
</html>