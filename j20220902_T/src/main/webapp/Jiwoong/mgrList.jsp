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
<link href="<%=context%>/css/font.css" rel="stylesheet" > 
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function() {
	if('${searchField}'!=null && '${searchField}'!=""){
		$('#searchField').val('${searchField}').prop("selected",true);
	}
	
	
	
	$(document).on("click","#prev,#next,.pageNum",function(){
			
		if(	$(this).attr("id")=="prev"){
			var prevNum=parseInt($('.pageNum:first').val())-1
			valueChk(prevNum);
		}else if($(this).attr("id")=="next"){
			var nextNum=parseInt($('.pageNum:last').val())+1
			valueChk(nextNum);
		}else{
			valueChk($(this).attr("id"));
		}
				
		});
	
});
	function valueChk(pageNum) {
		if('${searchField}'==null || '${searchField}'==""){
		location.href="<%=context%>/mgrList.do?pageNum="+pageNum+"&query="+$('#query').val();
		}else {
		location.href="<%=context%>/mgrList.do?pageNum="+pageNum+"&searchField="+$('#searchField').val()+"&query="+$('#query').val();
		
	}
		}


	 function searchOption()
	{
		if($('#searchField').val()=='name' ||'id')
		{
			$(this).attr("readonly",true);
		}
			
	}
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
						<li><strong>${name} 관리자님</strong></li> <!-- 22.10.05 링크 및 관리자 표시 수정 [김건희] -->
						<li><a href="<%=context%>/logout.do">로그아웃</a></li> <!-- 22.10.05 링크 및 관리자 표시 수정 [김건희] -->
					</ul>
				</div> 
			</div>
		
		<hr color="#D5D5D5" width="100%" size="1">
			<div class="flex-container">
				<div class="item_second">
					<ul>
						<li>중앙볼링장</li>
						<li><a href="<%=context%>/mgrList.do" style=" color:#5A8DF3 "><strong>회원관리</strong></a></li>
						<li><a href="<%=context%>/managerSales.do">매장관리</a></li>
						<li><a href="<%=context%>/mgrBrdMgt.do">게시판관리</a></li>
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
			<select class="form_control" id="searchField" name="searchField" onclick="searchOption()">
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
	
	<!-- 22.10.05 탈퇴 회원일시 복구 기능 추가 [김건희] -->
	<c:if test="${totCnt > 0 }">
			<c:forEach var="users" items="${list }">
				<tr align="center">
				    <td>${startNum }</td> 
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
								</td>
								<td>
								<button type="button" onclick="location.href='<%=context%>/mgrUpdateForm.do?id=${users.id}&pageNum=${pageNum}'">수정</button> <button type="button" onclick="location.href='<%=context%>/mgrDeleteForm.do?id=${users.id}&pageNum=${pageNum}'">삭제</button>
							</c:when>
							<c:otherwise>
								<span style="color: red;"><c:out value="탈퇴"></c:out></span>
								</td>
								<td>
								<button type="button" onclick="location.href='<%=context%>/mgrUpdateForm.do?id=${users.id}&pageNum=${pageNum}'">수정</button> <button type="button" onclick="location.href='<%=context%>/recoverUser.do?userNum=${users.usernum}&pageNum=${pageNum}'">복구</button>
							</c:otherwise>
						</c:choose>
					</td>
						
				</tr>
				<c:set var="startNum" value="${startNum + 1 }" />  
				</c:forEach>	
			</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=9 align="center">해당 데이터가 없습니다.</td>
			</tr>
		</c:if>		
		</table>		
		
		<!-- 페이징 -->
		<div style="text-align: center;">
			<c:if test="${startPage > blockSize }">
			<button id="prev">[이전]</button>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<button id="${i}" class="pageNum">${i }</button>
			</c:forEach>
			<c:if test="${endPage < pageCnt }">
			<button id="next" >[다음]</button>
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
   	
		
		






					
					
					
					
	
	
	
	
				
    		
		 	

	   
    
		
   
  
   
		

                
   
    
    
    
    
    
    
   	
			
	
	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

	           
   
   
   
   
  
 
    
    
  







 