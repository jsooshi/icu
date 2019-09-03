<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <link rel="stylesheet" href="css/bootstrap.css">  -->
	<link rel="stylesheet" href="css/custom.css"> 
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript">
    	function autoClosingAlert(selector, delay){
    		var alert =$(selector).alert();
    		alert.show();
    		window.setTimeout(function(){ alert.hide()}, delay);
    	}
    	function submitFunction(){
    		var fromID = '<%= session.getAttribute("uname")%>';
    		var toID = '<%= request.getParameter("toID")%>';
    		/* var toID = '이댕댕'; */
    		var chatContent = $('#chatContent').val();
    		$.ajax({
    			type: "POST",
    			url: "/porget/sendMessage",
    			data:{
    				fromID:fromID,
    				toID:toID,
    				chatContent:chatContent
    			},
    			success:function(result){
    				if(result==1){
    					autoClosingAlert('#successMessage', 2000);
    				}else if(result==0){
    					autoClosingAlert('#dangerMessage', 2000);
    				}else{
    					autoClosingAlert('#warningMessage', 2000);
    				}
    			}
    		});
    			$('#chatContent').val('');
    	}
    	
    	var lastID=0;
    	function chatListFunction(type){
    		var fromID = '<%= session.getAttribute("uname")%>';
    		<%-- var toID = '<%= request.getParameter("toID")%>'; --%>
    		var toID = '이댕댕';
    		$.ajax({
    		type: "POST",
			url: "/porget/getListChat",
			data:{
				fromID: fromID,
				toID: toID,
				listType: type
			},
			success:function(data){
				if(data=="") return;
				var parsed =JSON.parse(data);
				var result = parsed.result;
				for (var i = 0; i < result.length; i++) {
					if(result[i][0].value == fromID){
						result[i][0].value = '나';
					}
					
					addChat(result[i][0].value, result[i][2].value, result[i][3].value);
				}
				lastID = Number(parsed.last);
			}
    		});
    	}
    	function addChat(chatName, chatContent, chatTime){
    		$('#chatList').append('<div class="row">'+
    				'<div class="col-lg-12">'+
    				'<div class="media">'+
    				'<a class="pull-left" herf="#">'+
    				'<img class="media-object img-circle" style="width: 30px; height: 30px;" src="images/user.jpg" alt="">'+
    				'</a>'+
    				'<div class="media-body">'+
    				'<h4 class="media-heading">'+
    				chatName+
    				'<span class="small pull-right">'+
    				chatTime+
    				'</span>'+
    				'</h4>'+
    				'<p>'+
    				chatContent+
    				'</p>'+
    				'</div>'+
    				'</div>'+
    				'</div>'+
    				'</div>'+
					'<hr>');
    	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
    	}
 		function getInfiniteChat(){
 			setInterval(function(){
 				chatListFunction(lastID);
 			},3000);
 		}
    </script>
    
</head>
<body>
	

 <div class="container bootstrap snippet">
	<div class="row">
		<div class="col-xs-12">
			<div class="portlet portlet-default">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4><i class="fa fa-circle text-green"></i>실시간 채팅창</h4>
					</div>	
					<div class="clearfix"></div>	
				</div>
				<div id="chat" class="panel-collapse collapse in">
					<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;">
					</div>
					<div class="portlet-footer">
						<div class="row" style="height: 90px;">
							<div class="form-group col-xs-10">
								<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메세지를 입력하세요" maxlength="100"></textarea>
							</div>
							<div class="form-group col-xs-2">
								<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>		
</div>

<div class="alert alert-success" id="successMessage" style="display:none;">
		<strong>메세지 전송에 성공했습니다.</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage" style="display:none;">
		<strong>이름과 내용을 모두 입력해주세요.</strong>
	</div>
	<div class="alert alert-warning" id="warningMessage" style="display:none;">
		<strong>데이터베이스 오류가 발생했습니다.</strong>
	</div>

<script>
	$('#messageModal').modal("show");
	
</script>

<script type="text/javascript">
$(document).ready(function(){
	chatListFunction('ten');
	getInfiniteChat();
});
</script>

</body>
</html>