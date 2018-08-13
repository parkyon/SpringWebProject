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


<style>
#none{ display:none;}






</style>

<!-- 유효성검사 -->


</head>
<body>
	<style> 
		.form-control:disabled, .form-control[readonly]{
			background: #ffffff;
		}
	</style>
	
	
	
	
	
	



<div class="container-fluid text-center">    
  <div class="row content">

    <div class="col-sm-10 text-left"> 
      <h1>${recBook.bookName}</h1>
        <hr>
        
        
        
       <div class="row">
        <div class="col-sm-6">
 		
 		
 		
 		<!-- 임의의 파일명을 위하여 filename이라는 변수에 value set -->
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
                 <object codetype="jpg/png/bmp" id="nzeo" width="300px" height="400px" data="/recBook/download?fileName=${recBook.filepath}" name="aaa">
		  </object>
            </c:when>
            <c:when test="${ext eq 'png'}">
                <!-- 한글파일일경우 -->
               <object codetype="jpg/png/bmp" id="nzeo" width="300px" height="400px" data="/recBook/download?fileName=${recBook.filepath}" name="aaa">
		  </object>
        
            </c:when>
            <c:when test="${ext eq 'jpg'}">
                <!-- 자바스크립트파일일경우 -->
                <object codetype="jpg/png/bmp" id="nzeo" width="300px" height="400px" data="/recBook/download?fileName=${recBook.filepath}" name="aaa">
		  </object>
        
            </c:when>
            <c:when test="${!ext eq 'bmp'&& !ext eq'jpg' && !ext eq 'png' }">
                <!-- 엑셀파일일경우 -->
                 <object codetype="jpg/png/bmp" id="nzeo" width="300px" height="400px" data="/resources/jpg/noimg.jpg" name="aaa">
		  </object>
            </c:when>
        </c:choose>
    </c:if>
</c:forTokens>



 	
        
          


          
         
        </div>
        <div class="col-sm-6">
        	번호:${recBook.recBookNumber}</br>
        	저자:${recBook.writer} </br>
         	유형:${recBook.bookType}</br>
       		 출판사:${recBook.publisher}</br>
       		<hr>
       		네티즌 </br>
       		추천수 :${recBook.recomand} </br>
			비추천수 : ${recBook.notrecomand}
       		
       		 <hr>
       		<h2> 가격:${recBook.price}</h2>
       	<a href="${recBook.sell}" target="_blank"><button>구입하러가기</button></a>
       		
       		
         	
        </div>
 
		</div>
		
		<div>
		<span style="float:right"><a href="/recBook/rec?recBookNumber=${recBook.recBookNumber }"><button class="btn btn-primary">추천</button></a>
	  		<a href="/recBook/notrec?recBookNumber=${recBook.recBookNumber }"><button class="btn btn-primary">비추천</button></a>
      <a href="/recBook/recBookList"><button class="btn btn-primary">목록</button></a> 
      <c:if test="${admin }" >
		    	<a href="/recBook/modify?recBookNumber=${recBook.recBookNumber }"><button class="btn btn-primary">수정</button></a>
		    	<a href="/recBook/delete?recBookNumber=${recBook.recBookNumber }"><button class="btn btn-outline-danger">삭제</button></a>
		    </c:if>
      </span>
 
      </br>
	 </div>
     
      
       
       
       <div>
        <ul class="tabs" data-persist="true">
            <li><a href="#view1">책정보</a></li>
            <li><a href="#view2">작성자리뷰</a></li>
            <li><a href="#view3">네티즌리뷰</a></li>
            <li><a href="#view4">첨부파일</a></li>
        </ul>
        <div class="tabcontents">
            <div id="view1">
                ${recBook.bookStory}
                
      
                
            </div>
            <div id="view2">
               ${recBook.review}
               
             
            </div>
            <div id="view3">
            
           
           
		<table class="table table-bordered" id="example">
		<thead>
		<div class="container">
  		<form method="post" 
  			enctype="multipart/form-data">
  		<input type="hidden" value="${recBook.recBookNumber}" name="recBookNumber">
  		<input type="hidden" value="${recBook.author}" name="author">
  	  		
  	
  	
  	
  	
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
				<th>수정</th>
			
			
			</tr>
		</thead>
		<tbody>
			<c:forEach var="recbookReview" items="${list}" varStatus="status">
				<tr>
				
			
					<td>${status.count}</td>
					<td>${recbookReview.content}</td>
					
					<td>${recbookReview.writer}</td>
					<td>${recbookReview.reg_date}</td>
					<td><c:if test="${isAuthor}">
					<a href="contentModify?recviewnumber=${recbookReview.recviewnumber}">수정</a>/
					<a href="contentDelete?recviewnumber=${recbookReview.recviewnumber}">삭제</a>
					</c:if></td>
					
					
					
					
					
				</tr>
			</c:forEach>
		
			
		
		</tbody>
	</table>
            
            
                
            </div>
            
            
            <div id="view4">
               <label>첨부파일</label>
		      	<div class="form-control" name="file" id="file" >
		      		<c:if test="${fileName != null }">
		      			<a href="/recBook/download?fileName=${recBook.filepath}"
		      			>${fileName}</a>
		      		</c:if>
		      		<c:if test="${fileName == null }">
		      			첨부파일 없음
		      		</c:if>
		      	</div>
                
      
                
            </div>
       
    </div>
    </div>
   
   
   
   
    
  </div>
</div>






</div>
	
	
</body>
</html>