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
    <script type="text/javascript">
    	var fileCount = 0;
    	var fileList = new FormData();
		var formData = new FormData();
    	var thumbs = ${thumbs};
    	//var fList=${fList};
    	console.log(thumbs[0]);
    	//console.log(fList);
    	
    	$(function(){
	    	$('#uploadBtn').on("click", function(e){
				/*var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files); */
				/* console.log("${p.pfnum}"); */				
				formData.append("pfnum",${p.pfnum})
				formData.append("pfname",$('input[name=pfname]:eq(0)').val())
				formData.append("pfurl",$('input[name=pfurl]:eq(0)').val())
				formData.append("pfposition",$('input[name=pfposition]:eq(0)').val())
				formData.append("tagname",$('input[name=tagname]:eq(0)').val())
				
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
						window.location = '/porget/portfolio/view?pfnum='+${p.pfnum};
					}
				});
				//console.log($('input[name=pfname]:eq(0)').val());
				
			});//#uploadBtn.on click
	    	
	    	$('#dataList').on('click','button',function(){
				console.log("삭제하라우");
				console.log($(this).closest('tr').children('td:eq(0)').html());
				//formData.append("removeNames",fileList.get($(this).closest('tr').children('td:eq(0)').html()));
				fileList.delete($(this).closest('tr').children('td:eq(0)').html());
				$(this).closest('tr').remove();
				fileCount -= 1;
			});//삭제버튼
	    	
			$("input[name='uploadFile']:eq(0)").on("change",function(){
				console.log("아앗 바꼈어요");
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				var fileIn =0;
				console.log(files[0]);
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
			})//파일 insert
		
    	
	    	for (var i in thumbs){
	    		fileCount ++;
	    		var viewName = thumbs[i].split("_")[1];
	    		fileList.append(viewName,thumbs[i]);
	    		console.log(fileList.get(viewName));
	    		$('#dataList').html($('#dataList').html()+"<tr><td>"+viewName+"</td>"+
				"<td><button>삭제</button></td></tr>");
	    		
	    		formData.append("originalFileName",thumbs[i]);
	    		formData.append(thumbs[i],viewName);
	    	}
    		
    	});//document.ready
    </script>
</head>
<body>

        제목: <input type="text" name="pfname" value="${p.pfname }"><br>
	썸네이일: <input type="file" name="uploadFile" multiple> <button id='uploadBtn'>업로드</button><br> 
	<table>
	<thead><tr><th>제목</th><th>삭제</th></tr></thead>
	<tbody id="dataList">
	</tbody>
	</table><br>
        포트폴리오주소: <input type="text" name="pfurl" value="${p.pfurl }"><br>
        포지션: <input type="text" name="pfposition" value="${p.pfposition }"><br>
        태그: <input type="text" name="tagname" value="${p.tagname }"><br>

</body>
</html>