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
<script src="/resources/tabcontent.js" type="text/javascript"></script>
    <link href="/resources/css/tabcontent.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<style> 
		.form-control:disabled, .form-control[readonly]{
			background: #ffffff;
		}
	</style>
	<div class="container">
  		<form >
  		<div class="form-group">
		    	<h1>${board.title}</h1>
		</div>
		 
		    
		    <div class="form-group">
		    작성자 ${board.author}</br>
		    조회수${board.hits}</br> 
		  작성날짜${board.created_date}</br>
		  추천수${board.recomand }</br>
		 비추천수${board.notrecomand}</br>
		  
		    
		    </div>
 

		    
		    <hr>
		    <div class="form-group">
		    
		      	<textarea class="form-control" rows="5" name="contents" disabled>${board.contents}</textarea>
		    </div>
		
		    	
		      	
		   
		    
		    
		    
		        
	  	</form>
	  	<div>
	  	<hr>
	  	<span style="float:right">
	  	<a href="/board/rec?number=${board.number }"><button class="btn btn-primary">추천</button></a>
		   <a href="/board/notrec?number=${board.number }"><button class="btn btn-primary">비추천</button></a>
		    <a href="/board/list"><button class="btn btn-primary">목록</button></a>
		    <a href="/board/register"><button class="btn btn-primary">글쓰기</button></a>
		    <c:if test="${isAuthor}">
		    	<a href="/board/modify?number=${board.number }"><button class="btn btn-primary">수정</button></a>
		    	<a href="/board/delete?number=${board.number }"><button class="btn btn-outline-danger">삭제</button></a>
		    </c:if>
		    
		    </span>
	    </div>
	</div>
	</br>
	</br>
	<div>
        <ul class="tabs" data-persist="true">
            <li><a href="#view1">Lorem</a></li>
            <li><a href="#view2">Using other templates</a></li>
            <li><a href="#view3">첨부파일</a></li>
        </ul>
        <div class="tabcontents">
            <div id="view1">
                <b>Lorem Issum</b>
                <p>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...</p>
                
            </div>
            <div id="view2">
                <table class="table table-bordered" id="example">
		<thead>
		<div class="container">
  		<form method="post" 
  			enctype="multipart/form-data">
  		<input type="hidden" value="${board.number}" name="recBookNumber">
  		<input type="hidden" value="${board.author}" name="author">
  	
  	  		
  	
  	
  	
  	
		    <div class="form-group">
		    	
		    	<input  type="text" class="form-control" name="content" value="" >
		      	<button type="submit" class="btn btn-primary">등록</button>
		      	
		    </div>
		</form>
	</div>
		
		
			<tr>
			
				<th>번호</th>
				<th>내용</th>
				<th>작성자</th>
				<th>날짜</th>
				<c:if test="${isAuthor}">
				<th>수정/삭제</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="boardComment" items="${list}" varStatus="status">
				<tr>
				
					
					<td>${status.count}</td>
					<td>${boardComment.content}</td>
					
					<td>${boardComment.writer}</td>
					<td>${boardComment.reg_date}</td>
					<c:if test="${isAuthor}"><td>
					 
					 
					 
					<p onclick="onModals(${boardComment.cno},'${boardComment.content}')">수정/삭제</p>
					

					  <div id="id01" class="w3-modal id01">
					    <div class="w3-modal-content">
					      <header class="w3-container w3-teal"> 
					        <span onclick="$('.id01').css('display','none')" 
					        class="w3-button w3-display-topright">&times;</span>
					        <h2>수정/삭제</h2>
					      </header>
					      <div class="w3-container">
					     <form method="post" class="form-test" action="commentModify?cno=${boardComment.cno}"   >
					     
					        <input  type="text" class="form-control content1" name="content1" value="" >
		      				<button type="submit" class="btn btn-primary">수정</button>
		      				<button class="btn btn-primay"><a href="commentDelete?cno=${boardComment.cno}">삭제</a></button>
						</form>
					 	
					 		
					  </div>
					</td>
					</c:if>
					
					
				</tr>
			</c:forEach>
		
			
		
		</tbody>
	</table>
                
                
                
            </div>
            <div id="view3">
                <div class="form-control" name="file" id="file" >
		      		<c:if test="${fileName != null }">
		      			<a href="/board/download?fileName=${board.filepath}"
		      			target="aaa">${fileName}</a>
		      		</c:if>
		      		<c:if test="${fileName == null }">
		      			첨부파일 없음
		      		</c:if>
		      	</div>
            </div>
        </div>
    </div>
</div>
<script>
//$(document).ready(function(){
	function onModals(num, content){
		$('.id01').css('display','block');
		$('.content1').val(content);
		$('.form-test').prop('action', 'commentModify?cno='+num);
	}
	
//});
</script>		
</body>
</html>