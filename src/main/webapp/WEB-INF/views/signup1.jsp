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
</head>
<body>
 <div class="col-sm-3">
 sdfsdfs
	</div>
	<div class="col-sm-6">
	<div id="resizable" class="ui-widget-content">
  <h3 class="ui-widget-header">Resizable</h3>
</div>
<div id="resizable1" class="ui-widget-content">
  <h3 class="ui-widget-header">Resizable</h3>
</div>
<div id="resizable2" class="ui-widget-content">
  <h3 class="ui-widget-header">Resizable</h3>
</div>
<div id="resizable3" class="ui-widget-content">
  <h3 class="ui-widget-header">Resizable</h3>
</div>
	</div>
	
	<div class="col-sm-3">
	sdfsdf
	</div>

 
 
</body>
</html>