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
	회원정보 수정
</h1>
  <form method="post">
    <div class="form-group">
      <label for="usr">Id:</label>
      <input type="text" class="form-control" id="usr" name="id" disabled
      value="${nowUser.id }">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pw"
      value="">
    </div>
    <div class="form-group">
      <label for="pwd">Confirm Password:</label>
      <input type="password" class="form-control" id="pwdConfirm" name="pwConfirm"
      value="">
    </div>
    <div class="form-group">
      <label for="usr">email:</label>
      <input type="email" class="form-control" id="email" name="email"
      value="${nowUser.email }">
    </div>
    <button type="submit" class="btn btn-primary">회원정보 수정</button>
    <a href="/board/list">
    <input type="button" value="취소" class="btn btn-primary"/> 
    </a>
    <a href="/member/withdraw">
    <input type="button" value="탈퇴" class="btn btn-danger"/> 
    </a>
  </form>
  
</div>
</body>
</html>