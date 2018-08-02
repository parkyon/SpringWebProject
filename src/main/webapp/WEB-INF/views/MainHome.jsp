<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta charset="utf-8">
<title>Simplest jQuery Dropdown Nav Demo</title>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/resources/css/default.css" rel="stylesheet" type="text/css" />

<style>
#div2{whdth:100vh;
	}
</style>

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

<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500);

/* main Styles */

html { box-sizing: border-box; }

*, *:before, *:after { box-sizing: inherit; }

body {
  background: #fafafa;
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  margin: 0;
}

a { text-decoration: none; }

.container {
  width: 1000px;
  margin: auto;
}

h1 { text-align:center; margin-top:150px;}

/* Navigation Styles */

nav { background: #2ba0db; }

nav ul {
  font-size: 0;
  margin: 0;
  padding: 0;
}

nav ul li {
  display: inline-block;
  position: relative;
}

nav ul li a {
  color: #fff;
  display: block;
  font-size: 14px;
  padding: 15px 14px;
  transition: 0.3s linear;
}

nav ul li:hover { background: #126d9b; }

nav ul li ul {
  border-bottom: 5px solid #2ba0db;
  display: none;
  position: absolute;
  width: 250px;
}

nav ul li ul li {
  border-top: 1px solid #444;
  display: block;
}

nav ul li ul li:first-child { border-top: none; }

nav ul li ul li a {
  background: #373737;
  display: block;
  padding: 10px 14px;
}

nav ul li ul li a:hover { background: #126d9b; }

nav .fa.fa-angle-down { margin-left: 6px; }
</style>
</head>

<body>
<div style="position: relative; z-index: 2;">
<nav>
  <div class="container">
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">About Us</a></li>
      <li> <a href="#">Categories<i class='fa fa-angle-down'></i></a>
        <ul>
          <li><a href="#">Category One</a></li>
          <li><a href="#">Category Two</a></li>
          <li><a href="#">Category Three</a></li>
        </ul>
      </li>
      <li class='sub-menu'> <a href="#">Services<i class='fa fa-angle-down'></i></a>
        <ul>
          <li><a href="#">Service One</a></li>
          <li><a href="#">Service Two</a></li>
          <li><a href="#">Service Three</a></li>
          <li><a href="#">Service Four</a></li>
          <li><a href="#">Service Five</a></li>
          <li><a href="#">Service Six</a></li>
        </ul>
      </li>
      <li><a href="#">Contact Us</a></li>
    </ul>
  </div>
</nav>
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
                <img src="/resources/jpg/library1.jpg" alt="First slide" style="width:100%" data-src="">
                <div class="container">
                    <div class="carousel-caption">
                  </div>
              </div>
          </div>
            <!--슬라이드1-->
    
            <!--슬라이드2-->
            <div class="item"> 
                <img src="/resources/jpg/library2.jpg" style="width:100%" data-src="" alt="Second slide">
                <div class="container">
                    <div class="carousel-caption">
                    
                    </div>
                </div>
            </div>
            <!--슬라이드2-->
            
            <!--슬라이드3-->
            <div class="item"> 
                <img src="/resources/jpg/library3.jpg" style="width:100%" data-src="" alt="Third slide">
                <div class="container">
                    <div class="carousel-caption">
                    
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
  <div class="row">
    <div class="col-sm-3">
     
     <h1>${user.id}님</br>  환영합니다</h1>
    </div>
    <div class="col-sm-3" > 
    <h4>도서정보 최신글</h4>
     <div id="div2">
      <object id="nzeo" width="100%" height="100%" data="/libraryInfo/recentlyLibraryInfo" name="aaa">
</object>
    </div>
    </div>
    <div class="col-sm-3"> 
    <h4>자유게시판 최신글</h4> 
      
      
       
      <div id="div2">
      <object id="nzeo" width="100%" height="100%" data="/board/recentlyBoard" name="bbb">
</object>
    </div>
      
    </div>
    <div class="col-sm-3">
    <h4>추천 도서 최신글</h4>
    
     <div id="div2">
      <object id="nzeo" width="100%" height="100%" data="/recBook/recentlyRecBookList" name="ccc">
</object>
    </div>
		
		
    </div>
  </div>
</div><br><br>

<footer class="container-fluid text-center">
	  <p>Online Store Copyright</p>  
	
	
	<div class="container"">
	<ul id="myUl">
	    <li><a href="https://cheongju.greenart.co.kr/"><img src="/resources/jpg/greenComputer.jpg"></img></a></li>
	     <li><a href="http://www.nl.go.kr/nl/"><img src="/resources/jpg/foot_banner2.jpg"></img></a></li>
	     <li><a href="http://www.nl.go.kr/nill/user/index.jsp"><img src="/resources/jpg/foot_banner4.jpg"></img></a></li>
	   <li><a href="https://www.nanet.go.kr/main.do"><img src="/resources/jpg/foot_banner5.jpg"></img></a></li>
	     <li><a href="https://www.nlcy.go.kr/index.do"><img src="/resources/jpg/foot_banner6.jpg"></img></a></li>
	     <li><a href="http://nld.nl.go.kr/ableFront/index.jsp"><img src="/resources/jpg/foot_banner7.jpg"></img></a></li>
	</ul>
	</div>
	
	</footer>
	<script src="/resources/endlessRiver.js"></script>
	 <script>
$(document).ready(function(){
    $("#myUl").endlessRiver();
});
</script>



<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
<script>
$('nav li').hover(
  function() {
	  $('ul', this).stop().slideDown(200);
  },
	function() {
    $('ul', this).stop().slideUp(200);
  }
);
</script>


</body>
</html>
