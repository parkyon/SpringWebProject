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
      <a class="navbar-brand" >도서관정보시스템</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/">Home</a></li>
        
        </li>
        </ul>

       
       <ul class="nav navbar-nav navbar-right">
        <li><a href="/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
      <form class="navbar-form navbar-right" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
    </form>
     
      
    </div>
  </div>
</nav>
  

</div>
<div class="container">
  
  <div class="btn-group btn-group-justified">
    <a href="siteInfo" class="btn btn-primary">사이트소개</a>
    
    <a href="/libraryInfo/libraryList" class="btn btn-primary">도서관정보</a>
    <a href="/login" class="btn btn-primary">추천도서</a>
    <a href="/login" class="btn btn-primary">자유게시판</a>
    
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

<div class="container-fluid">

<div>
<h1>&nbsp;</h1>
</div>
<div class="row">
<div class="col-sm-3">
<div id="support">
<h2>도서관 정보 시스템</h2>
<h3>1-800-1234567(로고 추가)</h3>
</div>
<div id="login" class="boxed">
<h2 class="title">Client Account</h2>
<div class="content">
<form id="form1" method="post" action="#">
<fieldset> <legend>Sign-In</legend> 
<label for="usr">Id:</label>
      <input type="text" class="form-control" id="usr" name="id">
<label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pw">
      <span style="float:right">
 <button  type="submit" class="btn btn-primary">로그인</button>


</fieldset>
</form>

</div>
</div>



<div>
후원사이트 움직이는 거 사용하는 쪽
</div>

</div>

<div id="footer">
  sdfjdslkfjsdklfjsdlkfjdklsfjskldf
</div>
<div style="font-size: 0.8em; text-align: center; margin-top: 1em; margin-bottom: 1em;">
Design downloaded from <a href="http://www.freewebtemplates.com/">Free
Templates</a> - your source for free web templates<br />
Supported by <a href="http://www.hosting24.com/" target="_blank">Hosting24.com</a>
</div>


</body>
</html>

