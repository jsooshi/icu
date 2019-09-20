$(function(){
	var group=0;
	$('a[name=replyAgain]').on('click',function(){ //댓글 눌렀을 시 대댓글 입력 창 
		
		$(this).parent('div[name=reply]').after($('#replyReply'));
		$('#replyReply').css("display","");
		$('#reReplyCon').focus();
		group = $(this).parent().children('input[name=re]').val(); //rgroup번호 (pk) 얻기 
		
										
	})//click

	$('a[name=reReSave]').on('click', function(){ //대댓글 작성 저장 클릭 
		var reCon = $("#reReplyCon").val();
		if(reCon===""){
			alert('내용을입력하세요')
			$("#reReplyCon").focus();
			return;
		}
		var concon =  {
				pfnum: pfnum,
				uname: uname,
				rcontent: reCon,
				rgroup : group,
				rdeep: 1
			}
			
		$.ajax({
			url: '../replies/save',
			type: 'post',
			data: concon,
			success: function(result){
				$('#replyArea').html(result);
			}
		
		})
		
		$("#reReplyCon").val('');
	})//대댓글 저장 클릭 시 
	
	$('a[name=reReplyCancel]').on('click', function(){
		$('#replyReply').css("display","none");
	})//대댓글 작성 취소 시 
	
	
	$('a[name=replyDelete]').on('click', function(){
		if(confirm('삭제하시겠습니까? '))
		var number = $(this).parent().children('input[name=rn]').val();
		$.ajax({
			url : '../replies/delete',
			data : {
				rnum : number,
				pfnum: pfnum,
				
			},
			success : function(result){
				$('#replyArea').html(result);
			}
			
		})
		
		
	})//댓글 삭제 클릭 시
	
	
	$('#reReplyCon').keyup(function(e){ //대댓글 글자수 카운터 및 제한
		var content2 = $(this).val();
		$('#counter2').html("("+content2.length+"/최대100자)");
		if(content2.length>150){
			alert('최대100자까지 가능합니다')
			$(this).val(content.substring(0,100));
			$('#counter2').html('(100/최대150자');
		}
		
	})
	
});//ready