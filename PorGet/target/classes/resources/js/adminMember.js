	$(document).ready(function() {

		for (var i = 1; i <= 5; i++) {
			var option = $("<option value="+i*10+">" + i * 10
					+ "</option>");
			$("#amount").append(option);
		}
		
		/* 페이징 */

		$(".page-item a").on(
				"click",
				function(e) {
					e.preventDefault();
					var pageNum = $(this).attr('href');
					var amount = $("input[name='amount']").val();
					var type= $("input[name='type']").val();
					var keyword=$("input[name='keyword2']").val();
					
					$(this).parents().siblings().removeClass("active");    
				    $(this).parent().addClass("active"); 
					
					console.log(type);
					console.log(keyword);
					
					$.ajax({
						url:"/porget/admin/member",
						data: {
							"pageNum": pageNum,
							"amount": amount,
							"type": type,
							"keyword": keyword
						},
						success: function(result){
							$('.memberTable').html($(result).find('.memberTable').html());
						}
					})
				});
		
		/* 출력갯수 변경 */
		
		$('.changeAmount').on('click',function(e){
			var pageNum = $("input[name='pageNum']").val();
			var amount = $("#amount option:selected").val();
			var pageForm = $("#pageForm");
			
            pageForm.find("input[name='pageNum']").val(1);
            pageForm.find("input[name='amount']").val($("#amount option:selected").text());
			pageForm.submit();
		})
		
		/*닉네임, 이메일, 등급 검색*/
		
		var searchForm = $("#searchForm");

		
		$('#searchForm button').on("click", function(e){
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("검색어를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			
			searchForm.submit();
		})
		
		
		/* 회원정보 클릭 */
		
		
		
	})