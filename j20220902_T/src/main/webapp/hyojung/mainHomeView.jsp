<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  String context = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중앙볼링장</title>
<!-- 22.10.12 css 수정 [이효정] -->
<%-- <link rel="stylesheet" href="<%=context%>/css/mainHomepage.css?ver0.1" type="text/css"> --%>
<link href="<%=context%>/css/font.css" rel="stylesheet" >
<style type="text/css">
	/* 모든 div 테두리 생성 */
	/* div {border: 1px solid black;} */
	/* 모든 a태그 없애기 */
	a{
		text-decoration: none;
        color: inherit;
        display: inline-block;
        position: relative;
        padding-bottom: 5px;
	}
	/* login/menu 영역 */
/*================================================================================*/
	.top_container{
				   width: 1000px;
				   height: 90px;
				   padding: 1px;
				   margin: 0 auto;
				   padding-bottom: 0px;
	}
	/* login영역 */
	#login_box{
				width: 350px;
				margin: 0 auto;
				height: 60px;
				float: right;
				margin-top: 20px;
				margin-bottom: 20px;
				padding: 0px;
				
	}
	#login_box li{
				list-style: none;
				float: left;
				padding-right: 30px;    /* 글자 사이사이 여백 */
		    	font-size:15px;			/* 글자크기 */
		    	font-weight:bold;
		    	color: black;			/* 글자색상 */
		    	padding-top: 15px;
	}
	#login_box li a:after {
                          content:"";
                          position: absolute;
                          left: 50%;
                          bottom: 0;
         				  width: 0;
          				  height: 1px;
          				  background-color: #90C3FF;
          				  transition: all .5s;
    }
    #login_box li a:before {
         				  content:"";
          				  position: absolute;
          				  right: 50%;
        				  bottom: 0;
                          width: 0;
                          height: 1px;
                          background-color: #90C3FF;
                          transition: all .5s;
    }
    #login_box li a:hover:after {
          						width: 50%
    }
    #login_box li a:hover:before {
         						 width: 50%
    }
	.login_list{
				float: right;
	}
	/* menu 영역 */
	#menu_box{
				width: 550px;
				height: 40px;
				float: left;
				margin-top: 20px;
				margin-bottom: 10px;
				padding: 10px;
				padding-left: 0px;
				margin-left: 0px;
	}
 	#menu_box li{
				list-style: none;
				float: left;
				padding-right: 30px;    /* 글자 사이사이 여백 */
		    	font-size:15px;			/* 글자크기 */
		    	font-weight:bold;
		    	/*color: black;			 글자색상 */
		    	padding-top: 5px;		    	
	} 
	#menu_box li a:after {
                          content:"";
                          position: absolute;
                          left: 50%;
                          bottom: 0;
         				  width: 0;
          				  height: 1px;
          				  background-color: #90C3FF;
          				  transition: all .5s;
    }
    #menu_box li a:before {
         				  content:"";
          				  position: absolute;
          				  right: 50%;
        				  bottom: 0;
                          width: 0;
                          height: 1px;
                          background-color: #90C3FF;
                          transition: all .5s;
    }
    #menu_box li a:hover:after {
          						width: 50%
    }
    #menu_box li a:hover:before {
         						 width: 50%
    }
	.menu_list{
				margin-right: 0px;
	}
/*================================================================================*/
	/* 메인사진 영역 */
	.body1_container {
					height : 500px; 			/* 높이 */
					margin-bottom: 10px;       /* 아래 요소들과의 간격 */
					background-color: black;   /* 사진삽입 여백 */
					background: url("images/main_img.jpg") ;
					background-position: center;
	}
/*================================================================================*/
	/* 움직이는 아이콘 */
	.movebutton {
		text-decoration: none;
		display: block; 
		position: relative;
		width: 50px;
		padding: 0;
		margin: 20px;
		font-weight: 600;
		text-align: center;
		line-height: 50px;
		color: #FFF;
		border-radius: 50px;
		transition: all 0.2s ;
		background: #90C3FF;
		box-shadow: 0px 0px 0px 0px #5A8DF3;
	} 
	.movebutton:hover {
		box-shadow: 0px 0px 0px 5px #5A8DF3;
	}
/*================================================================================*/	

	/* 메인사진 밑 문장 */
	.body2_container{
					text-align: center;
					background-color: white;
					width: 960px;  
					margin: 0 auto;          /* 창 센터 배치 */
					height: 150px;
					padding-top: 60px;	
	}
/*================================================================================*/
	/* 매장소개 영역 */
	.body3_container{
					width: 960px;
					margin: 0 auto;          /* 창 센터 배치 */
					padding-top: 30px;
					padding-bottom: 50px;
	}
	.img_container {
					width: 930px;
					margin: 0 auto;
					float: center;
					padding-top: 50px;
					padding-bottom: 50px;
	}			
	.img1 {
			width: 230px;
			height: 200px;
			margin: 10px;
			background-image: url("images/m1.JPG");
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;		
	}
	.img2 {
			width: 230px;
			height: 200px;
			margin: 10px;
			background-image: url("images/m2.JPG");
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;		
	}
	.img3 {
			width: 230px;
			height: 200px;
			margin: 10px;
			background-image: url("images/m3.JPG");
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;		
	}
	.img4 {
			width: 230px;
			height: 200px;
			margin: 10px;
			background-image: url("images/m4.JPG");
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;		
	}
