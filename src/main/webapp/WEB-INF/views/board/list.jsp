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
			  	<form class="form-inline" 
			  		style="display:inline-block">
		  		  	<select class="form-control" name="type">
		  		  		<option value="0"
		  		  			<c:out value="${type==0?'selected':''}"/>
		  		  		>선택</option>
					    <option value="1" 
					    	<c:out value="${type==1?'selected':''}"/>
					    >제목</option>
					    <option value="2"
					    	<c:out value="${type==2?'selected':''}"/>
					    >저자</option>
					    <option value="3"
					    	<c:out value="${type==3?'selected':''}"/>
					    >내용</option>
					</select>
			    	<input class="form-control mr-sm-2" type="text" 
			    	placeholder="Search" name="search" value="${search}">
			    	<button class="btn btn-success" type="submit">Search</button>
			  	</form>
			  	<div class="float-right">
			  		<c:if test="${admin}">
			  			<a href="/admin/board">관리자 페이지</a>
			  			<span style="color:white"> | </span>
			  		</c:if>
				  	<a href="/modify">회원 정보 수정</a>
				  	<span style="color:white"> | </span>
					<a href="/logout">로그아웃</a>
				</div>
			</div>
	  	</div>
	</nav>
	
	<div class="container">
		<h1>게시판 목록 | <a href="/board/myboards">My Boards</a></h1>
		
		<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.number}</td>
					<td><a href="/board/detail?number=${board.number}">${board.title }</a></td>
					<td>${board.author }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination" style="justify-content: center;">
		<c:if test="${pageMaker.prev}">
	  		<li class="page-item">
	  			<a class="page-link" 
	  			href="/board/list?page=${pageMaker.startPage-1}&type=${type}&search=${search}">Prev</a>
  			</li>
  		</c:if>
	  	<c:forEach var="page" begin="${pageMaker.startPage}" 
	  		end="${pageMaker.endPage}" >
	  		<li class="page-item">
	  			<a class="page-link" href="/board/list?page=${page}&type=${type}&search=${search}">${page}</a>
  			</li>
	  	</c:forEach>
	  	<c:if test="${pageMaker.next}">
	  		<li class="page-item">
	  			<a class="page-link" href="/board/list?page=${pageMaker.endPage+1}&type=${type}&search=${search}">Next</a>
  			</li>
  		</c:if>
	</ul>
	<a href="/board/register">
		<button class="btn btn-primary"> 등록 </button>
	</a>
	</div>
</body>
</html>