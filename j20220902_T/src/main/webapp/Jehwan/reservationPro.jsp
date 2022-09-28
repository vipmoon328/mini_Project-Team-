<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/reservationStyle.css" type="text/css" rel="stylesheet">
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajaxSetup({
			type 	 : 	'POST',
			url		 :	'allCheck.do',
			processData : false,
			success	 :	function(data){
				console.log("123");
				console.log(data);
				var data1 = JSON.parse(data);
				console.log(data1);
				buildTimeTable(data1);
			}
		});
		
		inputDay = new Date('${ res_date }');
		today = new Date('${ res_date }'); 
		if(!('${ brnNum }' ==null || '${ brnNum }' == '')){
			$('#jijum').val('${brnNum}').prop("selected",true);
		}
		make_sendData();
		buildCalendar(today);
		
		
		
		$(document).on("click",".possible", function(){
			var num = $(".checked").length;
			if(num == 0){
				$("#test td").not('.impossible').removeClass('possible').css('background-color', 'lightgray');
			}
			$(this).addClass('checked').removeClass('possible').css('background','lightgreen');
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
			$("#test tr:nth-child(" + first + ") td:nth-child(" + col + ")").not(".impossible").removeClass('possible').css('background-color', 'lightgray');
			$(this).removeClass('checked').addClass('possible').css('background-color','skyblue');
			print_message();
		});
		
		$(document).on("click",".checked:last", function(){
			if($(".checked").length <= 1){
				reset_table();
				return;
			}
			var last = $(this).parent().index() + 2;
			var col = $(this).index() + 1;
			$("#test tr:nth-child(" + last + ") td:nth-child(" + col + ")").not(".impossible").removeClass('possible').css('background-color', 'lightgray');
			$(this).removeClass('checked').addClass('possible').css('background-color','skyblue');
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
			
			$(".selectDate").removeClass('selectDate').css('background','pink');
			today = new Date(today.getFullYear(),today.getMonth(),$(this).attr('id'));
			$(this).addClass('selectDate').css('background','cyan');
			console.log(today.getDate());
			make_sendData();
		});
		
		$(document).on("click","#prev", function(){
			 $("#calander_test").empty();
             today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
             buildCalendar(today);
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
	             amount : "100",
	             buyer_email : "naver@naver.com",
	             buyer_name : "홍길동",
	             buyer_tel : "010-1234-5678",
	             buyer_addr : "서울시",
	             buyer_postcode : '123-456',
	            //m_redirect_url : 'http://www.naver.com'
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
            buildCalendar(today);
            make_sendData();
		});
	});
	
	function make_sendData() {
		var sendData = "inputYear=" + today.getFullYear() + "&inputMonth=" + today.getMonth() + "&inputDate=" + today.getDate()  + "&branch=" + $("#jijum").val();
        $.ajax({
        	data	: sendData
		});
	}
	
	function buildCalendar(today) {
        
		$("#calander_test").empty();
		
        nowYear = today.getFullYear();
        nowMonth = today.getMonth();
        nowDay = today.getDay();
        nowDate = today.getDate();
        firstDate = new Date(nowYear,nowMonth,1).getDate();
        firstDay = new Date(nowYear,nowMonth,1).getDay();
        lastDate = new Date(nowYear,nowMonth+1,0).getDate();
        lastDay = new Date(nowYear,nowMonth+1,0).getDay();
        
        
        $("#today").html(nowYear+"년 "+(nowMonth+1)+"월 " + nowDate +"일(" + nowDay + ")");
        $(".year_mon").text(nowYear+"년 "+(nowMonth+1)+"월");
		
        var tag = "<tr>"
        for (i=0; i<firstDay; i++) {
        	tag += "<td></td>";
        }
        for (i=1; i <=lastDate; i++){
            var plusDate = new Date(nowYear,nowMonth,i).getDay();
            if (plusDate==0) {
            	tag += "</tr><tr>";
            }
            tag += "<td class='date' id='" + i +"'>"+ i +"</td>";
        }
        while(lastDay!=6){
        	tag += "<td></td>";
        	lastDay++;
        }
        tag += "</tr>";
        $("#calander_test").append(tag);
        
        $(".selectDate").removeClass('selectDate').css('background','pink');
		$("#" + nowDate).addClass('selectDate').css('background','cyan');
    }

	function print_message(){
		var text="";
		var lane = $('.checked').filter(':first').index();
		var start = parseInt($('.checked').filter(':first').parent().index())  + 10;
		var end = parseInt($('.checked').filter(':last').parent().index()) + 10;
		var jijum = $("#jijum").val();
		var jijum_name = $("#jijum option:selected").text();
		text += "<input type='hidden' name='inputYear' value='" + today.getFullYear() +"'><input type='hidden' name='inputMonth' value='" + today.getMonth() +"'><input type='hidden' name='inputDate' value='" + today.getDate() +"'>";
		text += "<input type='hidden' name='start' value='"+ start +"'><input type='hidden' name='end' value='"+ (end+1) +"'>";
		text += "<input type='hidden' name='lane' value='" + lane +"'><input type='hidden' name='jijum' value='" + jijum +"'>";
		text += "지점 : " +jijum_name +"<p>";
		text += "레인 : " +lane +"<p>";
		text += "시간 : " + start +":00 ~ " + (end+1) + ":00<p>";
		text += "인원수 : <input type='text' name='many' value='1' required='required'><p>";
		if(end < 12){
			cost= (end - start + 1) * 20000; 
		}else if(start < 12 && end >= 12){
			cost = 20000 * (12-start) + 50000 * (end-11);
		}else{
			cost= (end - start + 1) * 50000;
		}
		text += "금액 : " + cost + "원 <input type='hidden' name='cost' value='" + cost +"'><input type='hidden' name='res_rid' value='" + '${ res_rid }' +"'>";
		$('#msg').html(text);
	}
	
	function buildTimeTable(data) {
		$('#msg').html("");
		var maxtime = 24;
		if(today.getDay() == 5 || today.getDay() == 6){
			maxtime = 26;
		}
		$("#test").empty();
		var tag;
		for(var i = 10 ; i < maxtime ; i ++){
			tag = "<tr><th>" + (i%24) + ":00 ~ "+ ((i+1)%24) +":00</th>";
			for(var j = 1 ; j < 9 ; j ++){
				tag +=  "<td bgcolor='skyblue' class = 'possible'</td>";
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
				$("#test tr:nth-child(" + j + ") td:nth-child(" + lane + ")").addClass('impossible').removeClass('possible').css('background-color', 'red');
			}
		}
		
		if(!('${ brnNum }' ==null || '${ brnNum }' == '')){
			if((today.getFullYear() == inputDay.getFullYear())&&(today.getMonth() == inputDay.getMonth())&&(today.getDate() == inputDay.getDate())&&($("#jijum option:selected").val() == '${ brnNum }')){
				$("#test td").not('.impossible').removeClass('possible').css('background-color', 'lightgray');
				console.log(parseInt('${ start }') -9);
				console.log(parseInt('${ end }') -9);
				console.log('${ lane }');
				console.log(today);
				console.log(inputDay);
				start = parseInt('${ start }') -9;
				end = parseInt('${ end }') -9;
				lane = parseInt('${ lane }') + 1;

				for(var i=start ; i < end ; i++){
					$("#test tr:nth-child(" + i + ") td:nth-child(" + lane + ")").addClass('checked').removeClass('impossible').css('background-color', 'lightgreen');
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
		$("#test td").not('.impossible').removeClass('checked').addClass('possible').css('background-color', 'skyblue');
	}
	function add_probable() {
		var col = $('.checked').filter(':first').index();
		var first = $('.checked').filter(':first').parent().index();
		var last = $('.checked').filter(':last').parent().index();
		last +=2;
		col +=1;
		$("#test tr:nth-child(" + first + ") td:nth-child(" + col + ")").not('.impossible').addClass('possible').css('background-color', 'skyblue');
		$("#test tr:nth-child(" + last + ") td:nth-child(" + col + ")").not('.impossible').addClass('possible').css('background-color', 'skyblue');
	}
	

</script>
<body>
	
	<div id="content_container">
	<select id="jijum">
			<option value="1">이대</option>
			<option value="2">강남</option>
	</select><p>
		<table id="calendar">
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
		
		<form action="insertResult.do" id="frm"><h2>예약 현황</h2><span id="msg"></span><input type="button" id="insert" value="결제"></form>
		
		<table border="1px" id="test_table">
		<caption><span id="today"></span><input type="button" id="reset" value="초기화" onclick="reset_table()"></caption>
			<thead>
				<tr><th></th><th>1레인</th><th>2레인</th><th>3레인</th><th>4레인</th><th>5레인</th><th>6레인</th><th>7레인</th><th>8레인</th></tr>
			</thead>
			<tbody id="test">
			</tbody>
		</table>
		
		
	</div>
	
</body>
</html>