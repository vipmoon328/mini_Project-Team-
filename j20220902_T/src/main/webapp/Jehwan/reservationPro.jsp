<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   String context = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=context%>/css/ResStyle.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajaxSetup({
			type 	 : 	'POST',
			url		 :	'<%=context%>/allCheck.do',
			processData : false,
			success	 :	function(data){
				console.log("123");
				console.log(data);
				var data1 = JSON.parse(data);
				console.log(data1);
				buildTimeTable(data1);
			}
		});
		realDay = new Date();
		inputDay = new Date('${ res_date }');
		today = new Date('${ res_date }'); 
		$('#jijum').val('${brnNum}').prop("selected",true);
		if(today.getMonth()<=realDay.getMonth()){
		 	$("#prev").hide();
         }
		
		make_sendData();
		buildCalendar();
		
		
		
		$(document).on("click",".possible", function(){
			var num = $(".checked").length;
			if(num == 0){
				$("#test td").not('.impossible').not($(this)).removeClass('possible').addClass('cantSelect');
			}
			$(this).addClass('checked').removeClass('possible');
			add_probable();
			print_message();
		});
		
		/* $(document).on("click",".checked:first , .checked:last", function(){
				//var num = $(".checked").length;
				if($(".checked").length <= 1){
					reset_table();
					return;
				}
				$(this).removeClass('checked');
				$(".possible").removeClass('possible').css("background-color","lightgray");
				add_probable();
				print_message();
		}); */
		
		$(document).on("click",".checked:first", function(){
			//var num = $(".checked").length;
			if($(".checked").length <= 1){
				reset_table();
				return;
			}
			var first = $(this).parent().index();
			var col = $(this).index() + 1;
			$("#test tr:nth-child(" + first + ") td:nth-child(" + col + ")").not(".impossible").removeClass('possible').addClass('cantSelect');
			$(this).removeClass('checked').addClass('possible');
			print_message();
		});
		
		$(document).on("click",".checked:last", function(){
			if($(".checked").length <= 1){
				reset_table();
				return;
			}
			var last = $(this).parent().index() + 2;
			var col = $(this).index() + 1;
			$("#test tr:nth-child(" + last + ") td:nth-child(" + col + ")").not(".impossible").removeClass('possible').addClass('cantSelect');
			$(this).removeClass('checked').addClass('possible');
			print_message();
		});
		
		$(document).on("change","#jijum", function(){
			make_sendData();
            
            /* inputYear : today.getFullYear(),
			   inputMonth: today.getMonth(),
			   inputDate : today.getDate(),
			   branch	 : $("#jijum").val() */
		});
		

		
		
		$(document).on("click",".date", function(){
			
			$(".selectDate").removeClass('selectDate');
			today = new Date(today.getFullYear(),today.getMonth(),$(this).attr('id'));
			$(this).addClass('selectDate');
			console.log(today.getDate());
			make_sendData();
		});
		
		$(document).on("click","#prev", function(){
			 $("#calander_test").empty();
             today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
             if((today.getFullYear()==realDay.getFullYear())&&(today.getMonth()==realDay.getMonth())){
			 	$("#prev").hide();
			 	if(today.getDate()<realDay.getDate()){
			 		today = realDay;
			 	}
             }
             buildCalendar();
	         make_sendData()
		});
		
		$(document).on("click","#insert", function(){
			
			var IMP = window.IMP; // 생략가능
	        IMP.init('imp06482341'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        var msg;
	        
	        IMP.request_pay({
	        	 pg : 'kakaopay',
	             pay_method : 'card',
	             merchant_uid : 'merchant_' + new Date().getTime(),
	             name : '볼링장 실험',
	             amount : $('input[name=cost]').val(),
	        }, function(rsp) {
	            if ( rsp.success ) {
	            	alert("결제성공");
	            	document.getElementById("frm").submit();
	           }  else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                alert(msg);
	            }
	        });
		});
		
		$(document).on("click","#next", function(){
			$("#calander_test").empty();
            today = new Date ( today.getFullYear(), today.getMonth()+1, today.getDate());
            if(today.getMonth()>realDay.getMonth()){
			 	$("#prev").show();
             }
            buildCalendar();
            make_sendData();
		});
	});
	
	function make_sendData() {
		var sendData = "inputYear=" + today.getFullYear() + "&inputMonth=" + today.getMonth() + "&inputDate=" + today.getDate()  + "&branch=" + $("#jijum").val();
        $.ajax({
        	data	: sendData
		});
	}
	
	function buildCalendar() {
        
		$("#calander_test").empty();
		
        nowYear = today.getFullYear();
        nowMonth = today.getMonth();
        nowDay = today.getDay();
        nowDate = today.getDate();
        firstDate = new Date(nowYear,nowMonth,1).getDate();
        firstDay = new Date(nowYear,nowMonth,1).getDay();
        lastDate = new Date(nowYear,nowMonth+1,0).getDate();
        lastDay = new Date(nowYear,nowMonth+1,0).getDay();
        
        
        $(".year_mon").text(nowYear+"년 "+(nowMonth+1)+"월");
		
        var tag = "<tr>"
        for (i=0; i<firstDay; i++) {
        	tag += "<td class='cantDate'></td>";
        }
        for (i=1; i <=lastDate; i++){
            var plusDate = new Date(nowYear,nowMonth,i).getDay();
            if (plusDate==0) {
            	tag += "</tr><tr>";
            }
            if((nowYear<=realDay.getFullYear())&&(nowMonth<=realDay.getMonth())&&(i<realDay.getDate())){
            	tag += "<td class='cantDate'>" + i +"</td>";
            }else{
            	tag += "<td class='date' id='" + i +"'>"+ i +"</td>";
            }
        }
        while(lastDay!=6){
        	tag += "<td class='cantDate'></td>";
        	lastDay++;
        }
        tag += "</tr>";
        $("#calander_test").append(tag);
        
        $(".selectDate").removeClass('selectDate');
		$("#" + nowDate).addClass('selectDate');
    }

	function print_message(){
		var text="";
		var lane = $('.checked').filter(':first').index();
		var start = parseInt($('.checked').filter(':first').parent().index())  + 10;
		var end = parseInt($('.checked').filter(':last').parent().index()) + 10;
		var jijum = $("#jijum").val();
		var jijum_name = $("#jijum option:selected").text();
		if(end < 12){
			cost= (end - start + 1) * 20000; 
		}else if(start < 12 && end >= 12){
			cost = 20000 * (12-start) + 50000 * (end-11);
		}else{
			cost= (end - start + 1) * 50000;
		}
		text = "<h2>예약 현황</h2>";
		text += "지점 : " + jijum_name +"<p>";
		text += "레인 : " +lane +"<p>";
		text += "시간 : " + start +":00 ~ " + (end+1) + ":00<p>";
		text += "인원수 : <input type='text' name='many' value='1' required='required'><p>";
		text += "금액 : " + cost + "원<p>";
		text += "<input type='button' id='insert' value='결제'>";
		text += "<input type='hidden' name='inputYear' value='" + today.getFullYear() +"'>";
		text += "<input type='hidden' name='inputMonth' value='" + today.getMonth() +"'>";
		text += "<input type='hidden' name='inputDate' value='" + today.getDate() +"'>";
		text += "<input type='hidden' name='start' value='"+ start +"'>";
		text += "<input type='hidden' name='end' value='"+ (end+1) +"'>";
		text += "<input type='hidden' name='lane' value='" + lane +"'>";
		text += "<input type='hidden' name='cost' value='" + cost +"'>";
		text += "<input type='hidden' name='jijum' value='" + jijum +"'>";
		
		text += "<input type='hidden' name='res_rid' value='" + '${ res_rid }' +"'>";
		text += "<input type='hidden' name='select_option' value='" + '${ select_option }' +"'>";
		text += "<input type='hidden' name='currentPage' value='" + '${ currentPage }' +"'>";
		$('#msg').html(text);
	}
	
	function buildTimeTable(data) {
		var dayInfo = "월";
		switch(today.getDay()){
	 	case 0 : dayInfo="일"; break;
	    case 1 : dayInfo="월"; break;
	    case 2 : dayInfo="화"; break;
	    case 3 : dayInfo="수"; break;  
	    case 4 : dayInfo="목"; break;
	    case 5 : dayInfo="금"; break;  
	    case 6 : dayInfo="토"; break;   
	}
		$("#today").html(today.getFullYear()+"년 "+(today.getMonth()+1)+"월 " + today.getDate() +"일(" + dayInfo + ")");
		$('#msg').html("");
		var maxtime = 24;
		if(today.getDay() == 5 || today.getDay() == 6){
			maxtime = 26;
		}
		$("#test").empty();
		var tag;
		for(var i = 10 ; i < maxtime ; i ++){
			tag = "<tr><th>" + (i%24) + ":00~"+ ((i+1)%24) +":00</th>";
			for(var j = 1 ; j <= '${possibleLane}' ; j ++){
				tag +=  "<td class = 'possible " + j +"'></td>";
			}
			tag += "</tr>";
			$("#test").append(tag);
		}
		
		for(var i=0 ; i < data.length ; i++){
			console.log(parseInt(data[i]["start"])-9);
			console.log(data[i]["end"]-9);
			console.log(data[i]["lane"]);

			var start = parseInt(data[i]["start"])-9;
			var end = parseInt(data[i]["end"])-9;
			var lane = parseInt(data[i]["lane"]) + 1;
			
			for(var j=start ; j < end ; j++){
				$("#test tr:nth-child(" + j + ") td:nth-child(" + lane + ")").addClass('impossible').removeClass('possible');
			}
		}
		if((today.getFullYear() == realDay.getFullYear())&&(today.getMonth() == realDay.getMonth())&&(today.getDate() == realDay.getDate())){
			console.log(realDay.getHours());
			for(var i = 0 ; i < realDay.getHours()-8 ; i++){
				$("#test tr:nth-child(" + i + ") td").addClass('impossible').removeClass('possible').css('background-color', 'lightgray');
			}
		}

		if(!('${ res_rid }' ==null || '${ res_rid }' == '')){
			if((today.getFullYear() == inputDay.getFullYear())&&(today.getMonth() == inputDay.getMonth())&&(today.getDate() == inputDay.getDate())&&($("#jijum option:selected").val() == '${ brnNum }')){
				$("#test td").not('.impossible').removeClass('possible').addClass('cantSelect');
				console.log(parseInt('${ start }') -9);
				console.log(parseInt('${ end }') -9);
				console.log('${ lane }');
				console.log(today);
				console.log(inputDay);
				start = parseInt('${ start }') -9;
				end = parseInt('${ end }') -9;
				lane = parseInt('${ lane }') + 1;

				for(var i=start ; i < end ; i++){
					$("#test tr:nth-child(" + i + ") td:nth-child(" + lane + ")").addClass('checked').removeClass('impossible');
				}
				add_probable();
				print_message();
				$('input[name=many]').attr('value','${customer }');
			}
		}
	}
	
	function reset_table(){
		$('#many').val("1");
		$('#msg').html("");
		$("#test td").not('.impossible').removeClass('checked').addClass('possible').removeClass('cantSelect');
	}
	function add_probable() {
		var col = $('.checked').filter(':first').index();
		var first = $('.checked').filter(':first').parent().index();
		var last = $('.checked').filter(':last').parent().index();
		last +=2;
		col +=1;
		$("#test tr:nth-child(" + first + ") td:nth-child(" + col + ")").not('.impossible').addClass('possible').removeClass('cantSelect');
		$("#test tr:nth-child(" + last + ") td:nth-child(" + col + ")").not('.impossible').addClass('possible').removeClass('cantSelect');
	}
	

