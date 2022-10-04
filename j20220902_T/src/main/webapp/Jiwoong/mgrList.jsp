<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String context = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원목록</title>

	<style type="text/css">
		table {
			width: 70%;
						}
		select option[value=""][disabled] {
		display: none;
					}
	</style>
<link rel="stylesheet" type="text/css" href="<%=context%>/css/mgrList.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	

</script>




</head>
<body> 
<c:if test="${loc eq 0}">
	<c:set var="locName" value="이대"></c:set>
</c:if>
		
<c:if test="${loc eq 1}">
	<c:set var="locName" value="강남"></c:set>
</c:if>

<div style="width: 1600px;" align="center"> 
		<div id="wrapper">
			<div class="flex-container flex-end">
				<div class="item_first">
					<ul>
						<li><strong>${locName}점 관리자 ${id}님</strong></li>
						<li>로그아웃</li>
					</ul>
				</div> 
			</div>
		
		<hr color="#D5D5D5" width="100%" size="1">
			<div class="flex-container">
				<div class="item_second">
					<ul>
						<li>중앙볼링장</li>
						<li><a href="#" style="text-decoration: underline; color:#5A8DF3 "><strong>회원관리</strong></a></li>
						<li><a href="#">매장관리</a></li>
						<li><a href="#">게시판관리</a></li>
				   </ul>
				</div>
			</div>	
		<hr color="#D5D5D5" width="100%" size="1">
			<div class="flex-container">
				<div class="item_third">회원관리</div>
			</div>  
		<hr color="#5A8DF3" width="70%" size="1">
<!-- ------------------------------------header------------------------------------------------------------->	          
   
	
	
	<!-- 조건 검색 form  -->  	
   <div id="search_box">
		<form method="post" name="search_form" action="<%=context%>/mgrList.do" >
			<select class="form_control" name="searchField">
				<option value="" disabled selected>--선택--</option>
				<option value="name">이름</option>
				<option value="id">ID</option>
			</select>	
				<input type= "text" placeholder="검색어 입력" id="query" name="query" value="${query }" maxlength="50" >
				<button type="submit" class="btn_success">검색</button>	
		</form>					
  </div>							
			
  			
			
	<!-- 회원 목록 조회 -->
	
	 <center><h3><strong>회원목록</strong></h3></center>	
    
    <table border="1"  width="100%">
		<tr>
		<th >회원번호</th><th >아이디</th><th >비밀번호</th><th >이름</th><th >성별</th><th >연락처</th><th >이메일</th><th >회원여부</th><th >회원관리</th>		
		</tr>			
			
	<c:if test="${totCnt > 0 }">
			<c:forEach var="users" items="${list }">
				<tr align="center">
				    <td>${users.usernum }</td> 
					<td>${users.id }</td>
					<td>${users.pw } </td>
					<td>${users.name}</td>
					<td>${users.gender}</td>
					<td>${users.phone}</td>
					<td>${users.email}</td>
					<td>
						<c:choose>
							<c:when test="${users.deleted==1}">
								<span style="color: blue;"><c:out value="회원"></c:out></span>
							</c:when>
							<c:otherwise>
								<span style="color: red;"><c:out value="탈퇴"></c:out></span>
							</c:otherwise>
						</c:choose></td>
					<td><button type="button" onclick="location.href='<%=context%>/mgrUpdateForm.do?id=${users.id}&pageNum=${pageNum}'">수정</button> <button type="button" onclick="location.href='<%=context%>/mgrDeleteForm.do?id=${users.id}&pageNum=${pageNum}'">삭제</button></td>
		
				</tr>  
				</c:forEach>	
			</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>해당 데이터가 없습니다.</td>
			</tr>
		</c:if>		
		</table>		
		
		<div style="text-align: center;">
			<c:if test="${startPage > blockSize }">
			<a href='mgrList.do?pageNum=${startPage-blockSize}'>[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='mgrList.do?pageNum=${i}'>[${i}]</a>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
			<a href='mgrList.do?pageNum=${startPage+blockSize}'>[다음]</a>
			</c:if>
		</div>

					
					
					
					
	
	
	
	
				
    		
		 	

	   
    
		
   
  
   
		

                
   
    
    
    
    
    
    
   		<!--  <div class="flex-container center">
			<div class="footer">
				<div><pre>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre>이메일  choongang@naver.com</pre></div>
			</div>
		</div>
     -->
    
    
     </div>	
    </div>
    
   
  
	            
	</body>
</html>   
   	
		
		
			
	
	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

	           
   
   
   
   
  
 
    
    
  







 