/*================================================================================*/
	/* 이용안내 영역 */
	.body4_container{
					width: 960px;
					margin: 0 auto;          /* 창 센터 배치 */
					height: 300px;
					padding-top: 30px;
					padding-bottom: 30px;
	}
	.body4_container table td{
							width: 280px;
							text-align: center;
							
	}
	#time_table{
				width: 450px;
				height: 200px;
				float: left;
				padding: 10px;
				padding-top: 70px;
				
	}
	#time_table th {
					padding: 10px;
	}
	#time_table td {
					padding: 10px;
	}

	#money_table{
				width: 450px;
				height: 200px;
				float: right;
				padding: 10px;
				padding-top: 70px;			
	}
	#money_table th {
					padding: 10px;
	}
	#money_table td {
					padding: 10px;
	}	
/*================================================================================*/
	/* 오시는길 영역 */
	.body5_container{
					width: 960px;
					margin: 0 auto;          /* 창 센터 배치 */
					padding-top: 30px;
					padding-bottom: 30px;
	}
	.body6_container {
					width: 960px;
					margin: 0 auto;          /* 창 센터 배치 */
					padding-top: 30px;
					padding-bottom: 100px;
					text-align: center;
	}
/*================================================================================*/
	/* 발 영역 */
	.footer{
			height: 120px;
			background-color: black;
			color: white;
			text-align: center;
			padding-top: 50px;
			margin: 0px;
	}
	#footer_list{
				width: 960px;
				height: 100px;
				margin: 0 auto;		
				padding: 10px;	
	}
 	.list_text1 pre{
				  font-size: 13px;
	}
	.list_text2 pre{
				  font-size: 13px;
	} 

</style>
</head>
<body style="margin: 0px">
	<div class="top_container">
		<div id="login_box">
		<!-- 22.10.04 링크 연결 및 수정 [김건희] -->
			<ul class="login_list">
				<li><a href="<%=context%>/GunHee/loginForm.jsp">로그인 </a></li> <!-- 22.09.29 효정씨가 링크한 부분 수정함 1 [김건희] -->
				<li><a href="<%=context%>/GunHee/signUpForm.jsp">회원가입</a></li> <!-- 22.09.29 효정씨가 링크한 부분 수정함 2 [김건희] -->
			</ul>	
		</div>
		<!-- 22.10.04 링크 연결 및 수정 [김건희] 비회원은 예약이 하므로 불가표시-->
		<div id="menu_box">
			<ul class="menu_list">
				<li><a href="<%=context%>/hyojung/mainHomeView.jsp">홈</a></li>
				<li><a href="<%=context%>/JiHyeon/informationFormOut.jsp">볼링장정보</a></li>
				<li><a href="<%=context%>/GunHee/res_check.jsp">예약</a></li>
				<li><a href="<%=context%>/JiHyeon/mapFormOut.jsp">오시는길</a></li>
				<li><a href="<%=context%>/list.do">게시판</a></li>
			</ul>
		</div>
	</div>
	<div class="body1_container">
		<!-- 메인 큰사진 -->
	</div>
			
	<!--원하는 위치에 버튼 넣기-->
	<a href="tel:02-313-1711" title="" class="movebutton" style="display:scroll;position:fixed;bottom:160px;right:10px;">CALL</a>
	<a href="<%=context%>/JiHyeon/mapFormOut.jsp"   title="" class="movebutton" style="display:scroll;position:fixed;bottom:90px;right:10px;">MAP</a>
	<a href="#" 			  title="" class="movebutton" style="display:scroll;position:fixed;bottom:20px;right:10px;">TOP</a>
		
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
					<td style="padding-left: 400px; font-weight: bold;"><a href="<%=context%>/JiHyeon/informationFormOut.jsp#content2">&lt; 더보기</a></td>
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
					<td style="padding-left: 400px; font-weight: bold;"><a href="<%=context%>/JiHyeon/informationFormOut.jsp">&lt; 더보기</a></td>
				</tr>
			</table>
			<hr color="#90C3FF" width="960px" size="1">	
		</div>
		<div id="time_table">
			<table border="1" style="border: solid; border-color: #90C3FF;">
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
			<table border="1" style="border: solid; border-color: #90C3FF;">
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
						<td>50,000원 (1인당)</td>
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
					<td style="padding-left: 400px; font-weight: bold;"><a href="<%=context%>/JiHyeon/mapFormOut.jsp">&lt; 더보기</a></td>
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
				<pre>쓰리원이조  |  중앙볼링장  |  서울시 마포구 신촌로 176  |  전화번호  02-313-1711</pre>
			</div>
			<div class="list_text2">
				<pre>이메일  choongang@naver.com</pre>
			</div>				
		</div>
	</div>
</body>
</html>
