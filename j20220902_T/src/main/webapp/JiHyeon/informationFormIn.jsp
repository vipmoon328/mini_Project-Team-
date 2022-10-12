<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>볼링장정보</title>
<link href="<%=context%>/css/informationForm.css?ver0.1" rel="stylesheet" type="text/css">
<link href="<%=context%>/css/font.css" rel="stylesheet" > 
</head>
<body style="overflow-x: hidden">
	<div id="wrapper">
		<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li>${name}님</li> <!-- 22.09.30[김건희] 수정 -->
					<li><a href="<%=context%>/logout.do">로그아웃</a></li> <!-- 22.09.30[김건희] 수정 -->
				</ul>
			</div> 
		</div>
		
	<!-- 22.10.04 링크 연결 및 수정 [김건희] -->
	<hr color="#D5D5D5" width="100%" size="1">	
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="<%=context%>/hyojung/loginHomeView.jsp">홈</a></li> <!-- 22.09.30[김건희] 수정 -->
					<li><a href="<%=context%>/JiHyeon/informationFormIn.jsp">볼링장정보</a></li> <!-- 22.09.30[김건희] 수정 -->
					<li><a href="<%=context%>/reschange.do">예약</a></li>
					<li><a href="<%=context%>/JiHyeon/mapFormIn.jsp">오시는길</a></li>
					<li><a href="<%=context%>/list.do">게시판</a></li>
					<li><a href="<%=context%>/mypage.do">마이페이지</a></li> <!-- 22.09.30[김건희] 수정 -->
				</ul>
			</div>
		</div>		
	<hr color="#D5D5D5" width="100%" size="1">
	
		<div class="flex-container">
			<div class="item_third"><h2>볼링장정보</h2></div>
		</div>		
	<hr color="#90C3FF" width="70%" size="1">

	<div class="flex-container center">
		<div class="item_fourth">
		<ul>		
			<li><a href="#content1">이용안내</a></li>
				<li><a href="#content2">볼링장전경</a></li>
				<li><a href="#content3">볼링장시설</a></li>
			</ul>
		</div>
	</div>			
		<div id="main_textbox">
			<div id="content1"  class="name"><h2>이용안내</h2></div>	
				<p style="text-align: center; font-size: 18px;">이용시간</p>							
					<hr color="#90C3FF" width="50%" size="1">						
						<table id="table">
							<tr>
								<td>일~목</td>
								<td>10:00~24:00</td>
							</tr>
							<tr>
								<td>금~토</td>
								<td>10:00~02:00</td>
							</tr>		
						</table>
				<p style="text-align: center; font-size: 18px;">이용요금<span style="font-size: 10px;"> 가격(1시간)</span></p>
					<hr color="#90C3FF" width="50%" size="1">
						<table id="table">											
							<tr>
								<td>오전 (10:00~12:00)</td>
								<td>10,000 (1인당)</td>
							</tr>
							<tr>
								<td>오후 (12:00~02:00)</td>
								<td>50,000 (1인당)</td>
							</tr>						
						</table>
		</div>
		<div id="main_textbox">	
			<div id="content2"  class="name"><h2>볼링장전경</h2></div>
				<div id="main_text">
					<p>신규 오픈한 볼링장 레인의 모습 및 편안한 게임 감상 및 휴식을 위한 공간입니다.</p>
				</div>
					<ul>		
						<li><figure>
							<img alt="락볼링장" 	src="../images/3.jpg" width="800">				
							<div id=text><figcaption>저녁에는 락볼링장 이용가능합니다.</figcaption></div>
						</figure></li>
						<li><figure>
							<img alt="레인" 		src="../images/4.jpg" width="800">
							<div id=text><figcaption><span class="lain">레인</span><br>총 20개 레인으로 넓은 규모를 자랑합니다</figcaption></div>
						</figure></li>
						<li><figure>
						<img alt="볼링공" 	src="../images/5.jpg" width="800">
						<div id=text><figcaption><span class="ball">볼링공</span><br>본인사이즈에 맞는 공을 선택해주세요.</figcaption></div>
						</figure></li>
					</ul>
		</div>
				
		<div id="main_textbox">
			<div id="content3" class="name"><h2>볼링장시설</h2></div>
				<div id="main_text">
					<p>프리미엄 볼링장의 차별화된 설비와 최신형 기계 장비로 더욱 특별한 서비스를 누려보세요.</p>
				</div>
					<ul>
						<li><figure>
							<img alt="액션캠" 	src="../images/1.png" width="800">
							<br>
							<div id=text><span style="font-weight: bolder;">전 레인 액션캠 설치</span><br>
							투구 직후 자신의 투구폼, 볼 궤도, 핀액션까지 슬로우모션으로 볼 수 있는 신개념 액션캠
							</div>
						</figure></li>					
						<li><figure>	
							<img alt="정비기" 	src="../images/2.png" width="800">				
							<div id=text><figcaption><span style="font-weight: bolder;">Kegel Flex Walker 정비기</span><br>
							자동으로 이동과 정비를 진행하며, 듀오 컨디셔닝 시스템으로 동시에 두 가지의 컨디셔너를 사용이 가능합니다.<br>
							또한 옵션인 클리너 믹싱 시스템을 탑재하여 물과 클리너의 비율을 설정하면<br> 기계가 자동으로 혼합하므로 365일 항상 일정한 클리너 비율을 유지합니다</figcaption> 
							</div>
						</figure></li>			
					</ul>				
		</div>
	</div>
		<div id="footer">
			<nav>
			<p>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호 : 02 313 1711</p>
			<p>이메일 : choongang@naver.com </p>
			</nav>
		</div>
		<a href="#" title="" class="button_top" style="display:scroll;position:fixed;bottom:20px;right:10px;">TOP</a>
</body>
</html>