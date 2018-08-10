<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link href="/resources/css/default.css" rel="stylesheet" type="text/css" />
  
  <script>
  $( function() {
    var icons = {
      header: "ui-icon-circle-arrow-e",
      activeHeader: "ui-icon-circle-arrow-s"
    };
    $( "#accordion" ).accordion({
      icons: icons
    });
    $( "#toggle" ).button().on( "click", function() {
      if ( $( "#accordion" ).accordion( "option", "icons" ) ) {
        $( "#accordion" ).accordion( "option", "icons", null );
      } else {
        $( "#accordion" ).accordion( "option", "icons", icons );
      }
    });
  } );
  </script>

  
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
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
    	 <c:if test="${isAuthor && !USER &&ADMIN && SUPERADMIN }" >
      	 <li><a href="/signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </c:if>
      </ul>
      <form class="navbar-form navbar-right" action="/action_page.php">
      <div class="form-group">
        
      </div>
    </form>
   
   
    </div>
  </div>
</nav>
  
  <div class="container">
  
  <div class="btn-group btn-group-justified">
  
  
    <a href="/siteInfo/siteInfo" class="btn btn-primary">사이트소개</a>
  
   <a href="/libraryInfo/libraryInfoMain" class="btn btn-primary">도서관 정보</a>
    <a href="/recBook/recBookMain" class="btn btn-primary">책 소개</a>
    <a href="/board/boardMain" class="btn btn-primary">게시판</a>
   
  </div>
   
  
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-3 sidenav">
     <div id="accordion">
  <h3>사이트소개</h3>
  <div>
    	<ul>
  	<li>	<a href="/siteInfo/siteInfo1" target="aaa">사이트 소개</a></li>
  	<li>	<a href="/siteInfo/makepeople" target ="aaa">개발자 소개</a></li>
  	<li>	<a href="/siteInfo/copyRight" target ="aaa">저작권 </a></li>
  	
  	</ul>
  </div>
  <h3>도서관정보</h3>
  <div>
  	<ul>
  	<li>	<a href="/siteInfo/libraryInfo" target ="aaa">도서관정보</a></li>
 
  	
  	</ul>
  </div>
  <h3>추천도서 </h3>
 <div>
  	<ul>
  		<div><a href="/siteInfo/recBookInfo" target ="aaa"> 추천도서</a></div>
  		<div><a href="/siteInfo/monthsRecBook" target ="aaa">이달의 추천도서</a></div>
  
  	
  	</ul>
  </div>
  <h3>자유 게시판</h3>
  <div>
  	<ul>
  	<li>	<a href="/siteInfo/boardInfo" target ="aaa">자유게시판</a></li>
  	<li>	<a href="/stieInfo/event" target ="aaa">이벤트</a></li>
  	
  	
  	</ul>
  </div>
</div>
    </div>
    <div id="aaa" class="col-sm-7 text-left"> 
      <object id="nzeo" width="100%" height="100%" data="/siteInfo/siteInfo1" name="aaa">
</object>
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
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
	<script src="/resources/endlessRiver.js"></script>
    <script>
$(document).ready(function(){
    $("#myUl").endlessRiver();
});
</script>
</body>
</html>
