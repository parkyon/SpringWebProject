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
      <a class="navbar-brand" ><script language="JavaScript1.2">

var message="도서관정보 시스템"
var neonbasecolor="gray"
var neontextcolor="yellow"
var flashspeed=100  //in milliseconds

///No need to edit below this line/////

var n=0
if (document.all||document.getElementById){
document.write('<font color="'+neonbasecolor+'">')
for (m=0;m<message.length;m++)
document.write('<span id="neonlight'+m+'">'+message.charAt(m)+'</span>')
document.write('</font>')
}
else
document.write(message)

function crossref(number){
var crossobj=document.all? eval("document.all.neonlight"+number) : document.getElementById("neonlight"+number)
return crossobj
}

function neon(){

//Change all letters to base color
if (n==0){
for (m=0;m<message.length;m++)
//eval("document.all.neonlight"+m).style.color=neonbasecolor
crossref(m).style.color=neonbasecolor
}

//cycle through and change individual letters to neon color
crossref(n).style.color=neontextcolor

if (n<message.length-1)
n++
else{
n=0
clearInterval(flashing)
setTimeout("beginneon()",1500)
return
}
}

function beginneon(){
if (document.all||document.getElementById)
flashing=setInterval("neon()",flashspeed)
}
beginneon()


</script></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/loginhome">Home</a></li>
       
      </ul>

      
         <ul class="nav navbar-nav navbar-right">
         	<c:if test="${admin}">
			  	<li><a href="/admin/board" class ="	glyphicon glyphicon-edit">관리자페이지</a></li>
			  	<span style="color:white"></span>
			</c:if>
        <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
        
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
  
  
    <a href="/siteInfo/siteInfo" class="btn btn-primary">사이트소개</a>
    
    <a href="/libraryInfo/libraryInfoMain" class="btn btn-primary">도서관 정보</a>
    <a href="/recBook/recBookMain" class="btn btn-primary">책 소개</a>
    <a href="/board/boardMain" class="btn btn-primary">게시판</a>
    
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
	     <li><a href="http://www.aladin.co.kr/home/welcome.aspx"><img src="/resources/jpg/foot_banner8.jpg"></img></a></li>
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

</body>
</html>