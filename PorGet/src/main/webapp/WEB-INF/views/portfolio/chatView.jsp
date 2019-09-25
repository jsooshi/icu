<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<html>
<head>

<!-- <link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap-reboot.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/page.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/style.css"> -->
<script src="/porget/js/jquery-3.js"></script>  
<script src="/porget/js/sockjs.min.js"></script>  

<style>
</style>
</head>

<body>

<c:set var="profile" value='<%=session.getAttribute("uname")%>' />



	<div class="col-12">
		<div class="col-2" style="float: left">
			<span> 목록 </span>
		</div>
		<div class="col-8" style="float: left; text-align: center;">
			${toUname } 님과 대화</div>
		<div class="col-2" style="float: right">
			<span> 닫기 </span>
		</div>



	</div>

	<!-- 채팅 내용 -->
	<div class="col-12">
		<div class="col-11"
			style="margin: 0 auto; border: 1px solid #01D1FE; height: 400px; border-radius: 10px; overflow:scroll" id = "chatArea">

			<div id="chatMessageArea" style = "margin-top : 10px; margin-left:10px;"></div>




		</div>
	</div>

	<!-- 채팅 입력창 -->
	<div class="col-12" style="margin-top: 20px; margin-bottom: 15px;">
		<div class="col-12" style="float: left">
			<textarea class="form-control"
				style="border: 1px solid #01D1FE; height: 65px; float: left; width: 80%"
				placeholder="Enter ..." id = "message">


				</textarea>
			<span
				style="float: right; width: 18%; height: 65px; text-align: center; background-color: #01D1FE; border-radius: 5px;">
				<a
				style="margin-top: 30px; text-align: center; color: white; font-weight: bold;" id = "sendBtn"><br>전송</a>
			</span>
		</div>

	</div>


<%-- <img id="profileImg" class="img-fluid"
					src="/displayFile?fileName=${userImage}&directory=profile" style = "display:none">
<input type="text" id="nickname" value = "${user_name }" style = "display:none">
 <input type="button" id="enterBtn" value="입장" style = "display:none">
 <input type="button" id="exitBtn" value="나가기" style = "display:none"> --%>
<script type="text/javascript">
	var socket = null;
	connect();
 

		 function connect() {
			 	var ws = new WebSocket("ws://localhost/porget/chat");
			 	sock = ws
			    sock.onopen = function() {
			        console.log('open');
			    };
			    sock.onmessage = function(evt) {
		    	 var data = evt.data;
		    	   console.log(data)
		  		   var obj = JSON.parse(data)  	   
		    	   console.log(obj)
		    	   appendMessage(obj.chatContext, obj.senderUname);
			    };
			    sock.onclose = function() {
			    	 appendMessage("연결을 끊었습니다.");
			        console.log('close');
			    };
			}
	
	
	
	
	 function send() {
	  var msg = $("#message").val();
	   if(msg != ""){
		  message = {};
		  message.chatContext = $("#message").val()
	  	  message.toUname = '${toUname}'
	  	  message.senderUname = '${uname}'
	  }
	
	
	
	   sock.send(JSON.stringify(message));
	  $("#message").val("");
	 }
	
	
	
	
	 function getTimeStamp() {
	   var d = new Date();
	   var s =
	     leadingZeros(d.getFullYear(), 4) + '-' +
	     leadingZeros(d.getMonth() + 1, 2) + '-' +
	     leadingZeros(d.getDate(), 2) + ' ' +
	
	     leadingZeros(d.getHours(), 2) + ':' +
	     leadingZeros(d.getMinutes(), 2) + ':' +
	     leadingZeros(d.getSeconds(), 2);
	
	   return s;
	 }
	
	 function leadingZeros(n, digits) {
	   var zero = '';
	   n = n.toString();
	
	   if (n.length < digits) {
	     for (i = 0; i < digits - n.length; i++)
	       zero += '0';
	   }
	   return zero + n;
	 }
	
	
	
	
	
	
	
	 function appendMessage(msg, senderUname) {
	
		 if(msg == ''){
			 return false;
		 }else{
	
		var uname = session.getAttribute("uname");
		console.log("세션아이디 가져오깅:"+uname);
		 var t = getTimeStamp();
		 if(senderUname.equals(uname)){
		 $("#chatMessageArea").append("<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src=src='/porget/files/profile/${uphoto }' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${uname}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div><br>")		 
		 }else{
		 $("#chatMessageArea").append("<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src=src='/porget/files/profile/${uphoto }' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${uname}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div><br>")		 
		 }
	
		  var chatAreaHeight = $("#chatArea").height();
		  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		  $("#chatArea").scrollTop(maxScroll);
	
		 }
	 }
	 $(document).ready(function() {
	  $('#message').keypress(function(event){
	   var keycode = (event.keyCode ? event.keyCode : event.which);
	   if(keycode == '13'){
	    send();
	   }
	   event.stopPropagation();
	  });
	
	
	
	  $('#sendBtn').click(function() { send(); });/* $('#enterBtn').click(function() { connect(); }); $('#exitBtn').click(function() { disconnect(); }); */
	 });
</script>

</body>
</html>
