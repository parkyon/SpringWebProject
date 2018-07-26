<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>도서관정보시스템</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/resources/css/default.css" rel="stylesheet" type="text/css" />
<script src="http://www.tagkorea.pe.kr/js/starwiz.js"></script>


<script type="text/javascript" class="init">

	$.extend( true, $.fn.dataTable.defaults,
	{
		"language": {
			"url": "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Korean.json"
		}
	});

	$(document).ready(function() {

		var table = $('#example').DataTable({
			  "pageLength": 5
		});

	} );
	</script>



<script src="http://www.tagkorea.pe.kr/js/starwiz.js"></script>
     
    
</head>

<body background="">


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
        <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
      	</ul>
      		<c:if test="${admin}">
			  	<li><a href="/admin/board" class ="	glyphicon glyphicon-edit">관리자페이지</a></li>
			  	<span style="color:white"></span>
			</c:if>
      </ul>
      <form class="navbar-form navbar-right" action="/action_page.php">
      <div class="form-group">
        
      </div>
    </form>
     
      
    </div>
  </div>
</nav>
  

</div>
<div class="container">
  
  <div class="btn-group btn-group-justified">
    <a href="/siteInfo" class="btn btn-primary">사이트소개</a>
    
    <a href="/libraryInfo/libraryList" class="btn btn-primary">도서관정보</a>
    <a href="/recBook/recBookList" class="btn btn-primary">추천도서</a>
    <a href="/board/list" class="btn btn-primary">자유게시판</a>
    
  </div>
     <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
        
        <!--페이지-->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!--페이지-->
    
        <div class="carousel-inner">
            <!--슬라이드1-->
            <div class="item active"> 
                <img src="http://www.blueb.co.kr/SRC2/_image/w01.jpg" alt="First slide" width="89%" height="348" style="width:100%">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Slide 1</h1>
                        <p>텍스트 1</p>
                  </div>
              </div>
          </div>
            <!--슬라이드1-->
    
            <!--슬라이드2-->
            <div class="item"> 
                <img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg" style="width:100%" data-src="" alt="Second slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Slide 2</h1>
                        <p>텍스트 2</p>
                    </div>
                </div>
            </div>
            <!--슬라이드2-->
            
            <!--슬라이드3-->
            <div class="item"> 
                <img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%" data-src="" alt="Third slide">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Slide 3</h1>
                        <p>텍스트 3</p>
                    </div>
                </div>
            </div>
            <!--슬라이드3-->
        </div>
        
        <!--이전, 다음 버튼-->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
        <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
    </div>


  
<div class="container-fluid bg-3 text-center">    
  <h3>Some of my Work</h3><br>
  <div class="row">
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br>

<div class="container-fluid bg-3 text-center">    
  <div class="row">
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>도서 정보 최신글</p>
     <table class="table table-bordered" id="example">
		<thead>
			<tr>
				<th>번호</th>
				<th>도서관명</th>
				<th>지역</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="libraryInfo" items="${list2}">
				<tr>
					<td>${libraryInfo.number}</td>
					<td><a href="/libraryInfo/detail?number=${libraryInfo.number}">${libraryInfo.libraryName }</a></td>
					<td>${libraryInfo.cityName }</td>
					<td>${libraryInfo.phoneNumber }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
    </div>
    <div class="col-sm-3"> 
      <p>자유 게시판 최신글</p>
      
      
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
    </div>
    <div class="col-sm-3">
      <p>추천 도서 최신글</p>
    
		
		<table class="table table-bordered" id="example">
		<thead>
			<tr>
				<th>번호</th>
				<th>책이름</th>
				
				<th>작가</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="recBook" items="${list1}">
				<tr>
					<td>${recBook.recBookNumber}</td>
					<td><a href="/recBook/detail?number=${recBook.recBookNumber}">${recBook.bookName }</a></td>
					
					<td>${recBook.writer }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
    </div>
  </div>
</div><br><br>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>