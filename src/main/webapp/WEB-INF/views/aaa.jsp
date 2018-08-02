<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>팝업창</title>
<style>
	html,body{
	  font-family:sans-serif;
	  background-color:#f15941;
	}
	#output{
	  /* The command I know best. */
	  text-transform:uppercase;
	  color:#fdf6f0;
	  font-size:50px;
	  font-weight:bold;
	  text-align:left;
	  text-shadow:0.08em 0em #940f08;
	}

	</style>

</head>
<body>



<div id="output"></div>
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>

$(document).ready(function(){
var theLetters = "가나다라마바사아자차카타파하#%&^+=-"; //랜덤 타이핑 글자
var ctnt = "도서관 정보 시스템에 오신걸 환영합니다.."; //여기에 텍스트 입력
var speed = 50; // ms per frame
var increment = 8; // frames per step. Must be >2

    
var clen = ctnt.length;       
var si = 0;
var stri = 0;
var block = "";
var fixed = "";
//Call self x times, whole function wrapped in setTimeout
(function rustle (i) {          
setTimeout(function () {
  if (--i){rustle(i);}
  nextFrame(i);
  si = si + 1;        
}, speed);
})(clen*increment+1); 
function nextFrame(pos){
  for (var i=0; i<clen-stri; i++) {
    //Random number
    var num = Math.floor(theLetters.length * Math.random());
    //Get random letter
    var letter = theLetters.charAt(num);
    block = block + letter;
  }
  if (si == (increment-1)){
    stri++;
  }
  if (si == increment){
  // Add a letter; 
  // every speed*10 ms
  fixed = fixed +  ctnt.charAt(stri - 1);
  si = 0;
  }
  $("#output").html(fixed + block);
  block = "";
}
});
</script>

</body>
</html>