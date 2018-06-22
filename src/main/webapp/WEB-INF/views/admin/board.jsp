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
			  		<a href="/board/list">게시판 페이지</a>
		  			<span style="color:white"> | </span>
			  		<a href="/modify">회원 정보 수정</a>
				  	<span style="color:white"> | </span>
					<a href="/logout">로그아웃</a>
				</div>
			</div>
	  	</div>
	</nav>
	
	<div class="container">
		<h1>게시판 관리 
		<c:if test="${!admin}">
			  			<a href="/admin/user">유저페이지</a>
			  			<span style="color:white"> | </span>
			  		</c:if>
		
		
		
		</h1>
		
			  	
			  	
		
		
		<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list}" varStatus="page">
				<tr>
					<td>${board.number}</td>
					<td><a href="/board/detail?number=${board.number}">${board.title }</a></td>
					<td>${board.author }</td>
					<td>
						<c:if test="${board.disable.compareTo('TRUE')==0}">
							<a href="/admin/board/disable?number=${board.number}&disable=FALSE&page=${pageMaker.criteria.page}">
								<button>복구</button>
							</a>
						</c:if>
						<c:if test="${board.disable.compareTo('FALSE')==0}">
							<a href="/admin/board/disable?number=${board.number}&disable=TRUE&page=${pageMaker.criteria.page}">
								<button>삭제</button>
							</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination" style="justify-content: center;">
		<c:if test="${pageMaker.prev}">
	  		<li class="page-item">
	  			<a class="page-link" 
	  			href="/admin/board?page=${pageMaker.startPage-1}">Prev</a>
  			</li>
  		</c:if>
	  	<c:forEach var="page" begin="${pageMaker.startPage}" 
	  		end="${pageMaker.endPage}" >
	  		<li class="page-item">
	  			<a class="page-link" href="/admin/board?page=${page}">${page}</a>
  			</li>
	  	</c:forEach>
	  	<c:if test="${pageMaker.next}">
	  		<li class="page-item">
	  			<a class="page-link" href="/admin/board?page=${pageMaker.endPage+1}">Next</a>
  			</li>
  		</c:if>
	</ul>
	</div>
</body>
</html>