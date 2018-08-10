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
<script src="/resources/jquery.validate.js"></script>
<script src="/resources/additional-methods.js"></script>

   
</head>
<body>
<script>

$("#dup").on("click",function(){
	var id = $("#id").val();//id가 id인 input 태그에 입력된 id 가져오기
	$.ajax({
		async:true,
		type:'POST',
		data:id,
		url:"member/dup",
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
			if(data.cnt > 0){
				alert("아이디 존재");
			}else{
				alert("아이디 사용 가능");
			}
		}
	});
});
</script>
 <script>
    $(function(){
        $("form").validate({
            rules: {
                id: {
                    required : true,
                    minlength : 4
                },
                pw: {
                    required : true,
                    minlength : 8,
                    regex: /^(?=\w{8,20}$)\w*(\d[A-z]|[A-z]\d)\w*$/
                },
              
                name: {
                    required : true,
                    minlength : 2
                },
                age: {
                    digits : true
                },
                email: {
                    required : true,
                    minlength : 2,
                    email : true
                },
                homepage: {
                    url : true
                }
            },
            //규칙체크 실패시 출력될 메시지
            messages : {
                id: {
                    required : "필수로입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다"
                },
                pw: {
                    required : "필수로입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
                },
                
                name: {
                    required : "필수로입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다"
                },
                age: {
                    digits : "숫자만입력하세요"
                },
                email: {
                    required : "필수로입력하세요",
                    minlength : "최소 {0}글자이상이어야 합니다",
                    email : "메일규칙에 어긋납니다"
                },
                homepage: {
                    url : "정상적인 URL이 아닙니다"
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
<div class="container">
	<h1>
		회원가입
	</h1>
  <form method="post" id="formId">
    <div class="form-group">
      <label for="usr">Id:</label>
      <input type="text" class="form-control" id="id" name="id">
        <button class="btn" id="dup">중복확인</button>
      <div style="color:red; display:none;" id="inforId">
    
             아이디는 영문자와 숫자로 이루어져 있며, 5~10자이어야 합니다.
      </div>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pw" name="pw">
	  <div style="color:red; display:none;" id="inforPw">
	     비밀번호는 영문자와 숫자가 1개이상 포함되어야 하며, 8자~20자이어야 합니다.
	  </div>
    </div>

    <div class="form-group">
      <label for="pwd">Email:</label>
      <input type="email" class="form-control" id="email" name="email">
    </div>
    <button type="submit" class="btn btn-primary">가입</button>
    <button class="btn btn-primary" onClick="history.back();" >취소</button>
  </form>
</div>
<!-- <script>
	function validationId(id){
		var inforId = document.getElementById('inforId');
		var idText = id.value;
		var idRegex = /^\w{5,10}$/;
		inforId.style.display = 'none';
		if(idText != null && idRegex.test(idText)){
			return true;
		}
		else{
			inforId.style.display = 'block';
			return false;
		}
	}
	function validationPw(pw){
		var inforPw = document.getElementById('inforPw');
		var pwText = pw.value;
		var pwRegex = /^(?=\w{8,20})(\w*((\d[a-zA-Z])|([a-zA-Z]\d))\w*)$/;
		inforPw.style.display = 'none';
		if(pwText != null && pwRegex.test(pwText)){
			return true;
		}
		else{
			inforPw.style.display = 'block';
			return false;
		}
	}
	var formId = document.getElementById('formId');
	formId.onsubmit = function(){
		var id = document.getElementById('usr');
		var pw = document.getElementById('pwd');
		var isOk = true;//제출을 할건지 말건지 결정하는 변수
		
		if(!validationId(id))
			isOk = false;
		if(!validationPw(pw))
			isOk = false;
		if(!isOk)
			return false;
		return true;
	}
	
</script> -->
</body>
</html>





