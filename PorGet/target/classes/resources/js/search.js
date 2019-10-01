	var check = false;
	var loopKeyword=false;
	
	function startSuggest(){
		if(!check){
			setTimeout('sendKeyword()',100);
			loopKeyword=true;
		}
		check=true;
	}
	
	function sendKeyword(){
		console.log('>>>sendKeyword')
		if(!loopKeyword) return;
		
		var keyword = document.searchForm.keyword.value;
		
		if(!keyword.includes('#')&&keyword != ''){
			console.log('여긴 에이작스 자리란다');
			show('suggest');
			$.ajax({
				url:"/porget/searchKeyword",
				data: {keyword:keyword},
				success: function(data){
					//$('#suggestList').html('');
					$('#suggestList').html(data);
				}
			});
		}else if(keyword.includes('#')){
//		}else if(keyword != ''){
			console.log('여긴 들어온거니');
				if(keyword.substr(0,keyword.length)=='#'){
					hide('suggest');
					check = false;
					loopKeyword=false;
				}
				else{
					if(keyword.substr(0,keyword.length)=='#'){
						hide('suggest');
						check = false;
						loopKeyword=false;
					}else{
						
				
						var newKeyword = keyword.split('#');
						var newNum = newKeyword.length-1;
						console.log("뉴키워드"+newKeyword);
						console.log("뉴넘버"+newKeyword);
						
						keyword = newKeyword[newNum];
						console.log("들어갈키워드"+keyword);
						
						keyword.substr(1,keyword.length);
						show('suggest');
						$.ajax({
							url:"/porget/searchTegBox",
							data: {keyword:keyword},
							success: function(data){
								$('#suggestList').html(data);
							}
						});
					}
				}
		}else{
			hide('suggest');
			check = false;
			loopKeyword=false;
		}
			setTimeout('sendKeyword()',100)
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

	 function select2(selectedKeyword){ //해시태그로 검색후 쌓이게
	       //나열된 제시어 중 선택된 단어를 <input name=keyword>에게 전달
	   document.searchForm.keyword.value=selectedKeyword;
	       //제시어 기능이 일단락 되었음
			/* check=false;
			loopKeyword=false;*/
	       show('suggest'); 
	}	
