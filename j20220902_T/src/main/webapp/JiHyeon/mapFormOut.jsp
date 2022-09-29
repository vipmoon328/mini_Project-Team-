<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%
	String name = (String)session.getAttribute("name");
%>
<meta charset="UTF-8">
<title>오시는길</title>
<link href="../css/mapForm.css?ver0.1" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrapper">
		<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li><a href="loginForm.jsp">로그인</a></li>
					<li><a href="signUpForm.jsp">회원가입</a></li>
				</ul>
			</div> 
		</div>
		
	<hr color="#D5D5D5" width="100%" size="1">	
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="loginHomeView.jsp">홈</a></li>
					<li><a href="informationForm.jsp">볼링장정보</a></li>
					<li><a href="resAllView.jsp">예약</a></li>
					<li><a href="mapForm.jsp">오시는길</a></li>
					<li><a href="boardList.jsp">게시판</a></li>
					<li><a href="mypageForm.jsp">마이페이지</a></li>
			</ul>
		</div>
	</div>
	
	<hr color="#D5D5D5" width="100%" size="1">
	
	<div class="flex-container">
		<div class="item_third">오시는길</div>
	</div>

	<hr color="#90C3FF" width="70%" size="1">
	
	<div class="flex-container center">
		<div class="item_fourth">
		<ul>
			<li><a href="#content1">이대점</a></li>
			<li><a href="#content2">강남점</a></li>
		</ul>
		</div>
	</div>



	<div id="place">
	<h2 id=content1>이대점</h2>
	</div>
<!-- 지도[이대점] -->    
    <div id="map1" style="width:960px;height:400px; margin:auto;"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=429b83497376fa35c5bb4d95e24ef6ca"></script>
    <script>
        var container1 = document.getElementById('map1'); //지도 표시 div
        var option1 = {
            center: new kakao.maps.LatLng(37.5564261, 126.945169), //지도의 중심좌표
            level: 3 //지도의 확대 레벨
        };
        
        var map1 = new kakao.maps.Map(container1, option1);  
     
        // 마커가 표시될 위치       
        var markerPosition1 = new kakao.maps.LatLng(37.5564261, 126.945169); 
	 
        // 마커 생성
        var marker1 = new kakao.maps.Marker({
            position: markerPosition1
            
        });
 
        // 마커가 지도 위에 표시되도록 설정
        marker1.setMap(map1);    
        
        
     // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map1.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map1.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);      
    </script>
    
    
    <div id="main_textbox">    	
    	<div id="button">
	    	<input type="button" id="map" onclick="window.open('https://map.kakao.com/link/map/37.5564261,126.945169');" value="지도에서보기">
	    	<input type="button" id="way" onclick="window.open('https://map.kakao.com/link/to/중앙볼리장(이대점),37.5564261,126.945169');" value="길찾기">
    	</div>
    	<div id="main_text">중앙빌딩<br></div>
    		<div id="address">서울특별시 마포구 신촌로 176</div>
    	<div id=text>
    		<table>
    			<tr>
    				<th>오시는길</th>
    				<td>중앙빌딩 5층입니다 <br>
    					<span id="parking">※주차장은 타워식 주차입니다.(유료)</span></td>
    			</tr>
    			<tr>
    				<th>전화번호</th>
    				<td>02-313-1711</td>
    			</tr>
    			<tr>
    				<th>이용안내</th>
    				<td><figure>
						<div style=" float: left; text-align:center; width: 50px; padding: 5px 20px 2px 20px;"><img src="../images/예약.png" width="50" height="50">
						<figcaption style="text-align: center;">예약</figcaption></div>
						<div style=" float: left; text-align:center; width: 50px; padding: 5px 20px 2px 20px;"><img src="../images/단체석.png" width="50" height="50">
						<figcaption style="text-align: center;">단체석</figcaption></div>
						<div style=" float: left; text-align:center; width: 50px; padding: 5px 10px 2px 20px;"><img src="../images/주차.png" width="50" height="50">
						<figcaption style="text-align: center;">주차</figcaption>	</div>		
						<div style=" float: left; text-align:center; width: 150px; padding: 5px 50px 2px 10px;"><img src="../images/화장실.png" width="50" height="50">	
						<figcaption style="text-align: center;">남/여 화장실 구분</figcaption></div>
					</figure></td>
    			</tr>				
    		</table>
    	</div>
    </div>



    <div id="place">
    <h2 id=content2>강남점</h2>
    </div>
<!-- 지도[강남점] -->    
    <div id="map2" style="width:960px;height:400px; margin:auto;"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=429b83497376fa35c5bb4d95e24ef6ca"></script>
    <script>
        var container2 = document.getElementById('map2'); //지도 표시 div
        var option2 = {
            center: new kakao.maps.LatLng(37.4996191, 127.030458), //지도의 중심좌표
            level: 3 //지도의 확대 레벨
        };
 
        var map2 = new kakao.maps.Map(container2, option2);
        
        // 마커가 표시될 위치     
		var markerPosition2  = new kakao.maps.LatLng(37.4996191, 127.030458);
 
        // 마커 생성
        var marker2 = new kakao.maps.Marker({
            position: markerPosition2
        });
 
        // 마커가 지도 위에 표시되도록 설정
        marker2.setMap(map2);     
        
     // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map2.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map2.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);  
     </script>


     <div id="main_textbox">     
     <input type="button" id="map" onclick="window.open('https://map.kakao.com/link/map/37.4996191,127.030458');" value="지도에서보기">
     <input type="button" id="way" onclick="window.open('https://map.kakao.com/link/to/중앙볼리장(강남점),37.4996191,127.030458');" value="길찾기">
    	<div id="main_text">에스코빌딩<br></div>
    		<div id="address">서울특별시 강남구 테헤란로 7길 7</div>
    	<div id=text>
    		<table>
    			<tr>
    				<th>오시는길</th>
    				<td>에스코빌딩 6층입니다 <br>
    					<span id="parking">※건물내 주차장 이용이 가능합니다.(유료)</span></td>
    			</tr>
    			<tr>
    				<th>전화번호</th>
    				<td>02-561-1911</td>
    			</tr>
    			<tr>
    				<th>이용안내</th>
					<td><figure>
						<div style=" float: left; text-align:center; width: 50px; padding: 5px 20px 2px 20px;"><img src="../images/예약.png" width="50" height="50">
						<figcaption style="text-align: center;">예약</figcaption></div>
						<div style=" float: left; text-align:center; width: 50px; padding: 5px 20px 2px 20px;"><img src="../images/단체석.png" width="50" height="50">
						<figcaption style="text-align: center;">단체석</figcaption></div>
						<div style=" float: left; text-align:center; width: 50px; padding: 5px 10px 2px 20px;"><img src="../images/주차.png" width="50" height="50">
						<figcaption style="text-align: center;">주차</figcaption>	</div>		
						<div style=" float: left; text-align:center; width: 150px; padding: 5px 50px 2px 10px;"><img src="../images/화장실.png" width="50" height="50">	
						<figcaption style="text-align: center;">남/여 화장실 구분</figcaption></div>
					</figure></td>
				</tr>
    		</table>
    	</div>
    </div>
  </div>
    <div id="footer">
			<nav>
			<p>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호 : 02 313 1711</p>
			<p>이메일 : choongang@naver.com </p>
			</nav>
		</div>
</body>
</html>