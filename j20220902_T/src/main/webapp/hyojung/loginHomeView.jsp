<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중앙볼링장</title>
<!-- 22.10.04 링크 수정 [김건희] -->
<link rel="stylesheet" href="<%=context%>/css/loginHomepage.css?ver0.1" type="">
</head>
<body>
	<div class="top_container">
		<div id="login_box">
			<div id="login_list1">
				<ul class="login_list">
					<li> ${id} 님</li>	<!-- 22.09.29 효정씨가 한 부분 수정 [김건희]	 -->					
				</ul>
			</div>
			<div id="login_list2">
			<!-- 22.09.30 로그아웃 구현 [김건희]	 -->
				<ul class="logout">
					<li><a href="<%=context%>/logout.do"><button type="button" class="" onclick="">로그아웃</button></a></li>
				</ul>	
			</div>			
		</div>
		<!-- 22.10.04 링크 연결 및 수정 [김건희] -->
		<div id="menu_box">
			<ul class="menu_list">
				<li><a href="<%=context%>/hyojung/loginHomeView.jsp">홈</a></li> <!-- 22.09.30[김건희] 수정 -->
				<li><a href="<%=context%>/JiHyeon/informationFormIn.jsp">볼링장정보</a></li> <!-- 22.09.30[김건희] 수정 -->
				<li><a href="<%=context%>/reschange.do">예약</a></li>
				<li><a href="<%=context%>/JiHyeon/mapFormIn.jsp">오시는길</a></li>
				<li><a href="board.do">게시판</a></li>
				<li><a href="<%=context%>/mypage.do">마이페이지</a></li> <!-- 22.09.30[김건희] 수정 -->
			</ul>
		</div>
	</div>
	<div class="body1_container">
		<!-- 메인 큰사진 -->
	</div>
	<div class="body2_container">
		<p>이대역과 강남점 두개의 지점으로 운영되는 중앙볼링장입니다.
		<br>
		오리지널 존과 락 존으로 나뉘어져 있으며, 현재 파이브베가 이벤트가 진행중입니다.</p>
	</div>
	<div class="body3_container">
		<div id="store_contents">
			<table>
				<tr>
					<td style="padding-right: 415px; font-weight: bold;">매장소개</td>
					<td style="padding-left: 400px; font-weight: bold;"><a href="information.do">&lt; 더보기</a></td>
				</tr>
			</table>
			<hr color="#90C3FF" width="960px" size="1">	
		</div>
		<div class="img_container">
			<table>
				<tr>
					<td class="img1"></td>
					<td class="img2"></td>
					<td class="img3"></td>
					<td class="img4"></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="body4_container">
		<div id="use_contents">
			<table>
				<tr>
					<td style="padding-right: 415px; font-weight: bold;">이용안내</td>
					<td style="padding-left: 400px; font-weight: bold;"><a href="information.do">&lt; 더보기</a></td>
				</tr>
			</table>
			<hr color="#90C3FF" width="960px" size="1">	
		</div>
		<div id="time_table">
			<table>
				<thead>
					<tr>
						<th colspan="2">이용시간</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td>일 ~ 목</td>
						<td>10 : 00 ~ 24 : 00</td>				
					</tr>
					<tr>
						<td>금 ~ 토</td>
						<td>10 : 00 ~ 02 : 00</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div id="money_table">
			<table>
				<thead>
					<tr>
						<th colspan="2">이용요금</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td>오전(10 : 00 ~ 12 : 00)</td>
						<td>10,000원 (1인당)</td>
					</tr>
					<tr>
						<td>오후(12 : 00 ~ 02 : 00)</td>
						<td>10,000원 (1인당)</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<div class="body5_container">
		<div id="map_contents">
			<table>
				<tr>
					<td style="padding-right: 415px; font-weight: bold;">오시는길</td>
					<td style="padding-left: 400px; font-weight: bold;"><a href="map.do">&lt; 더보기</a></td>
				</tr>
			</table>
			<hr color="#90C3FF" width="960px" size="1">	
		</div>	
	</div>
	<!-- 지도API 포인트 두개 -->	
	<div id="map" style="width:900px;height:500px; margin:auto; margin-top:10px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=429b83497376fa35c5bb4d95e24ef6ca"></script>
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        //center: new kakao.maps.LatLng(37.5564261, 127.550458), // 지도의 중심좌표
        center: new kakao.maps.LatLng(37.529521713, 126.964540921),
        level: 8 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '이대점', 
        latlng: new kakao.maps.LatLng(37.5564261, 126.945169)
    },
    {
        title: '강남점', 
        latlng: new kakao.maps.LatLng(37.4996191, 127.030458)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>
	<div class="body6_container">
		<p>중앙볼링장은 이대점과 강남점 2개의 지점으로 운영되고 있습니다.<br>
		   자세한 내용은 오시는길에서 확인을 부탁드립니다.</p>
	</div>
	<div class="footer">
		<div id="footer_list">
			<div class="list_text1">
				<p>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</p>
			</div>	
			<div class="list_text2">
				<p>이메일  choongang@naver.com</p>
			</div>	
		</div>
	</div>
</body>
</html>
