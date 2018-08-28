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
			url : '/board/display',
			data: formData,
			dataType:'text',
			processData: false,
			contentType: false,
			type:'POST',
			success:function(data){
				var str="";
				if(checkImageType(data)){
					str="<div>"
						+"<img src='/board/download?fileName="
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


<!-- 유효성 검사 -->

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
				libraryName: {
					required: true,
					
				},
				cityName: {
					required: true,
					
				},
				libraryType: {
					required: true,
					
				},
				loadAddress: {
					required: true,
					
				},
				latitude: {
					required: true,
					digits: true,
					
				},
				longtitude: {
					required: true,
					digits: true,
					
				},
			
				
			
			
			},
			messages: {
				libraryName: {
					required: "도서관 이름은 필수항목 입니다.",
					
				},
				cityName: {
					required: "도시 이름은 필수항목 입니다.",
					
				},
				libraryType: {
					required: "도서관 타입은 필수항목 입니다.",
					
				},
				loadAddress: {
					required: "도로명 주소는 필수항목 입니다.",
					
				},
				latitude: {
					required: "위도는  필수항목 입니다.",
					digits : "숫자만입력하세요",
					
				},
				longtitude: {
					required: "경도는 필수항목 입니다.",
					digits : "숫자만입력하세요",
					
				},
				
				
			}
		});
	});
	</script>

</head>
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
  		<form method="post" 
  			enctype="multipart/form-data" id="commentForm2">
  			<h1>도서관 등록</h1>
		    <div class="form-group">
		    	<label>도서관 이름(필수)</label>
		      	<input type="text" class="form-control" name="libraryName" value="${libraryInfo.libraryName}" >
		    </div>
		    <div class="form-group">
		    	<label>도시 이름(필수)</label>
		      	<input type="text" class="form-control" name="cityName" value="${libraryInfo.cityName}" >
		    </div>
		    <div class="form-group">
		    	<label>도서관 유형(필수)</label>
		      	<input type="text" class="form-control" name="libraryType" value="${libraryInfo.libraryType}" >
		    </div>
		    <div class="form-group">
		    	<label>휴일</label>
		      	<input type="text" class="form-control" name="holiday" value="${libraryInfo.holiday}" >
		    </div>
		    <div class="form-group">
		    	<label>좌석 수</label>
		      	<input type="text" class="form-control" name="openSeat" value="${libraryInfo.openSeat}" >
		    </div>
		    <div class="form-group">
		    	<label>자료수(도서)</label>
		      	<input type="text" class="form-control" name="bookCount" value="${libraryInfo.bookCount}" >
		    </div>
		    <div class="form-group">
		    	<label>자료수(연속간행)</label>
		      	<input type="text" class="form-control" name="bookCount2" value="${libraryInfo.bookCount2}" >
		    </div>
		    <div class="form-group">
		    	<label>자료수(비도서)</label>
		      	<input type="text" class="form-control" name="bookCount3" value="${libraryInfo.bookCount3}" >
		    </div>
		    <div class="form-group">
		    	<label>도로명주소</label>
		      	<input type="text" class="form-control" name="loadAddress" value="${libraryInfo.loadAddress}" >
		    </div>
		    <div class="form-group">
		    	<label>운영기관</label>
		      	<input type="text" class="form-control" name="operation" value="${libraryInfo.operation}" >
		    </div>
		    <div class="form-group">
		    	<label>전화번호</label>
		      	<input type="text" class="form-control" name="phoneNumber" value="${libraryInfo.phoneNumber}" >
		    </div>
		    <div class="form-group">
		    	<label>홈페이지 주소</label>
		      	<input type="text" class="form-control" name="homepage" value="${libraryInfo.homepage}" >
		    </div>
		  
		      <div class="form-group">
		    	<label>위도(필수)</label>
		      	<input type="text" class="form-control" name="latitude" value="${libraryInfo.latitude}" >
		     </div>
		     
		       <div class="form-group">
		    	<label>경도(필수)</label>
		      	<input type="text" class="form-control" name="longtitude" value="${libraryInfo.longtitude}" >
		     </div>
		     
		     
		     
		    <div>
			    
			    <button type="submit" class="btn btn-primary">등록</button>
			    <a href="/libraryInfo/libraryList"><button type="button" class="btn btn-primary">취소</button></a>
		    </div>
	  	</form>
	</div>
	
	
</body>
</html>