/* 페이지 경로 */

$(function() {
	
	$('.portfolio').on('click',function(event){
		event.preventDefault();
		console.log(event.target.href);
		history.pushState(null,null, event.target.href);
		
		$('article').load(event.target.href);
	})
	
	$('.popular').on('click',function(event){
		event.preventDefault();
		console.log(event.target.href);
		history.pushState(null,null, event.target.href);
		
		$('article').load(event.target.href);
	})
	

	
	
	$(window).on('popstate',function(event){
		$('article').load(location.href);
	});

});
