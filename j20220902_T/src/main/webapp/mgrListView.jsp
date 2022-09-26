<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style type="text/css">
    table{
    	width: 100%;
    } 
     
     
     
     
   /* 회원목록 캡션영역*/
    caption {
            font-size: 25px;
            padding: 30px;
        }
        
 

    
    #search_box{
       
   	}
    
    
    
    
    
    
    
    
    footer{                                    /*footer 하단고정*/
    position:absolute;
    bottom:0;
    width:100%;
    height:90px;   
    background:black;
    color:white;     
    }
    
    /* 하단내용 영역 */							   
	
	nav {
		text-align: center;  /* 글자 정렬 */
		}  
        
        
       
</style>
</head>
<body>
   <table></table>
    
   
   
   
   
 <!-- 검색창    -->

 <form name ="search_box" id="search_box" align="right" height="100" method="get">
  <select name="search_type" >
    <option value="none">== 선택 ==</option>
    <option value="name">이름</option>
    <option value="ID">ID</option>
  </select>
   <input type="text">
   <input type="submit" value="검색">
 </form>
    
    
    
	
	
	<table border="1" width="100%">
		<center><caption>회원목록</caption></center>	
		<tr bgcolor="#FAFAFA">
		<th >회원번호</th><th >이름</th><th >ID</th><th >전화번호</th><th >성별</th><th >email</th><th >가입일자</th> <th >회원관리</th>		
		</tr>			
			
			
                
                
                
               
			
	<!-- sql 데이터 가져오는 jstl 코드 영역	 -->
		
	</table>
    
    
 
    
    
  







 <!--  하단 고정 footer -->
    <footer>
			<nav>
			<p>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호 : 02 313 1711</p>
			<p>이메일 : choongang@naver.com </p>
			</nav>
	</footer>		
</body>
</html>