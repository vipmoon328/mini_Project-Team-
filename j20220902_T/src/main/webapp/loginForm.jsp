<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.Login {
	  width: 100%;
	  height: 100vh;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	
	div {
		padding: 7px;
	}
	
	input {
		width: 300px;
		height: 30px;
		border: 0;
      	border-radius: 15px;
      	outline: none;
      	padding-left: 10px;
      	background-color: rgb(233, 233, 233);
	}
	
	.input {
		position: relative;
		left: 17px;
	}
	
	#sendData {
		width: 308px;
	}
	
	#signUp {
    	text-align: center;
	}
	
	img { 
    	display : block;
    	margin : auto;
    }
    
    .button
    {
    	background-image: linear-gradient(to right, #25aae1, #4481eb, #04befe, #3f86ed);
    	box-shadow: 0 4px 15px 0 rgba(65, 132, 234, 0.75);
		font-size: 16px;
    	font-weight: 600;
   	 	color: #fff;
    	cursor: pointer;
    	margin: 20px;
    	border: none;
    	background-size: 300% 100%;
    	border-radius: 50px;
    	-o-transition: all .4s ease-in-out;
    	-webkit-transition: all .4s ease-in-out;
    	transition: all .4s ease-in-out;
    }
	
	.button:focus
	{
    	outline: none;
	}
	
	.button:hover {
		background-position: 100% 0;
	    -o-transition: all .4s ease-in-out;
	    -webkit-transition: all .4s ease-in-out;
	    transition: all .4s ease-in-out;
	}
	
	.optionBox{
		position: relative;
		left: 27px;
	}
	
	.option {
		margin-right: 10px;
		color: rgba(65, 132, 234, 0.75);
		font-weight: 600;
	}
	
	a {
		text-decoration: none;
	}
	
	a:visited{
		color: rgba(65, 132, 234, 0.75);
	}
	
</style>
</head>
<body>

	<div class="Login">
	
		<form action="" class="LoginForm">
		
			<div class="image">
				<img alt="" src="images/icon.png">
			</div>
		
			<div>
				<input type="text" class="input" placeholder="  아이디" id="user_id" size="50">
			</div>
			
			<div>
				<input type="password" class="input" placeholder="  비밀번호" id="user_password">
			</div>
			
			<div>
				<input type="submit" value=" 로그인" id="sendData" class="button">
			</div>
			
			<div class="optionBox">
				<span id="findId" class="option"><a href="">아이디 찾기</a></span>
				<span id="findPw" class="option"><a href="">비밀번호 찾기</a></span>
				<span id="signUp" class="option"><a href="signUp.html">회원 가입</a></span>
			</div>
		</form>
	</div>
	

</body>
</html>