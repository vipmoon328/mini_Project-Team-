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
	</style>
<link rel="stylesheet" type="text/css" href="<%=context%>/css/mgrList.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript"></script>




</head>
<body> 
<div style="width: 1600px;" align="center"> 
		<div id="wrapper">
			<div class="flex-container flex-end">
				<div class="item_first">
					<ul>
						<li><strong>00점관리자님</strong></li>
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
<!-- ------------------------------------header---------------------------------------------------------- -->	          
   
	
	<!-- 조건 검색 박스  -->  	
   <div id="search_box">
		<form method="post" name="search_form" action="<%=context%>/mgrList.do">
					<tr>
						<td><select class="form_control" name="searchField">
								<option value="choice">--선택--</option>
								<option value="name">이름</option>
								<option value="id">ID</option>
						</select></td>
						<td><input type="text" 	  class="form_control"	placeholder="검색어 입력" name="query" maxlength="100"></td>
						<td><button type="submit" class="btn_success">검색</button></td>
					</tr>
			</form>
	</div>
	
	
	
	<!-- 회원 목록 조회 -->
	
	 <center><h3><strong>회원목록</strong></h3></center>	
    
    <table border="1"  width="100%">
		<tr>
		<th >회원번호</th><th >이름</th><th >ID</th><th >비밀번호</th><th >phone</th><th >성별</th><th >email</th> <th >회원관리</th>		
		</tr>			
			
	<c:if test="${totCnt > 0 }">
			<c:forEach var="users" items="${list }">
				<tr align="center">
					<td>${startNum }</td>
					<td>${users.name } </td>
					<td>${users.id}</td>
					<td>${users.pw}</td>
					<td>${users.phone}</td>
					<td>${users.gender}</td>
					<td>${users.email}</td>
					<td>수정,관리 버튼 로직 구현</td>
				</tr>  	
				<c:set var="startNum" value="${startNum+1}"/> 
				</c:forEach>	
			</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>		
					
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
					
		</table>		
					
    		
		 	

	   
    
		
   
  
   
		

                
   
    
    
    
    
    
    
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
   	
		
		
			
	
	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

	           
   
   
   
   
  
 
    
    
  







 