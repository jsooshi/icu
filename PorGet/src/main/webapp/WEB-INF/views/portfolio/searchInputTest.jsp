<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색어를 입력해주세요</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var check = false;
	var loopKeyword=false;
	
	function startSuggest(){
		if(!check){
			setTimeout('sendKeyword()',500);
			loopKeyword=true;
		}
		check=true;
	}
	
	function sendKeyword(){
		console.log('>>>sendKeyword')
		if(!loopKeyword) return;
		
		var keyword = document.searchForm.keyword.value;
		
		if(keyword != ''){
			show('suggest');
			$.ajax({
				url:"/porget/searchKeyword",
				data: {keyword:keyword},
				success: function(data){
					//$('#suggestList').html('');
					$('#suggestList').html(data);
				}
			});
		}else{
			hide('suggest');
			check = false;
			loopKeyword=false;
		}
			setTimeout('sendKeyword()',500)
	}//sendKeyword
	
	function show(elementId) {
		var ele = document.getElementById(elementId); //ele:Element
		if(ele)//id에 해당하는 엘리먼트가 존재한다면
			ele.style.display='';
	}
	
	function hide(elementId) {
		var ele = document.getElementById(elementId); //ele:Element
		if(ele)//id에 해당하는 엘리먼트가 존재한다면
			ele.style.display='none';
	}
	
	 function select(selectedKeyword){
	       //나열된 제시어 중 선택된 단어를 <input name=keyword>에게 전달
	   document.searchForm.keyword.value=selectedKeyword;
	       //제시어 기능이 일단락 되었음
			check=false;
			loopKeyword=false;
	       hide('suggest');
	}	

</script>
</head>
<body>
		<form name="searchForm" action="searchButton" method="post">
		<input type="text" name="keyword" size="20" onkeydown="startSuggest()">
		<input type="submit" value="검색">
		<div id="suggest" style="display:; position: absolute; left: 60px;">
		<div id="suggestList"></div>
		</div>
		</form>
</body>
</html>