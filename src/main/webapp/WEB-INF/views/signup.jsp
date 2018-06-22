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
<body>
<div class="container">
	<h1>
		회원가입
	</h1>
  <form method="post" id="formId">
    <div class="form-group">
      <label for="usr">Id:</label>
      <input type="text" class="form-control" id="usr" name="id"
      	onchange="validationId(this)">
      <div style="color:red; display:none;" id="inforId">
             아이디는 영문자와 숫자로 이루어져 있며, 5~10자이어야 합니다.
      </div>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pw"
        onchange="validationPw(this)">
	  <div style="color:red; display:none;" id="inforPw">
	     비밀번호는 영문자와 숫자가 1개이상 포함되어야 하며, 8자~20자이어야 합니다.
	  </div>
    </div>

    <div class="form-group">
      <label for="pwd">Email:</label>
      <input type="email" class="form-control" id="pwd" name="email">
    </div>
    <button type="submit" class="btn btn-primary">로그인</button>
  </form>
</div>
<script>
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
	
</script>
</body>
</html>





