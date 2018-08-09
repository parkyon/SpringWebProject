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
	
	
	
	
	
	
	<div>

  
<div class="container-fluid text-center">    
  <div class="row content">

    <div class="col-sm-10 text-left"> 
      <h1>${recBook.bookName}</h1>
        <hr>
        
        
        
       <div class="row">
        <div class="col-sm-6">
 		
 		
 		
 		
 		
 		
          
           <object codetype="jpg/png/bmp" id="nzeo" width="300px" height="400px" data="/recBook/download?fileName=${recBook.filepath}" name="aaa">
		  </object>
        


          
         
        </div>
        <div class="col-sm-6">
        
        	저자:${recBook.writer} </br>
         	유형:${recBook.bookType}</br>
       		 출판사:${recBook.publisher}</br>
       		<hr>
       		네티즌 </br>
       		추천수 :${recBook.recomand} </br>
			비추천수 : ${recBook.notrecomand}
       		
       		 <hr>
       		<h2> 가격:${recBook.price}</h2>
       		<button>구입하기</button>
       		
       		
         	
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
			<tr>
				<th>번호</th>
				<th>도서관명</th>
				<th>지역</th>
				<th>전화번호</th>
				<th>추천</th>
				<th>조회수</th>
			
			</tr>
		</thead>
		<tbody>
			<c:forEach var="recBookReview" items="${list}">
				<tr>
					<td>${recbookreview.number}</td>
					<td>${recbookreview.writer}</td>
					<td>${recbookreview.reg_date}</td>
					
					
					
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
            
            
                
            </div>
        </div>
    </div>
    </div>
   
   
   
   
    
  </div>
</div>






</div>
	
	
</body>
</html>