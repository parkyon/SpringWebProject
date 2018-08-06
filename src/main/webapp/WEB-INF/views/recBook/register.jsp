<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<script>
    $(function(){
        $("form").validate({
            rules: {
            	bookName: {
                    required : true,
                   
                }
                
            },
            //규칙체크 실패시 출력될 메시지
            messages : {
            	bookName: {
                    required : "필수로입력하세요",
               
                }
                
                
            }
        });
    })
    $.validator.addMethod(
        "regex",
        function(value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "Please check your input."
    );
    
    
    </script> 
<body>
	<style> 
		.form-control:disabled, .form-control[readonly]{
			background: #ffffff;
		}
		.fileDrop{
			width : 100%;
			height : 200px;
			border : solid 1px blue;
		}
	</style>
	<div class="container">
  		<form method="post" id="formId" 
  			enctype="multipart/form-data">
  			<h1>추천도서 등록</h1>
		    <div class="form-group">
		    	<label>책 이름</label>
		      	<input type="text" class="form-control" name="bookName" id="bookName" value="${recBook.bookName}" >
		    </div>
		     <div class="form-group">
		    	<label>책 유형</label>
		      	<input type="text" class="form-control" name="bookType" value="${recBook.bookType}" >
		    </div>
		     <div class="form-group">
		    	<label>책 내용</label>
		      	<input type="text" class="form-control" name="bookStory" value="${recBook.bookStory}" >
		    </div>
		    <div class="form-group">
		        <label>파일</label>
		        <input type="file" class="form-control" name="file"/>
		        <div class="fileDrop"></div>
		        <div class="uploadedList"></div>
		    </div>
		    
		     <div class="form-group">
		    	<label>작가</label>
		      	<input type="text" class="form-control" name="writer" value="${recBook.writer}" >
		    </div>
		    <div class="form-group">
		    	<label>작가</label>
		      	<input type="text" class="form-control" name="file" , id="file" />
		    </div>
		     
		   
		   
		    <div>
			    
			    <button type="submit" class="btn btn-primary">등록</button>
			    <a href="/recBook/recBookList"><button type="button" class="btn btn-primary">취소</button></a>
		    </div>
	  	</form>
	</div>
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	
	
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	/*	파일 이름에 jpg,gif,png,jpeg이 들어가있는지 확인 */
	function checkImageType(fileName){
		var pattern = /jpg|gif|png|jpeg/i;
		return fileName.match(pattern);
	}
	$(".fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
		var files = e.originalEvent.dataTransfer.files;
		var file = files[0];
		console.log(file);
		var formData = new FormData();
		formData.append("file",file);
		
		$.ajax({
			url : '/recbook/display',
			data: formData,
			dataType:'text',
			processData: false,
			contentType: false,
			type:'POST',
			success:function(data){
				var str="";
				if(checkImageType(data)){
					str="<div>"
						+"<img src='/recbook/download?fileName="
						+data+"'/>"
						+ data +"</div>";
				}
				else{
					str = "<div>" + data + "</div>"
				}
				$(".uploadedList").append(str);
			}
		});
	});
	</script>
	
</body>
</html>