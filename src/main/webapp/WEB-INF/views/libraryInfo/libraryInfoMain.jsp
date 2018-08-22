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


<style rel="stylesheet">
#container {
  height: 300px;
  overflow: hidden;
  position: fixed;
  box-shadow: 1px 5px 15px #CCC;
  border-radius: 2px;
  left: 50%;
  top: 50%;
  margin: -150px 0 0 -270px;
}
#container .slide {
  position: absolute;
  display: block;
  left: 0;
  width: 300px;
  height: 100%;
  -webkit-transition: all .4s ease;
  transition: all .4s ease;
  cursor: pointer;
}
#container .slide.slide1 {
  background-color: #92DCE5;
}
#container .slide.slide2 {
  background-color: #EF6F6C;
}
#container .slide.slide3 {
  background-color: #FF386D;
}
#container .slide.slide4 {
  background-color: #E8DB7D;
}
#container .slide span {
  color: white;
  text-align: center;
  display: block;
  position: absolute;
  width: 40px;
  height: 40px;
  line-height: 44px;
  border-radius: 50%;
  top: 50%;
  margin-top: -20px;
  font-size: 20px;
  border: 2px solid rgba(255, 255, 255, 0.5);
  -webkit-transition: all .4s ease;
  transition: all .4s ease;
  

  }
    #div1{margin:5px; padding:10px;}
    #div2{whdth:100vh;
    height: 100vh;}

</style>

     
    
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
         <ul class="nav navbar-nav navbar-right">
         <c:if test="${admin}">
			  	<li><a href="/admin/recBookLog" class ="	glyphicon glyphicon-edit">로그보기</a></li>
			  	<span style="color:white"></span>
			</c:if>
        <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
		<li><a href="/modify" class ="	glyphicon glyphicon-edit">회원정보수정</a></li>
				  	<span style="color:white">  </span>
      
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
    <a href="/recBook/recBookMain" class="btn btn-primary">추천도서</a>
    <a href="/board/boardMain" class="btn btn-primary">자유게시판</a>
    
  </div>
   



<div class="container-fluid text-center" id="div1" >    
  <div class="row content">
    <div class="col-sm-2 sidenav">
     <div><h2> 메뉴</h2></div> 
    <ul>
    <li><p><a href="/libraryInfo/libraryList" target="aaa">도서관 정보</a></p><hr></hr></li> 
    </ul>
 
     
    
   
    </div>
    <div class="col-sm-10 text-left" id="div2"> 
      <object id="nzeo" width="100%" height="100%" data="/libraryInfo/libraryList" name="aaa">
</object>
    </div>
    
  </div>
</div>

<footer class="container-fluid text-center">
	  
	
	
	<div class="container"">
	<ul id="myUl">
	    <li><a href="https://cheongju.greenart.co.kr/"><img src="/resources/jpg/greenComputer.jpg"></img></a></li>
	    <li><a href="http://www.aladin.co.kr/home/welcome.aspx"><img src="/resources/jpg/foot_banner8.jpg"></img></a></li>
	     <li><a href="http://www.nl.go.kr/nl/"><img src="/resources/jpg/foot_banner2.jpg"></img></a></li>
	     <li><a href="http://www.nl.go.kr/nill/user/index.jsp"><img src="/resources/jpg/foot_banner4.jpg"></img></a></li>
	   <li><a href="https://www.nanet.go.kr/main.do"><img src="/resources/jpg/foot_banner5.jpg"></img></a></li>
	     <li><a href="https://www.nlcy.go.kr/index.do"><img src="/resources/jpg/foot_banner6.jpg"></img></a></li>
	     <li><a href="http://nld.nl.go.kr/ableFront/index.jsp"><img src="/resources/jpg/foot_banner7.jpg"></img></a></li>
		<li><a href="http://book.interpark.com/bookPark/html/book.html"><img src="/resources/jpg/foot_banner1.jpg"></img></a></li>
		
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