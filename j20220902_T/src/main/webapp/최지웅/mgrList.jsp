<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원목록</title>
<link rel="stylesheet" type="text/css" href="css/mgrStyle.css">
<style type="text/css">
	table {
		width: 70%;
		}
</style></head>
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
		<form method="post" name="search" action="???.jsp">
					<tr>
						<td><select class="form_control" name="searchField">
								<option value="choice">--선택--</option>
								<option value="name">이름</option>
								<option value="userID">ID</option>
						</select></td>
						<td><input type="text" 	  class="form_control"	placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>
			</form>
	</div>
	 <center><h3><strong>회원목록</strong></h3></center>	
    
    <table border="1"  width="100%">
		<tr>
		<th >회원번호</th><th >이름</th><th >ID</th><th >전화번호</th><th >성별</th><th >email</th><th >가입일자</th> <th >회원관리</th>		
		</tr>			
			
	<!-- sql 데이터 가져오는 jstl 코드 영역	 --> 	
    		
		 	

	
  
		
   
  
   
		
	</table>		
                
   
    
    
    
    
    
    
   		 <div class="flex-container center">
			<div class="footer">
				<div><pre>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre></div>
				<div><pre>이메일  choongang@naver.com</pre></div>
			</div>
		</div>
    
    
    
    </div>	
    </div>
    
   
  
		
		
		
			
	
	
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

	           
               
	</body>
</html>   
   
   
   
   
  
 
    
    
  







 