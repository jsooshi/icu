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
<link rel="stylesheet" href="/porget/css/portfolioPost.css">
<script type="text/javascript">
	var fileCount =0;
	var fileList = new FormData();
	var tagCount=0;
	var tagNames="";
	function tagremove(obj) {
		$(obj).parents('span:eq(0)').remove();
		tagCount--;
		tagAdd();
	}
	
	function tagAdd(){
		var re = /^[a-zA-Zㄱ-힣0-9.]+$/;
		var tag = $('#tagname').val().trim();
		if(tag===""){
			$('#tagname').val("")
			return;
		}
		if(!re.exec(tag)){
			$('#tagname').val("")
			alert("올바른 태그를 입력해주세요(특수문자 불가)")
			return;			
		}
			$('#tags').append('<span><font style="background-color:skyblue;">#'+tag+'</font><font style="background-color:skyblue;"> <a href="javascript:void(0);" onclick="tagremove(this);">X</a></font></span> ');
			tagCount++;
			$('#tagname').val("")
		tagNames="";
		for (var i = 0; i < tagCount; i++) {
			console.log($('#tags').find('span').eq(i).children().html());
			tagNames+=$('#tags').find('span').eq(i).children().html();
		}
	}//태그 추가
	
	function isImageFile( fileName ) {
	    var fileSuffix = fileName.substring(fileName.lastIndexOf(".") + 1);
	    fileSuffix = fileSuffix.toLowerCase();
	    if ( "jpg" == fileSuffix || "jpeg" == fileSuffix  || "gif" == fileSuffix || "bmp" == fileSuffix || "png" == fileSuffix ) 
	        return true;
	    else 
	        return false;
	}//이미지 파일 확인
	
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
		});//삭제버튼
		
		$("input[name='uploadFile']:eq(0)").on("change",function(){
			var alNum=0;
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			var fileIn =(parseFloat(files.length)+parseFloat(fileCount));
			if(fileCount>2){
				alert("파일이 이미 3개있습니다");
				$(this).val("");return;}
			console.log("f+f : "+(files.length+fileCount));
			if(fileIn>3){
				alert("파일은 3개까지 등록됩니다");
				fileIn = (3-parseFloat(fileCount));
			}else{fileIn=files.length;}
			console.log("filecount : "+ fileCount);
			for(var i=0;i<fileIn;i++){
				if(isImageFile(files[i].name)){
				fileList.append(files[i].name,files[i]);
				//$("input[name='uploadFile']:eq(0)").val().split("\\")
				$('#dataList').html($('#dataList').html()+"<tr><td>"+files[i].name+"</td>"+
					"<td><button>삭제</button></td></tr>");
				fileCount ++;
				}else{
					if(alNum==0){
						alert("이미지만 등록해주세요");
						alNum=1;
					}
				}
			}
				console.log("3 : "+$('#dataList tr:eq(0) td:eq(0)').html());
			$(this).val("")
		})
		
		$('#tagname').on("keyup",function(e){
			if(e.keyCode==13 || e.keyCode==32){
				tagAdd();
			}
		})
		
		$('#tagname').blur(function(){
				tagAdd();
			
		});
		
	});
</script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<div class="container">
				<h3>포트폴리오 등록</h3>
		<div class="row">
		
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xs-offset-3">
				<form id="contact-form" class="form" action="#" method="POST"
					role="form">
					<div class="form-group">
						<label for="pfname">제목</label> <input
							type="text" class="form-control" id="pfname" name="pfname"
							placeholder="제목" tabindex="1" required>
					</div>
					<div class="form-group">
						<label for="pfurl">포트폴리오 주소</label> <input
							type="text" class="form-control" id="pfurl" name="pfurl"
							placeholder="포트폴리오 주소" tabindex="2">
					</div>
					<div class="form-group">
						<label for="pfposition">포지션</label> <input
							type="text" class="form-control" id="pfposition"
							name="pfposition" placeholder="포지션" tabindex="3">
					</div>
					<div class="form-group">
						<label for="tagname">태그</label> <span
							id="tags"></span><input type="text" class="form-control"
							id="tagname" name="tagname" placeholder="태그" tabindex="4">
					</div>
					<div class="form-group">
						<label for="uploadFile">사진 등록</label> <input
							type="file" class="form-control" id="uploadFile"
							name="uploadFile" placeholder="썸네일 등록" tabindex="5" required
							multiple>
						<table class="table">
							<thead>
								<tr>
									<th width="500px">사진제목</th>
									<th width="300px">삭제</th>
								</tr>
							</thead>
							<tbody id="dataList">
							</tbody>
						</table>
						<br>
					</div>
					<div class="text-center">
						<button type="button" class="btn btn-primary" id='uploadBtn'>등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	


</body>
</html>