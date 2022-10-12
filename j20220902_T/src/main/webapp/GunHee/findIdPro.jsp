<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기 결과</title>
	<link href="<%=context%>/css/loginForm.css" type="text/css" rel="stylesheet">
	<link href="<%=context%>/css/font.css" rel="stylesheet" > 
</head>
<body>
	<c:if test="${id eq null}">
		<script type="text/javascript">
			alert('해당되는 정보가 존재하지 않습니다.');
			location.href = "<%=context%>/GunHee/findIdForm.jsp";
		</script>
	</c:if>
	
	<div class="resultFindId">
			<div class="image" style="text-align: center">
				<img alt="" src="<%=context%>/images/icon.png" >
			</div>
			
			<div>
				<h3 style="text-align: center"> ${name}님의 아이디: ${id}</h3>
				<h5 style="text-align: center"> 혹시 비밀번호도 생각나지 않으시면 아래 버튼을 눌러주세요</h5>
				<hr>
			</div>
			
			<div style=" text-align: center;">
				<input type="button" class="button" value="확인" onclick="location.href='<%=context%>/GunHee/loginForm.jsp'">
				<input type="button" class="button" value="비밀번호 찾기" onclick="location.href='<%=context%>/GunHee/findPwForm.jsp'">
			</div>
	</div>
</body>
</html>