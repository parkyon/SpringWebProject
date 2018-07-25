<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
  		<form >
  			<h1>추천 도서 상세</h1>
		    <div class="form-group">
		    	<label>번호</label>
		      	<input type="text" class="form-control" name="recBookNumber" value="${recBook.recBookNumber }" disabled>
		    </div>
		    <div class="form-group">
		    	<label>책 이름</label>
		      	<input type="text" class="form-control" name="bookName" value="${recBook.bookName}" disabled>
		    </div>    
		    
		    <div class="form-group">
		    	<label>책 유형</label>
		      	<input type="text" class="form-control" name="bookType" value="${recBook.bookType}" disabled>
		    </div>
		    <div class="form-group">
		    	<label>책 스토리</label>
		      	<input type="text" class="form-control" name="bookStory" value="${recBook.bookStory}" disabled>
		    </div>
		    <div class="form-group">
		    	<label>작가</label>
		      	<input type="text" class="form-control" name="writer" value="${recBook.writer}" disabled>
		    </div>
		    <div class="form-group">
		    	<label>작성자</label>
		      	<input type="text" class="form-control" name="author" value="${recBook.author}" disabled>
		    </div>
	  	</form>
	  	<div>
		    <a href="/recBook/recBookList"><button class="btn btn-primary">목록</button></a>
		    <c:if test="${isAuthor}">
		    	<a href="/recBook/modify?number=${recBook.number }"><button class="btn btn-primary">수정</button></a>
		    	<a href="/recBook/delete?number=${recBook.number }"><button class="btn btn-outline-danger">삭제</button></a>
		    </c:if>
	    </div>
	</div>
</body>
</html>