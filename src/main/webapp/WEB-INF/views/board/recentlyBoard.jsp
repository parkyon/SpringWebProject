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

	


    <script type="text/javaScript" language="javascript" defer="defer">
     
    </script>
</head>
<body>
	
	
	<div class="container">
	
		
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
					<td><a href="/board/detail?number=${board.number}"target=_blank>${board.title }</a></td>
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
	
	
	</div>
	
	
</body>
</html>