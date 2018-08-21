<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>로그인</title>
	

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
   <style>
 #div1 {
    padding-top: 10px;
    padding-right: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
    background-color:#DAD8D8;
    border:2px solid green;
}
   p{
	   font-size:14px
   }
   
.error{
	color:red
	
}
.cmxform {
    width: 500px;
}

	
   
   </style> 
   
   

	<script>
	

	$().ready(function() {

		

		// validate signup form on keyup and submit
		$("#commentForm2").validate({   //많이 사용함
			rules: {
			ID: {
					required: true,
					maxlength: 10
					
					
				},
				
				
			
			comment: "required"
			},
			messages: {
				ID: {
					required: "아이디를 입력해주세요",
					maxlength: "아이디는 초과"
									
				},
			
					PW: {
					required: "비밀번호를 입력해주세요",
					minlength : "비밀번호가 유효하지 않습니다"
									
				}
					
				
			}
		});
	});
	</script>
	
</head>
<body>
<h1 style="color:#AAA57D;">도서관정보 시스템</h1>
	</br>
	</br>
	<form method="post">
	<div class="col-sm-3">
	</div>
	<div id="div1" class="col-sm-6">
		<strong><h1 style="color:green;">로그인 </h1></strong>
	<p>로그인을 하시면 보다 많은 정보와 서비스를 이용하실 수 있습니다.</p>
	<hr>
    <div class="form-group">
      <label for="usr">아아디:</label>
      <input type="text" value="아이디 입력해주세요" onclick="this.value='';" class="form-control" id="usr" name="id">
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호:</label>
      <input type="password" value="비밀번호 입력해주세요" onclick="this.value='';" class="form-control" id="pwd" name="pw">
    </div>
    <button type="submit" class="btn btn-primary">로그인</button>
   <input type='BUTTON' class="btn btn-primary" onClick="history.back();" value=" 취소">
   
      </div>
       
       <div class="col-sm-3">
	</div>
  </form>
	
	<hr>

     <div class="col-sm-4">
	</div>
	
	   <div class="col-sm-4">
	 <center>  
	 </br>
	 </br>
			    <p>
			    아직 도서관 정보시스템 회원이 아니신가요?</p>
			   <a href="/signup">회원가입</a>
		        
			    <p>회원가입, 아이디/비밀번호 분실 등 관련 문의 : 010-9552-5344</p>
			    <p>충청북도 청주시 서원구 사창동 148-7 4,5층</p>
	 </center>
	 </div>
	  
    <div class="col-sm-4">
	</div>
</body>
</html>