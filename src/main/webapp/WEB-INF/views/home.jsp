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
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

	
	<script src="/resources/endlessRiver.js"></script>
	


< <script language="JavaScript">


window.open('/aaa','sponsor','width=400, height=400');
    
//

</script> -->

    <script>
$(document).ready(function(){
    $("#myUl").endlessRiver();
});
</script>





<!-- 달력  스크립트-->
<script type="text/javascript">
function setStyle(id,style,value)
{
    id.style[style] = value;
}
function opacity(el,opacity)
{
        setStyle(el,"filter:","alpha(opacity="+opacity+")");
        setStyle(el,"-moz-opacity",opacity/100);
        setStyle(el,"-khtml-opacity",opacity/100);
        setStyle(el,"opacity",opacity/100);
}
function calendar()
{
        var date = new Date();
        var day = date.getDate();
        var month = date.getMonth();
        var year = date.getYear();
        if(year<=200)
        {
                year += 1900;
        }
        months = new Array('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12');
        days_in_month = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
        if(year%4 == 0 && year!=1900)
        {
                days_in_month[1]=29;
        }
        total = days_in_month[month];
        var date_today = year+'년'+months[month]+'월 '+day+'일';
        beg_j = date;
        beg_j.setDate(1);
        if(beg_j.getDate()==2)
        {
                beg_j=setDate(0);
        }
        beg_j = beg_j.getDay();
        document.write('<table class="cal_calendar" onload="opacity(document.getElementById(\'cal_body\'),20);"><tbody id="cal_body"><tr><th colspan="7">'+date_today+'</th></tr>');
        document.write('<tr class="cal_d_weeks"><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr><tr>');
        week = 0;
        for(i=1;i<=beg_j;i++)
        {
                document.write('<td class="cal_days_bef_aft">'+(days_in_month[month-1]-beg_j+i)+'</td>');
                week++;
        }
        for(i=1;i<=total;i++)
        {
                if(week==0)
                {
                        document.write('<tr>');
                }
                if(day==i)
                {
                        document.write('<td class="cal_today">'+i+'</td>');
                }
                else
                {
                        document.write('<td>'+i+'</td>');
                }
                week++;
                if(week==7)
                {
                        document.write('</tr>');
                        week=0;
                }
        }
        for(i=1;week!=0;i++)
        {
                document.write('<td class="cal_days_bef_aft">'+i+'</td>');
                week++;
                if(week==7)
                {
                        document.write('</tr>');
                        week=0;
                }
        }
        document.write('</tbody></table>');
        opacity(document.getElementById('cal_body'),70);
        return true;
}
</script>

<style>
table.cal_calendar{padding:0px;margin:0 auto;}
table.cal_calendar th{border:1px solid #c0c0c0;background-color:#e0e0e0;width:36px;font-family:돋움;font-size:11px;padding:3px;}
table.cal_calendar td{border:1px solid #e0e0e0;background-color:#ffffff;text-align:center;width:20px;height:25px;font-family:tahoma;font-size:11px;padding:3px;}
.cal_today{color:#ff0000;font-weight:bold;}
.cal_days_bef_aft{color:#5a779e;}
</style>
<!-- 달력 끝 -->

    
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
      <a class="navbar-brand" >
<script language="JavaScript1.2">

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


</script>
</a>
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
      
    </form>
     
      
    </div>
  </div>
</nav>
  


<div class="container">
  
  <div class="btn-group btn-group-justified">
    <a href="/siteInfo/notloginSiteHome" class="btn btn-primary">사이트소개</a>
    
    <a href="/login" class="btn btn-primary">도서관정보</a>
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

<div class="container">    
  <div class="row">
    <div class="col-sm-3">
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
    </div>
    <div class="col-sm-6"> 
      <div class="panel panel-danger">
        <video width="100%" height="100%" autoplay>
  <source src="/resources/video/video1.mp4" type="video/mp4">
  
  Your browser does not support the video tag.
</video>
      </div>
    </div>
    <div class="col-sm-3"> 
      <div class="panel panel-success">
      <script type="text/javascript">
		calendar();
</script>
      </div>
    </div>
  </div>
</div><br>



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

</body>
</html>