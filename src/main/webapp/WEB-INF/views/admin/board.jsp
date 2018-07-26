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
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container">
			<div class="col-12">
			  	<div class="float-right">
			  		<a href="/loginhome">홈으로</a>
		  			<span style="color:white"> | </span>
			  		<a href="/modify">회원 정보 수정</a>
				  	<span style="color:white"> | </span>
					<a href="/logout">로그아웃</a>
				</div>
			</div>
	  	</div>
	</nav>
	
	<div class="container">
		<h1>관리자 메뉴</h1>
		<br>
		<h1>
			<c:if test="${!admin}"> 
		 <a href="/admin/user">유저 관리</a>
			</c:if>
			
			| <a href="/admin/boardLog">게시판 로그</a>
		
			
			| <a href="/admin/libraryInfoLog">도서관 정보 로그</a>
			
		
			| <a href="/admin/recBookLog">추천 도서 로그</a>
			<c:if test="${!admin}"> 
			| <a href="/admin/accountLog">유저 로그</a>
			</c:if>
			
		</h1>
		
		
	</div>
	
</body>
</html>