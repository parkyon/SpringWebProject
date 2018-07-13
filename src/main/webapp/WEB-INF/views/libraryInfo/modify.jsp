<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<style> 
		.form-control:disabled, .form-control[readonly]{
			background: #ffffff;
		}
	</style>
	<div class="container">
  		<form method="post" enctype="multipart/form-data">
  			<h1>도서관정보 수정</h1>
		    <div class="form-group">
		    	<label>도서관 이름</label>
		      	<input type="text" class="form-control" name="libraryName" value="${libraryInfo.libraryName}" >
		    </div>
		    <div class="form-group">
		    	<label>도시 이름</label>
		      	<input type="text" class="form-control" name="cityName" value="${libraryInfo.cityName}" >
		    </div>
		    <div class="form-group">
		    	<label>도서관 유형</label>
		      	<input type="text" class="form-control" name="libraryType" value="${libraryInfo.libraryType}" >
		    </div>
		    <div class="form-group">
		    	<label>휴일</label>
		      	<input type="text" class="form-control" name="holiday" value="${libraryInfo.holiday}" >
		    </div>
		    <div class="form-group">
		    	<label>좌석 수</label>
		      	<input type="text" class="form-control" name="openSeat" value="${libraryInfo.openSeat}" >
		    </div>
		    <div class="form-group">
		    	<label>자료수(도서)</label>
		      	<input type="text" class="form-control" name="bookCount" value="${libraryInfo.bookCount}" >
		    </div>
		    <div class="form-group">
		    	<label>자료수(연속간행)</label>
		      	<input type="text" class="form-control" name="bookCount2" value="${libraryInfo.bookCount2}" >
		    </div>
		    <div class="form-group">
		    	<label>자료수(비도서)</label>
		      	<input type="text" class="form-control" name="bookCount3" value="${libraryInfo.bookCount3}" >
		    </div>
		    <div class="form-group">
		    	<label>도로명주소</label>
		      	<input type="text" class="form-control" name="loadAddress" value="${libraryInfo.loadAddress}" >
		    </div>
		    <div class="form-group">
		    	<label>운영기관</label>
		      	<input type="text" class="form-control" name="operation" value="${libraryInfo.operation}" >
		    </div>
		    <div class="form-group">
		    	<label>전화번호</label>
		      	<input type="text" class="form-control" name="phoneNumber" value="${libraryInfo.phoneNumber}" >
		    </div>
		    <div class="form-group">
		    	<label>홈페이지 주소</label>
		      	<input type="text" class="form-control" name="homepage" value="${libraryInfo.homepage}" >
		    </div>
		   
		    <div>
		    
		   
		    
		    </div>
		    
		    <div>
			    <button type="submit" class="btn btn-primary">수정</button>
			    <a href="/libraryInfo/libraryList"><button type="button" class="btn btn-primary">취소</button></a>
		    </div>
	  	</form>
	  	
	</div>
</body>
</html>