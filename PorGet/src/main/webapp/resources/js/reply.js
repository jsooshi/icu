

$(function(){ //jquery영역
	$(".carousel-indicators").children('li').eq(0).addClass("active");
	$(".carousel-inner").children('div').eq(0).addClass("active");
	$('.carousel').carousel()
	
	$.ajax({ //조회수 업데이트 
		url: '/porget/replies/read',
		type: 'post',
		data: {
			pfnum : pfnum
		}
	})	 
	
	//게시글을 열람, 접속한 사람, 무조건 실행? 실행. 
	function replyList (){ 	
	 $.ajax({
		 url : '/porget/replies/list',
		 type : 'post',
		 data: {
			 pfnum : pfnum,
			 uname : uname,
			 
		 },
		 success: function(result){
			 $('#replyArea').html(result);
			 
		 }
	 })
	 
	}
	
	replyList(); //댓글리스트 로딩
		
	$('a[name=replySave]').click(function(){ //댓글작성 클릭 
		var replyCon = $("#replyContents").val(); //댓글내용 
		if(replyCon===""){
			alert('내용을 입력하세요')
			$('#replyContents').focus();
			return; 
		}
		var replyData={
				pfnum: pfnum,  //게시판번홈
				rcontent: replyCon, //댓글내용
				rdeep: 0,
				uname: uname //userID 
							
			}; 
	
		var msg = "reply,"+uname+","+writer+","+pfnum
		$.ajax({
			url: '../replies/save',
			type: "post",
			data:  replyData,
			success: function(){
				replyList()
				socket.send(msg);
				
			},
			error:function(xhr,staTxt){
				alert("에러?"+staTxt+':'+xhr.status)
			}
		})//ajax	
		
		
		$('#replyContents').val('') //댓글초기화
		
	})//replySave click

	
	$('#replyContents').keyup(function (e){ //댓글글자수카운터 및 제한
		var content = $(this).val();
		$('#counter').html("("+content.length+"/최대100자)");
		if(content.length>150){
			alert('최대100자까지 가능합니다')
			$(this).val(content.substring(0, 100));
			$('#counter').html('(100/최대100자)')
		}
	})
	
	$('#recommend').on('click',"a",function(event){//좋아요버튼
		var uName = uname;
		event.preventDefault();
		if(uName == ""){
			alert("로그인 해주세요");	
			return;
		}else {
			 $.ajax({
				 url : '/porget/portfolio/good',
				 type: 'post',
				 data: {
					 pfnum : pfnum
				 },
				 success: function(result){
					 var rec = $(result).find('#recommend').html();
					 $('#recommend').html(rec); 
				}
			})
		}
	})
}) //ready