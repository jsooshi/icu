<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- footer -->
<footer>
	<div class="container-fluid padding">
		<div class="row text-center">
			<div class="col-sm-6">icu Company</div>
			<div class="col-sm-6">footer</div>
		</div>
		<div class="col-12">
			<hr class="light">
			<h5 class="text-center">&copy; PorGet</h5>
		</div>
	</div>
</footer>
<script>
	var socket = null;
	$(document).ready(function(){
		connectWS();	
	})
	
	function connectWS(){
		var ws = new WebSocket("ws://localhost/porget/replyEcho?pfnum=1");
		socket = ws
		ws.onopen = function(){
		console.log('Info: connection opened')
	};
	
		ws.onmessage = function (event) {
		console.log(event.data+'\n');
		$('#socketAlert').html(event.data);
		$('#socketAlert').css("display","block");
		setTimeout(function(){
			$('#socketAlert').css("display","none");
		},7000)
	}	
	
		ws.onclose = function (event) {
			console.log('Info: connecion closed')
			setTimeout(function () {connect()},1000); //retry connection	
	}
		ws.onerror = function (err) { console.log('error: ', err)}
	
	}	
</script>	


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
	<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</body>