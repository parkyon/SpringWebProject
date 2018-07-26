<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
<%--     <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> --%>

	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.4.3/css/foundation.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.foundation.min.css">


	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

	<script type="text/javascript" class="init">

	$.extend( true, $.fn.dataTable.defaults,
	{
		"language": {
			"url": "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Korean.json"
		}
	});

	$(document).ready(function() {

		var table = $('#example').DataTable();
		"pageLength": 3

	} );
	</script>


    <script type="text/javaScript" language="javascript" defer="defer">
     
    </script>
</head>
<body>
	<nav class="navbar navbar-inverse">
  <div class="container-fluid container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">도서관정보</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/loginhome">Home</a></li>
       
      </ul>
    
      		
    

       <ul class="nav navbar-nav navbar-right">
         <ul class="nav navbar-nav navbar-right">
         <c:if test="${admin}">
			  	<li><a href="/admin/boardLog" class ="	glyphicon glyphicon-edit">로그보기</a></li>
			  	<span style="color:white"></span>
			</c:if>
        <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
      	<li><a href="/board/myboards" class ="	glyphicon glyphicon-edit">내가 쓴글</a></li>
			  		<span style="color:white">  </span>
		<li><a href="/modify" class ="	glyphicon glyphicon-edit">회원정보수정</a></li>
				  	<span style="color:white">  </span>
   
      <form class="navbar-form navbar-right" action="/action_page.php">
      <div class="form-group">
        
      </div>
    </form>
     
      
    </div>
  </div>
</nav>
	
	<div class="container">
		<h1>자유 게시판 </a></h1>
		
		<table class="table table-bordered" id="example">
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
	
	<a href="/board/register">
		<button class="btn btn-primary"> 등록 </button>
	</a>
	</div>
	
	
</body>
</html>