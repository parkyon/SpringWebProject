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
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
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

</head>


	<script>
	
	jQuery.extend(jQuery.validator.messages, {
		required: "필수항목",
		email: "이메일 형식",
		
		minlength: jQuery.validator.format("{0}글자 이상.")
	});

	$().ready(function() {

		// validate the comment form when it is submitted
		$("#commentForm1").validate();

		// validate signup form on keyup and submit
		$("#commentForm2").validate({   //많이 사용함
			rules: {
				bookName: {
					required: true,
					
				},
				file: {
					required: true,
					
				},
				price: {
					required: true,
					digits: true,
					
				},
			
				
			
			
			},
			messages: {
				bookName: {
					required: "책 이름은 필수항목 입니다.",
					
				},
				file: {
					required: "책 사진은 필수항목 입니다.",
					
				},
				price: {
					required: "책 가격은 필수항목 입니다.",
					digits : "숫자만입력하세요",
					
				},
				
				
			}
		});
	});
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
	
	<form method="post" enctype="multipart/form-data" id="commentForm2" action="">
	<div class="container-fluid text-center">    
  <div class="row content">

    <div class="col-sm-10 text-left"> 
      <h1>도서명:<input type="text" class="form-control" name="bookName" id="bookName"  ></h1>
        <hr>
        
        
        
       <div class="row">
        <div class="col-sm-6">
         
           
            <object id="nzeo" width="400px" height="400px" data="/recBook/download?fileName=${recBook.filepath}" name="aaa">
		  </object><div class="form-group">
		        <label>책 사진</label>
		        <input type="file" class="form-control" name="file"/>
		        <div class="fileDrop"></div>
		        <div class="uploadedList"></div>
		    </div>
         
        </div>
        <div class="col-sm-6">
        
        	저자:<input type="text" class="form-control" name="writer" value="${recBook.writer}" > </br>
         	유형:<input type="text" class="form-control" name="bookType" value="${recBook.bookType}" ></br>
       		 출판사:	<input type="text" class="form-control" name="publisher" value="${recBook.publisher}" ></br>
       		<hr>
       		
       		 가격:<input type="text" class="form-control" name="price" value="${recBook.price}"></br>
       		
       		
       		리뷰 : <input type="text" class="form-control" name="review" value="${recBook.review}" ></br>
         	책 내용: <input type="text" class="form-control" name="bookStory" value="${recBook.bookStory}" >
         	구입처 링크 :  <input type="text" class="form-control" name="sell" value="${recBook.sell}" >
        </div>
 
		</div>
		
		 <div>
			    
			    <button type="submit" class="btn btn-primary">등록</button>
			    <a href="/recBook/recBookList"><button type="button" class="btn btn-primary">취소</button></a>
		    </div>
	  	</form>
	
	

	
	
</body>
</html>