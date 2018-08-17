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

	} );
	</script>


    <script type="text/javaScript" language="javascript" defer="defer">
     
    </script>
</head>
<body>


  
    
	
	
	<div class="container">
		<h1>역대 추천도서</a></h1>
		
		<table class="table table-bordered" id="example">
		<thead>
			<tr>
				<th>번호</th>
				<th>책이름</th>
				<th>책유형</th>
				<th>작가</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="recBook" items="${list}" varStatus="status">
				<tr>
				
			
					<td>${status.count}</td>
					<td><span><a href="/recBook/detail?recBookNumber=${recBook.recBookNumber}">${recBook.bookName }</a> <a href="/recBook/detail?recBookNumber=${recBook.recBookNumber}" style="color:red">(${recBook.guestReview })</a></span></td>
					<td>${recBook.bookType }</td>
					<td>${recBook.writer }</td>
					<td>${recBook.hits}  </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<c:if test="${admin}">
	<a href="/recBook/register">
		<button class="btn btn-primary"> 등록 </button>
		</c:if>
	</a>
	</div>
	
	
</body>
</html>