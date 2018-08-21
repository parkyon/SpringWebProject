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
				<th>사진</th>
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
					<td>
					<c:set var="originalfilename" value="jquery.min.js" />
					<!-- 확장자가 대문자일경우를 고려하여 소문자로 파일명 변경 -->
					<c:set var="lowerfilename" value="${recBook.filepath}" />
					<!-- 문자열들을 .으로 split 한후 c:forTokens을이용하여 문자열들을 iterator한다 -->
					
					<c:forTokens var="ext" items="${lowerfilename}" delims="." varStatus="status">
					    <!-- 파일명중간에 "." 이 존재할수도 있으니 항상 status.last(마지막번째) 를 실행해주어야 한다 -->
					    <c:if test="${status.last}">
					        <c:choose>
					            <c:when test="${ext eq 'bmp' }">
					                <!-- 엑셀파일일경우 -->
							  <center><img width="80" max-height=40% src="/recBook/download?fileName=${recBook.filepath}">
					        </center>
					            </c:when>
					            <c:when test="${ext eq 'png'}">
					                <!-- 한글파일일경우 -->
							  <center><img width="80" max-height=40% src="/recBook/download?fileName=${recBook.filepath}">
					        </center>
					        
					            </c:when>
					            <c:when test="${ext eq 'jpg'}">
					                <!-- 자바스크립트파일일경우 -->
					               
							  <center><img width="80" max-height=40% src="/recBook/download?fileName=${recBook.filepath}">
					        </center>
					            </c:when>
					            <c:when test="${!ext eq 'bmp'&& !ext eq'jpg' && !ext eq 'png' }">
					                <!-- 엑셀파일일경우 -->
							  <center><img width="80" max-height=40% src="/recBook/download?fileName=${recBook.filepath}">
					        </center>
					            </c:when>
					        </c:choose>
					    </c:if>
					</c:forTokens>
					</td>
					<td><span><a href="/recBook/detail?recBookNumber=${recBook.recBookNumber}">${recBook.bookName }</a> <a href="/recBook/detail?recBookNumber=${recBook.recBookNumber}" style="color:red">(${recBook.guestReview })</a>
					
				
					</span></td>
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