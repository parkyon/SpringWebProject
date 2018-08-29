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
  			<h1>도서관 등록</h1><hr>
		<div class="row content">
			<div class="col-sm-12 text-left"> 
				<div class="row">
       				<div class="col-sm-6">
	        			<h3>필수사항</h3><hr color="red">
	            		 도서관명:<input type="text" class="form-control" name="libraryName" value="${libraryInfo.libraryName}" ></br>
	         			도로명주소:	<input type="text" class="form-control" name="loadAddress" value="${libraryInfo.loadAddress}" ></br>
	         			위도:<input type="text" class="form-control" name="latitude" value="${libraryInfo.latitude}" ></br>
		    			경도:<input type="text" class="form-control" name="longtitude" value="${libraryInfo.longtitude}" ></br>     
					</div>
					
        			<div class="col-sm-6">
			        	<h3>자료수</h3><hr color="red">
			       		도서 : <input type="text" class="form-control" name="bookCount" value="${libraryInfo.bookCount}" ></br>
			         	연속간행물 : <input type="text" class="form-control" name="bookCount2" value="${libraryInfo.bookCount2}" ></br>
			         	비도서 : <input type="text" class="form-control" name="bookCount3" value="${libraryInfo.bookCount3}" ></br>
			         	</br>
		      			 <span style="float:right"><button type="submit" class="btn btn-primary">등록</button>
						<a href="/libraryInfo/libraryList"><button type="button" class="btn btn-primary">취소</button></a></span>
		      		</div>       
		      		<div class="col-sm-12">
		      	
		      		</div>
         			<div class="col-sm-6">
         			
         			</br>
         				<h3>기타사항</h3><hr color="red">
         			도서관 유형:	<input type="text" class="form-control" name="libraryType" value="${libraryInfo.libraryType}" ></br>
			       	휴일:<input type="text" class="form-control" name="holiday" value="${libraryInfo.holiday}" ></br>
			       	 좌석수:<input type="text" class="form-control" name="openSeat" value="${libraryInfo.openSeat}" ></br>
	       			</div>
	       			<div class="col-sm-6">
	       			 도시 이름:<input type="text" class="form-control" name="cityName" value="${libraryInfo.cityName}" ></br>
					 운영기관:<input type="text" class="form-control" name="operation" value="${libraryInfo.operation}" ></br>
					전화번호: 	<input type="text" class="form-control" name="phoneNumber" value="${libraryInfo.phoneNumber}" ></br>
					 홈페이지 주소:<input type="text" class="form-control" name="homepage" value="${libraryInfo.homepage}" ></br>
			    	</div>
			    	</div>
			</div>
		</div>
	</div>
			
		<div>
			
		</div>
	  	</form>
	</div>
	
	
</body>
</html>