</script>
<body>
<div id="wrapper">
	<div class="flex-container flex-end">
			<div class="item_first">
				<ul>
					<li>${id}님</li>
					<li><a href="<%=context%>/logout.do">로그아웃</a></li>
				</ul>
			</div> 
	</div>
		
	<hr color="#D5D5D5" width="100%" size="1">	
		<div class="flex-container">
			<div class="item_second">
				<ul>
					<li>중앙볼링장</li>
					<li><a href="<%=context%>/hyojung/loginHomeView.jsp">홈</a></li>
					<li><a href="<%=context%>/JiHyeon/informationFormIn.jsp">볼링장정보</a></li>
					<li><a href="<%=context%>/reschange.do">예약</a></li>
					<li><a href="<%=context%>/JiHyeon/mapFormIn.jsp">오시는길</a></li>
					<li><a href="<%=context%>/list.do">게시판</a></li>
					<li><a href="<%=context%>/mypage.do">마이페이지</a></li>
				</ul>
			</div>
	</div>		
	
	<hr color="#D5D5D5" width="100%" size="1">
	<div class="flex-container">
			<div class="item_third"><h2>예약하기</h2></div>
		</div>		
	<hr color="#90C3FF" width="70%" size="1">
	<div id="dateSelectCon">
			<table id="calendar">
			<caption>
				<select id="jijum">
					<option value="0">이대</option>
					<option value="1">강남</option>
				</select>
			</caption>
		        <thead>
		            <tr>
		                <th><input id="prev" type="button" value="<"></th>
		                <th colspan="5" class="year_mon"></th>
		                <th><input id="next" type="button" value=">"></th>
		            </tr>
		            <tr>
		                <th>일</th>
		                <th>월</th>
		                <th>화</th>
		                <th>수</th>
		                <th>목</th>
		                <th>금</th>
		                <th>토</th>
		            </tr>
		        </thead>
		        <tbody id="calander_test">
		        </tbody>
	    	</table>
	    	<div id="form_container"><form action="<%=context%>/insertResult.do" id="frm"><span id="msg"></span></form></div>
	</div>

	<div id="timeTableCon">
		<table border="1px" id="test_table">
		<caption><span id="today"></span><input type="button" id="reset" value="초기화" onclick="reset_table()">
		<span id="color_info"><img src="<%=context%>/images/possible.png">선택 가능 시간<img src="<%=context%>/images/checked.png">선택 시간 <img src="<%=context%>/images/cantSelect.png">선택 불가<img src="<%=context%>/images/impossible.png">예약됨</span></caption>
			<thead>
				<tr><th></th>
				<c:forEach var="laneCnt" begin="1"  end="${possibleLane }">
					<th>${laneCnt }레인</th>
				</c:forEach>
				</tr>
			</thead>
			<tbody id="test">
			</tbody>
		</table>
		
		
	</div>
	<jsp:include page="footer.html"></jsp:include>
</div>
</body>
</html>