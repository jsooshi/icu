<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>포트폴리오 수정</title>
    <script src="/porget/js/jquery-3.js"></script>
	<link rel="stylesheet" href="/porget/css/portfolioPost.css">
    <script type="text/javascript">
    	var fileCount = 0;
    	var tagCount=0;
    	var fileList = new FormData();
		var formData = new FormData();
    	var thumbs = ${thumbs};
    	var tagNames="";
    	var tags = "${p.tagname}".split("#");
    	//var fList=${fList};
    	console.log(thumbs[0]);
    	//console.log(fList);
    	
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
    	
		function isConfirmFile( fileName ) {
		    var fileSuffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		    fileSuffix = fileSuffix.toLowerCase();
		    if ( "pdf" == fileSuffix || "ppt" == fileSuffix  || "pptx" == fileSuffix || "docx" == fileSuffix) 
		        return true;
		    else 
		        return false;
		}//포트폴리오 파일 확인
    	
    	$(function(){
	    	$('#uploadBtn').on("click", function(e){
	    		if($('input[name=pfname]:eq(0)').val().trim()===""){
					alert('제목을 입력해주세요');
					$('input[name=pfname]:eq(0)').focus();
					return;
	    		}else if(!($('input[name=pfurl]:eq(0)').val().trim()!="" || formData.has("uploadPortfolio"))){
					alert('포트폴리오 url 입력 혹은 포트폴리오 파일을 첨부해주세요');
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
	    		
				formData.append("pfnum",${param.pfnum})
				formData.append("pfname",$('input[name=pfname]:eq(0)').val())
				formData.append("pfurl",$('input[name=pfurl]:eq(0)').val())
				formData.append("pfposition",$('input[name=pfposition]:eq(0)').val())
				formData.append("tagname",$('input[name=tagname]:eq(0)').val())
				formData.append("pffile","${p.pffile }")
				
				for(var i=0;i<fileCount;i++){
					/////////////////////////////////////////
					//업로드를 하는데 만약에 original 파일이라면 이름만 저장한다
					var keyName = $("#dataList tr").eq(i).children("td:eq(0)").html();
					console.log("새로 추가한거 확인 해주세요 : " +fileList.get(keyName).name);
					if(formData.has(fileList.get(keyName))){
						formData.append("keepFileName",fileList.get(keyName));
						formData.delete(fileList.get(keyName).name);
					}else{
					/////////////////////////////////////////
					//formData.append("fileName",fileList.get($("#dataList tr").eq(i).children("td:eq(0)").html()).name)
						console.log(fileList.get($("#dataList tr").eq(i).children("td:eq(0)").html()));
						formData.append("uploadFile",fileList.get($("#dataList tr").eq(i).children("td:eq(0)").html()));
					}
				}
				
				$.ajax({
					url:'update',
					processData:false,
					contentType:false,
					data:formData,
					type:'POST',
					success:function(result){
						alert("Uploaded");
						window.location = '/porget/portfolio/view?pfnum='+${param.pfnum};
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
			});//썸네일 목록 등록
			
			$("#pffile").on("change",function(){
				formData.delete("uploadPortfolio");
				var inputFile = $('#pffile');
				var pfFile = inputFile[0].files;
				console.log(pfFile);
				if(pfFile.length == 0){
					$(this).parent().children('label').eq(1).html("${p.pffile }")
				}else if(!isConfirmFile(pfFile[0].name)){
					alert('지정된 확장자만 등록해주세요');
					$(this).parent().children('label').eq(1).html("${p.pffile }")
				}else{
					formData.append("uploadPortfolio",pfFile[0])
					$(this).parent().children('label').eq(1).html(pfFile[0].name)
				}
			})//포트폴리오 등록
			
			$('#tagname').on("keyup",function(e){
				if(e.keyCode==13 || e.keyCode==32){
					tagAdd();
				}
			})
			
			$('#tagname').blur(function(){
					tagAdd();
				
			});
    	
	    	for (var i in thumbs){
	    		fileCount ++;
	    		var viewName = thumbs[i].substring(thumbs[i].indexOf("_")+1);
	    		fileList.append(viewName,thumbs[i]);
	    		console.log(fileList.get(viewName));
	    		$('#dataList').html($('#dataList').html()+"<tr><td>"+viewName+"</td>"+
				"<td><button>삭제</button></td></tr>");
	    		
	    		formData.append("originalFileName",thumbs[i]);
	    		formData.append(thumbs[i],viewName);
	    	}
			
			for (var i = 1; i < tags.length; i++) {
				$('#tags').append('<span><font style="background-color:skyblue;">#'+tags[i]+'</font><font style="background-color:skyblue;"> <a href="javascript:void(0);" onclick="tagremove(this);">X</a></font></span> ');
				tagNames+=tags[i];
				tagCount++;
			}
    		
    	});//document.ready
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<%--
        <div class="container">
		사진: <input type="file" name="uploadFile" multiple> 
		<table>
			<thead><tr><th>제목</th><th>삭제</th></tr></thead>
			<tbody id="dataList">
			</tbody>
		</table><br>
        포지션: <input type="text" name="pfposition" value="${p.pfposition }"><br>
        태그: <input type="text" name="tagname" value="${p.tagname	 }"><br>
	<button id='uploadBtn' class="btn btn-primary">등록</button><br> 
 --%>
<div class="container">
				<h3>포트폴리오 수정</h3>
		<div class="row">
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xs-offset-3">
          <form id="contact-form" class="form" action="#" method="POST" role="form">
              <div class="form-group">
                  <label class="form-label" for="pfname">제목</label>
                  <input type="text" class="form-control" id="pfname" name="pfname" placeholder="포트폴리오 제목" tabindex="1" required value="<c:out value="${p.pfname }"/>">
              </div>                            
              <div class="form-group">
                  <label class="form-label" for="pfurl">포트폴리오 주소</label>
                  <input type="text" class="form-control" id="pfurl" name="pfurl" placeholder="포트폴리오 url" tabindex="2" value="${p.pfurl }">
              </div>                            
              <div class="form-group">
                  <label class="form-label" for="pfposition">포지션</label>
                  <input type="text" class="form-control" id="pfposition" name="pfposition" placeholder="포지션" tabindex="3" value="${p.pfposition }">
              </div>                            
              <div class="form-group">
                  <label class="form-label" for="tagname">tag</label>
                  <span id="tags"></span><input type="text" class="form-control" id="tagname" name="tagname" placeholder="태그를 입력하세요" tabindex="4">
              </div>
              <div class="form-group">
                  <label class="form-label" for="uploadFile">사진 등록</label>
                  <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="썸네일 등록" tabindex="5" required multiple accept=".jpg,.jpeg,.gif,.bmp,.png" style="width:110px;">
                  <table><thead><tr><th width="500px">사진 제목</th><th width="300px">삭제</th></tr></thead>
				  <tbody id="dataList">
				  </tbody>
			</table><br>
              </div>
              <div class="form-group">
						<label for="pffile">포트폴리오 첨부(.pdf/.ppt/.pptx/.docx)</label>
						<input type="file" class="form-control"
							id="pffile" name="pffile" placeholder="파일첨부" tabindex="6" accept=".pdf,.ppt,.pptx,.docx" title="파일등록" hidden>  
						<label for="pffile" class="form-control">${p.pffile }</label>
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