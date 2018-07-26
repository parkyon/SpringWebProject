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
		<h1> 유저 관리</h1>
		
		<table class="table table-bordered">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>권한</th>
				<th>권한수정</th>
				<th>탈퇴</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${list}" varStatus="page">
				<tr>
					<td>${user.id}</td>
					<td>${user.email}</td>
					<td>${user.admin}</td>
					<td>
						<c:if test="${user.admin.compareTo('ADMIN')==0}">
							<a href="/admin/user/set?admin=USER&page=${pageMaker.criteria.page}&id=${user.id}">
								<button>USER</button>
							</a>
						</c:if>
						<c:if test="${user.admin.compareTo('USER')==0}">
							<a href="/admin/user/set?admin=ADMIN&page=${pageMaker.criteria.page}&id=${user.id}">
								<button>ADMIN</button>
							</a>
						</c:if>
					</td>
					<td><a href="Userdelete"><button>삭제</button></a> </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination" style="justify-content: center;">
		<c:if test="${pageMaker.prev}">
	  		<li class="page-item">
	  			<a class="page-link" 
	  			href="/admin/user?page=${pageMaker.startPage-1}">Prev</a>
  			</li>
  		</c:if>
	  	<c:forEach var="page" begin="${pageMaker.startPage}" 
	  		end="${pageMaker.endPage}" >
	  		<li class="page-item">
	  			<a class="page-link" href="/admin/user?page=${page}">${page}</a>
  			</li>
	  	</c:forEach>
	  	<c:if test="${pageMaker.next}">
	  		<li class="page-item">
	  			<a class="page-link" href="/admin/user?page=${pageMaker.endPage+1}">Next</a>
  			</li>
  		</c:if>
	</ul>
	</div>
</body>
</html>