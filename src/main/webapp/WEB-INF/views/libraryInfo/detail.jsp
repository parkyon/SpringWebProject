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
  			<h1>게시글 상세</h1>
		    <div class="form-group">
		    	<label>번호</label>
		      	<input type="text" class="form-control" name="number" value="${libraryInfo.number }" disabled>
		    </div>
		    <div class="form-group">
		    	<label>도서관명</label>
		      	<input type="text" class="form-control" name="libraryName" value="${libraryInfo.libraryName}" disabled>
		    </div>
		    <div class="form-group">
		    	<label>첨부파일</label>
		      	<div class="form-control" name="file" id="file" >
		      		<c:if test="${fileName != null }">
		      			<a href="/libraryInfo/download?fileName=${libraryInfo.filepath}"
		      			 target="_blank">${fileName}</a>
		      		</c:if>
		      		<c:if test="${fileName == null }">
		      			첨부파일 없음
		      		</c:if>
		      	</div>
		    </div>
		    <div class="form-group">
		    	<label>작성자</label>
		      	<input type="text" class="form-control" name="author" value="${libraryInfo.author}" disabled>
		    </div>
		    <div class="form-group">
		    	<label>홈페이지주소</label>
		      	<textarea class="form-control" rows="5" name="homepage" disabled>${libraryInfo.homepage}</textarea>
		    </div>
	  	</form>
	  	<div>
		    <a href="/libraryInfo/libraryList"><button class="btn btn-primary">목록</button></a>
		    <c:if test="${isAuthor}">
		    	<a href="/libraryInfo/modify?number=${libraryInfo.number }"><button class="btn btn-primary">수정</button></a>
		    	<a href="/libraryInfo/delete?number=${libraryInfo.number }"><button class="btn btn-outline-danger">삭제</button></a>
		    </c:if>
	    </div>
	</div>
</body>
</html>