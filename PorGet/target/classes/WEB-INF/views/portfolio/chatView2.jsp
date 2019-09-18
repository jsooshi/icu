<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<html>
<head>

<script src="/porget/js/jquery-3.js"></script>  
<script src="/porget/js/sockjs.min.js"></script>  

<style type="text/css">
body{
    margin-top:20px;
    background:#eee;
}
.row.row-broken {
    padding-bottom: 0;
}
.col-inside-lg {
    padding: 20px;
}
.chat {
    height: calc(100vh - 180px);
}
.decor-default {
    background-color: #ffffff;
}
.chat-users h6 {
    font-size: 20px;
    margin: 0 0 20px;
}
.chat-users .user {
    position: relative;
    padding: 0 0 0 50px;
    display: block;
    cursor: pointer;
    margin: 0 0 20px;
}
.chat-users .user .avatar {
    top: 0;
    left: 0;
}
.chat .avatar {
    width: 40px;
    height: 40px;
    position: absolute;
}
.chat .avatar img {
    display: block;
    border-radius: 20px;
    height: 100%;
}
.chat .avatar .status.off {
    border: 1px solid #5a5a5a;
    background: #ffffff;
}
.chat .avatar .status.online {
    background: #4caf50;
}
.chat .avatar .status.busy {
    background: #ffc107;
}
.chat .avatar .status.offline {
    background: #ed4e6e;
}
.chat-users .user .status {
    bottom: 0;
    left: 28px;
}
.chat .avatar .status {
    width: 10px;
    height: 10px;
    border-radius: 5px;
    position: absolute;
}
.chat-users .user .name {
    font-size: 14px;
    font-weight: bold;
    line-height: 20px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.chat-users .user .mood {
    font: 200 14px/20px "Raleway", sans-serif;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

/*****************CHAT BODY *******************/
.chat-body h6 {
    font-size: 20px;
    margin: 0 0 20px;
}
.chat-body .answer.left {
    padding: 0 0 0 58px;
    text-align: left;
    float: left;
}
.chat-body .answer {
    position: relative;
    max-width: 600px;
    overflow: hidden;
    clear: both;
}
.chat-body .answer.left .avatar {
    left: 0;
}
.chat-body .answer .avatar {
    bottom: 36px;
}
.chat .avatar {
    width: 40px;
    height: 40px;
    position: absolute;
}
.chat .avatar img {
    display: block;
    border-radius: 20px;
    height: 100%;
}
.chat-body .answer .name {
    font-size: 14px;
    line-height: 36px;
}
.chat-body .answer.left .avatar .status {
    right: 4px;
}
.chat-body .answer .avatar .status {
    bottom: 0;
}
.chat-body .answer.left .text {
    background: #ebebeb;
    color: #333333;
    border-radius: 8px 8px 8px 0;
}
.chat-body .answer .text {
    padding: 12px;
    font-size: 16px;
    line-height: 26px;
    position: relative;
}
.chat-body .answer.left .text:before {
    left: -30px;
    border-right-color: #ebebeb;
    border-right-width: 12px;
}
.chat-body .answer .text:before {
    content: '';
    display: block;
    position: absolute;
    bottom: 0;
    border: 18px solid transparent;
    border-bottom-width: 0;
}
.chat-body .answer.left .time {
    padding-left: 12px;
    color: #333333;
}
.chat-body .answer .time {
    font-size: 16px;
    line-height: 36px;
    position: relative;
    padding-bottom: 1px;
}
/*RIGHT*/
.chat-body .answer.right {
    padding: 0 58px 0 0;
    text-align: right;
    float: right;
}

.chat-body .answer.right .avatar {
    right: 0;
}
.chat-body .answer.right .avatar .status {
    left: 4px;
}
.chat-body .answer.right .text {
    background: #7266ba;
    color: #ffffff;
    border-radius: 8px 8px 0 8px;
}
.chat-body .answer.right .text:before {
    right: -30px;
    border-left-color: #7266ba;
    border-left-width: 12px;
}
.chat-body .answer.right .time {
    padding-right: 12px;
    color: #333333;
}

/**************ADD FORM ***************/
.chat-body .answer-add {
    clear: both;
    position: relative;
    margin: 20px -20px -20px;
    padding: 20px;
    background: #46be8a;
}
.chat-body .answer-add input {
    border: none;
    background: none;
    display: block;
    width: 100%;
    font-size: 16px;
    line-height: 20px;
    padding: 0;
    color: #ffffff;
}
.chat input {
    -webkit-appearance: none;
    border-radius: 0;
}
.chat-body .answer-add .answer-btn-1 {
    background: url("http://91.234.35.26/iwiki-admin/v1.0.0/admin/img/icon-40.png") 50% 50% no-repeat;
    right: 56px;
}
.chat-body .answer-add .answer-btn {
    display: block;
    cursor: pointer;
    width: 36px;
    height: 36px;
    position: absolute;
    top: 50%;
    margin-top: -18px;
}
.chat-body .answer-add .answer-btn-2 {
    background: url("http://91.234.35.26/iwiki-admin/v1.0.0/admin/img/icon-41.png") 50% 50% no-repeat;
    right: 20px;
}
.chat input::-webkit-input-placeholder {
   color: #fff;
}

.chat input:-moz-placeholder { /* Firefox 18- */
   color: #fff;  
}

.chat input::-moz-placeholder {  /* Firefox 19+ */
   color: #fff;  
}

.chat input:-ms-input-placeholder {  
   color: #fff;  
}
.chat input {
    -webkit-appearance: none;
    border-radius: 0;
}
</style>
</head>

<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.6.8-fix/jquery.nicescroll.min.js"></script>
<div class="content container-fluid bootstrap snippets">
      <div class="row row-broken">
        <div class="col-sm-3 col-xs-12">
          <div class="col-inside-lg decor-default chat" style="overflow: hidden; outline: none;" tabindex="5000">
            <div class="chat-users">
              <h6>Online</h6>
                <div class="user">
                    <div class="avatar">
                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="User name">
                    <div class="status off"></div>
                    </div>
                    <div class="name">User name</div>
                    <div class="mood">User mood</div>
                </div>
                <div class="user">
                    <div class="avatar">
                    <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="User name">
                    <div class="status online"></div>
                    </div>
                    <div class="name">User name</div>
                    <div class="mood">User mood</div>
                </div>
            </div>
          </div>
        </div>
        <div class="col-sm-9 col-xs-12 chat" style="overflow: hidden; outline: none;" tabindex="5001">
          <div class="col-inside-lg decor-default">
            <div class="chat-body">
              <h6>${toUname } 님과 대화</h6>
              
              <!-- 왼쪽 -->
              <div class="answer left">
		               <!--  <div class="avatar">
		                  <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="User name">
		                   <div class="status offline"></div>  
		                </div> -->
               <!--  <div class="chatMessageArea">
              </div> -->
              </div>
              
              <!-- 오른쪽 -->
              <div class="answer right">
		               <!--  <div class="avatar">
		                  <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="User name">
		                  <div class="status offline"></div> 
		                </div> -->
<!--                 <div class="chatMessageArea">
 -->		           
               <!--  </div> -->
              </div>
              
              
               
              <div class="answer-add">
                <input class="form-control" placeholder="Write a message" id = "message">
                <span class="answer-btn answer-btn-1">      <a
				style="margin-top: 30px; text-align: center; color: white; font-weight: bold;" id = "sendBtn"><br>전송</a></span>
          
                <span class="answer-btn answer-btn-2"></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<script type="text/javascript">
	var socket = null;
	connect();
 
	 function connect() {
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
		 $("#answer right").append("<div class='name'>${uname}</div><div class='text'>"+msg+"</div><div class='time'>"+t+"</div>")		 
		 var chatAreaHeight = $("#chatArea").height();
		  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		  $("#chatArea").scrollTop(maxScroll);
		 }else{
		 $("#answer left").append("<div class='name'>${uname}</div><div class='text'>"+msg+"</div><div class='time'>"+t+"</div>")		 
		 var chatAreaHeight = $("#chatArea").height();
		  var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		  $("#chatArea").scrollTop(maxScroll);
		 }
	
		 }
	 }
	 $(document).ready(function() {
		 $(".chat").niceScroll();
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
