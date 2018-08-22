<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Resizable - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  #resizable { width: 150px; height: 150px; padding: 0.5em; }
  #resizable h3 { text-align: center; margin: 0; }
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#resizable" ).resizable();
  } );
  $( function() {
	    $( "#resizable1" ).resizable();
	  } );
  $( function() {
	    $( "#resizable2" ).resizable();
	  } );
  $( function() {
	    $( "#resizable3" ).resizable();
	  } );
  </script>
  <style>
  #div1 {
    padding-top: 10px;
    padding-right: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
    background-color:#DAD8D8;
    border:2px solid green;
}
  
  </style>
</head>
<body>
<form action="signup2" method="get">
<h1>동의합니다  </h1>
 	<div class="col-sm-3">
		 
	</div>
	
<div class="col-sm-6" id="div1">
	
	<div id="resizable1" class="ui-widget-content">
		  <h3 class="ui-widget-header">1조약</h3>
		<p>  여기서 생기는 피해에 대해 제작자 및 관리자는 책임이 없습니다.</p>
	</div>
	 <span style="float:right"><input type="checkbox" name="vehicle" value="agree"> 예 동의합니다</span><br>
	</br>
	<div id="resizable2" class="ui-widget-content">
	 	 <h3 class="ui-widget-header">2조약</h3>
	 	 <p>생각중</p>
	</div>
	<span style="float:right"> <input type="checkbox" name="vehicle" value="agree">  예 동의합니다</span><br>
	</br>
	<div id="resizable3" class="ui-widget-content">
	 	 <h3 class="ui-widget-header">3조약</h3>
	 	  <p>생각중</p>
	</div>
	<span style="float:right"> <input type="checkbox" name="vehicle" value="agree"> 예 동의합니다</span> <br>
	</br>
	
	<center><button type="submit" class="btn btn-primary">동의합니다</button>
    <button class="btn btn-primary" onClick="history.back();" >취소</button></center>
</div>
	
	<div class="col-sm-3">
	
	</div>
	
	
</form>
 
 
</body>
</html>