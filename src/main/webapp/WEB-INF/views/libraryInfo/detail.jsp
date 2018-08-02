<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
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
  		<form >
  			<h1>${libraryInfo.libraryName}</h1>
		    
		    <div class="form-group">
		    	
		    	<c:if test="${!empty libraryInfo.latitude}">
		    	
		      	 <div id="map" style="width:500px;height:400px; border:1px solid blue;" ></div>
		      	 	
		      	 </c:if>
		      	 <c:if test="${empty libraryInfo.latitude}">
		    	
		      	 <div  style="width:500px;height:400px; border:1px solid blue;" ><img style='height: 100%; width: 100%; object-fit: contain' src="/resources/jpg/mapSorry.png" ></img></div>
		      	 <div  style="width:500px;height:100px;"><h1>지도 요청 중입니다</div>
		      	 	
		      	 </c:if>
		      	 
		    </div>
		    
		    <div class="form-group">
		    	<label>주소</label>
		      	<input type="text" class="form-control" name="author" value="${libraryInfo.loadAddress}" disabled>
		    </div> 
		  
		    <div class="form-group">
		    	<label>전화번호</label>
		      	<input type="text" class="form-control" name="author" value="${libraryInfo.phoneNumber}" disabled>
		    </div>
		   
		    <div class="form-group">
		    	<label>홈페이지주소</label>
		      	<a href="${libraryInfo.homepage}" target="_blank">	
		      	<input type="text" class="form-control" name="homepage" value="${libraryInfo.homepage}" disabled></a>
		      
		    </div>
		      <div class="form-group">
		    	<label>작성자</label>
		      	<input type="text" class="form-control" name="author" value="${libraryInfo.author}" disabled>
		    </div>
		   
	
	
	
		<div> <p>추천수 : <p>${libraryInfo.recomand} </div>
		<div> <p>비추천수 : <p>${libraryInfo.notrecomand} </div>
	
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24895e7659c99a646c858cb49911f9e0"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(${libraryInfo.latitude}, ${libraryInfo.longitude}),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(${libraryInfo.latitude}, ${libraryInfo.longitude}); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
		    
	  	</form>
	  	<div>
	  		<a href="/libraryInfo/rec?number=${libraryInfo.number }"><button class="btn btn-primary">추천</button></a>
	  		<a href="/libraryInfo/notrec?number=${libraryInfo.number }"><button class="btn btn-primary">비추천</button></a>
		    <a href="/libraryInfo/libraryList"><button class="btn btn-primary">목록</button></a>
		    <c:if test="${isAuthor || !USER }" >
		    	<a href="/libraryInfo/modify?number=${libraryInfo.number }"><button class="btn btn-primary">수정</button></a>
		    	<a href="/libraryInfo/delete?number=${libraryInfo.number }"><button class="btn btn-outline-danger">삭제</button></a>
		    </c:if>
	    </div>
	</div>
</body>
</html>