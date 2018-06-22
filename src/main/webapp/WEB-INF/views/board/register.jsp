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
	<style> 
		.form-control:disabled, .form-control[readonly]{
			background: #ffffff;
		}
	</style>
	<div class="container">
  		<form method="post">
  			<h1>게시글 등록</h1>
		    <div class="form-group">
		    	<label>제목</label>
		      	<input type="text" class="form-control" name="title" value="${board.title}" >
		    </div>
		    <div class="form-group">
		    	<label>내용</label>
		      	<textarea class="form-control" rows="5" name="contents" >${board.contents}</textarea>
		    </div>
		    <div>
			    
			    <button type="submit" class="btn btn-primary">등록</button>
			    <a href="/board/list"><button type="button" class="btn btn-primary">취소</button></a>
		    </div>
	  	</form>
	  	
	</div>
</body>
</html>