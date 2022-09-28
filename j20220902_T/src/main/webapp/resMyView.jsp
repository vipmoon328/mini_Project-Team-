<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajaxSetup({
			type 	 : 	'POST',
			url		 :	'myCheck.do',
			//dataType :	'json',
			success	 :	function(data){
				var data1 = JSON.parse(data);
				console.log(data1);
				reserve_list(data1);
			}
		});
		$.ajax({
			
		});
		$(document).on("click","#res_cancel", function(){
			
		});
		
		$(document).on("click",".change_res", function(){
			
		});
		
		$(document).on("click","#prev", function(){
			var sendData = "pageNum=" + $(this).val();
			$.ajax({
				data	: sendData
			});
		});
		
		$(document).on("click","#next", function(){
			var sendData = "pageNum=" + $(this).val();
			$.ajax({
				data	: sendData
			});
		});
		
		$(document).on("click",".numSelect", function(){
			var sendData = "pageNum=" + $(this).val();
			$.ajax({
				data	: {pageNum : $(this).val()}
			});
		});
		
		$(document).on("click",".res_change", function(){
			document.getElementById("frm" + $(this).parent().index()).submit();
		});
	});
	
	function change_res(i) {
		document.getElementById("frm" + i).submit();
	}
	
	function reserve_list(data) {
		$("#list").empty();
		var tag;
		for(var i=1 ; i < data.length ; i++){
			tag = "<tr>";
			if(data[i]["state"] == "방문전"){
				tag += "<td><input type='checkbox' name='cancel' id="+ i +"></td>";
			}else{
				tag += "<td></td>";  
			}
			tag += "<form action='reschange.do' id='frm"+ i +"'><td><input form='frm" + i + "' type='hidden' name='res_date' value='" + data[i]["res_date"] + "'>" + data[i]["res_date"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='brnNum' value='" + data[i]["brnNum"] + "'>" + data[i]["brnNum"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='lane' value='" + data[i]["lane"] + "'>" + data[i]["lane"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='start' value='" + data[i]["start"] + "'><input form='frm" + i + "' type='hidden' name='end' value='" + data[i]["end"] + "'>" + data[i]["start"] + ":00 ~ " + data[i]["end"] + ":00</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='customer' value='" + data[i]["customer"] + "'>" + data[i]["customer"] + "</td>";
			tag += "<td><input form='frm" + i + "' type='hidden' name='cost' value='" + data[i]["cost"] + "'>" + data[i]["cost"] + "</td>";
			tag += "<td>" + data[i]["state"] + "</td>";
			if(data[i]["state"] == "방문전"){
				tag += "<td><input form='frm" + i + "' type='submit' value='예약변경'></td>";
			}else{
				tag += "<td></td>";
			}
			tag += "</tr></form>";
			$("#list").append(tag);
			
		}
		var pageInfo ="";
		var startPage = parseInt(data[0]["startPage"]);
		var endPage   = parseInt(data[0]["endPage"]);
		var blockSize = parseInt(data[0]["blockSize"]);
		var pageCnt = parseInt(data[0]["pageCnt"]);
		if(startPage > blockSize){
			pageInfo+="<input id='prev' type='button' value='<'>";
		}
		for(startPage ; startPage<=endPage ; startPage++){
			pageInfo+="<input class='numSelect' type='button' value='" + startPage +"'>";
		}
		if(endPage < pageCnt){
			pageInfo+="<input id='next' type='button' value='>'>";
		}
		$('#pagenum').html(pageInfo);
		
	}
</script>
<body>
	<div id="content_container">
	<form action="resCancel.do" id="cancel_form"><input type="button" id="select_all" value="전체 선택"><input type="button" id="res_cancel" value="예약 취소"></form>
		<table border="1px" id="test_table" style="margin : auto">
			<thead>
				<tr><th>예약취소</th><th>예약일자</th><th>지점</th><th>레인</th><th>시간</th><th>인원</th><th>금액</th><th>방문/취소</th><th>예약변경</th></tr>
			</thead>
			<tbody id="list">
			</tbody>
		</table>
		
		<div style="text-align: center" id="pagenum">
			
		</div>
	</div>
</body>
</html>