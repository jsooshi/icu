<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>포트폴리오 등록</title>
<script src="/porget/js/jquery-3.js"></script>
<script src="/porget/js/portfolioPost.js"></script>
<link rel="stylesheet" href="/porget/css/portfolioPost.css">
<script type="text/javascript">
	var fileCount =0;
	var fileList = new FormData();
	var tagCount=0;
	var tagNames="";
	function tagremove(obj) {
		console.log("빠이");
		console.log($(obj).html());
		$(obj).parents('span:eq(0)').remove();
		tagCount--;
		tagAdd();
	}
	
	function tagAdd(){
		tagNames="";
		for (var i = 0; i < tagCount; i++) {
			console.log($('#tags').find('span').eq(i).children().html());
			tagNames+=$('#tags').find('span').eq(i).children().html();
		}
	}
	$(function(){
		$('#uploadBtn').on("click", function(e){
			var formData = new FormData();
			if($('input[name=pfname]:eq(0)').val().trim()===""){
				alert('제목을 입력해주세요');
				$('input[name=pfname]:eq(0)').focus();
				return;
			}else if($('input[name=pfurl]:eq(0)').val().trim()===""){
				alert('포트폴리오 url을 입력해주세요');
				$('input[name=pfurl]:eq(0)').focus();
				return;
			}else if($('input[name=pfposition]:eq(0)').val()===""){
				alert('포지션을 입력해주세요');
				$('input[name=pfposition]:eq(0)').focus();
				return;
			}else if(tagCount===0){
				alert('태그를 하나 이상 입력해주세요');
				$('#tagname').focus();
				return;
			}else if(fileCount===0){
				alert('썸네일을 하나 이상 첨부해주세요');
				$('#uploadFile').focus();
				return;
			}
			/*var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files); */
			formData.append("pfname",$('input[name=pfname]:eq(0)').val())
			formData.append("pfurl",$('input[name=pfurl]:eq(0)').val())
			formData.append("pfposition",$('input[name=pfposition]:eq(0)').val())
			formData.append("tagname",tagNames)
			
			for(var i=0;i<fileCount;i++){
				formData.append("uploadFile",fileList.get($("#dataList tr").eq(i).children("td:eq(0)").html()));
			}
			
			$.ajax({
				url:'post',
				processData:false,
				contentType:false,
				data:formData,
				type:'POST',
				success:function(result){
					alert("Uploaded");
					window.location = '/porget/portfolio'
				}
			});
			//console.log($('input[name=pfname]:eq(0)').val());
			
		});//#uploadBtn.on click
		
		$('#dataList').on('click','button',function(){
			console.log("삭제하라우");
			fileList.delete($(this).closest('tr').children('td:eq(0)').html());
			$(this).closest('tr').remove();
			fileCount -= 1;
		});
		
		$("input[name='uploadFile']:eq(0)").on("change",function(){
			console.log("아앗 바꼈어요");
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			var fileIn =0;
			if(fileCount>2){
				console.log("파일이 이미 3개있습니다");
				$(this).val("");return;}
			console.log("f+f : "+(files.length+fileCount));
			fileIn = ((parseFloat(files.length)+parseFloat(fileCount))>3) ? (3-parseFloat(fileCount)) : files.length  ;
			fileCount += fileIn;
			console.log("filecount : "+ fileCount);
			for(var i=0;i<fileIn;i++){
				fileList.append(files[i].name,files[i]);
				//$("input[name='uploadFile']:eq(0)").val().split("\\")
				$('#dataList').html($('#dataList').html()+"<tr><td>"+files[i].name+"</td>"+
					"<td><button>삭제</button></td></tr>");
			}
				console.log("3 : "+$('#dataList tr:eq(0) td:eq(0)').html());
			$(this).val("")
		})
		
		$('#tagname').blur(function(){
			if(!($('#tagname').val().trim()==="")){
				$('#tags').append('<span><font style="background-color:skyblue;">#'+$('#tagname').val()+'</font><font style="background-color:skyblue;"> <a href="javascript:void(0);" onclick="tagremove(this);">X</a></font></span> ');
				tagCount++;
			}
				$('#tagname').val("")
				tagAdd();
		});
		
	});
</script>     
</head>
<body>
	<div class="container" style="margin-left: 300px;">
  <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">                        
        <h2>Contact</h2>
      </div>
  </div>
  <div class="row">
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xs-offset-3">
          <form id="contact-form" class="form" action="#" method="POST" role="form">
              <div class="form-group">
              
              
              
                  <label class="form-label" for="pfname">포트폴리오 제목</label>
                  <input type="text" class="form-control" id="pfname" name="pfname" placeholder="포트폴리오 제목" tabindex="1" required>
              </div>                            
              <div class="form-group">
                  <label class="form-label" for="pfurl">포트폴리오 url</label>
                  <input type="text" class="form-control" id="pfurl" name="pfurl" placeholder="포트폴리오 url" tabindex="2">
              </div>                            
              <div class="form-group">
                  <label class="form-label" for="pfposition">포지션</label>
                  <input type="text" class="form-control" id="pfposition" name="pfposition" placeholder="포지션" tabindex="3">
              </div>                            
              <div class="form-group">
                  <label class="form-label" for="tagname">tag</label>
                  <span id="tags"></span><input type="text" class="form-control" id="tagname" name="tagname" placeholder="태그를 입력하세요" tabindex="4">
              </div>
              <div class="form-group">
                  <label class="form-label" for="uploadFile">썸네일 등록</label>
                  <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="썸네일 등록" tabindex="5" required multiple>
                  <table><thead><tr><th width="500px">제목</th><th width="300px">삭제</th></tr></thead>
				  <tbody id="dataList">
				  </tbody>
			</table><br>
              </div>                            
              <div class="text-center">
                  <button type="button" class="btn btn-start-order" id='uploadBtn'>Send Message</button>
              </div>
          </form>
      </div>
  </div>
</div>
	
	
</body>
</html>