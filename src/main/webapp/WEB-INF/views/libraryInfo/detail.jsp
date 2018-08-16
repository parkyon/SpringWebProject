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
<script src="/resources/tabcontent.js" type="text/javascript"></script>
    <link href="/resources/css/tabcontent.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

	<script type="text/javascript" class="init">

	$.extend( true, $.fn.dataTable.defaults,
			{
				"language": {
					"url": "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Korean.json"
				}
			});

	$(document).ready(function() {

		var table = $('#example').DataTable();
		
		
	} );

	</script>


</head>
<body>
	<style> 
		.form-control:disabled, .form-control[readonly]{
			background: #ffffff;
		}
	</style>
	
<div class="container-fluid text-center">    
  <div class="row content">

    <div class="col-sm-10 text-left"> 
      <h1>${libraryInfo.libraryName}</h1>
        <hr>
        
        
        
       <div class="row">
        <div class="col-sm-6">
 		
 		

			<div class="form-group">
		    	
		    	<c:if test="${!empty libraryInfo.latitude}">
		    	
		      	 <div id="map" style="width:300px;height:400px; border:1px solid blue;" ></div>
		      	 	
		      	 </c:if>
		      	 <c:if test="${empty libraryInfo.latitude}">
		    	
		      	 <div  style="width:300px;height:400px; border:1px solid blue;" ><img style='height: 100%; width: 100%; object-fit: contain' src="/resources/jpg/mapSorry.png" ></img></div>
		      	 <div  style="width:300px;height:400px;"><h1>지도 요청 중입니다</div>
		      	 	
		      	 </c:if>
		      	 
		    </div>


 	
        
          


          
         
        </div>
        <div class="col-sm-6">
        
        	주소:${libraryInfo.loadAddress} </br>
         	전화번호:${libraryInfo.phoneNumber}</br>
			홈페이지:<a href="${libraryInfo.homepage}" target="_blank">${libraryInfo.homepage}</a></br>
			위도:${libraryInfo.latitude}</br>
			경도:${libraryInfo.longitude}</br>
       		<hr>
       		보유도서
       		도서:${libraryInfo.bookCount}</br>
       		비도서:${libraryInfo.bookCount3 }</br>
       		연속간행물:${libraryInfo.bookCount2}</br>
       		<hr>
       		네티즌 </br>
       		추천수 :${libraryInfo.recomand} </br>
			비추천수 : ${libraryInfo.notrecomand}
       		
       		 <hr>
			 작성자: ${libraryInfo.author}
       		
       		
         	
        </div>
 
		</div>
		
		<div>
		<span style="float:right">
		<a href="/libraryInfo/rec?number=${libraryInfo.number }"><button class="btn btn-primary">추천</button></a>
	  		<a href="/libraryInfo/notrec?number=${libraryInfo.number }"><button class="btn btn-primary">비추천</button></a>
		    <a href="/libraryInfo/libraryList"><button class="btn btn-primary">목록</button></a>
		      <c:if test="${admin }" >
		    	<a href="/libraryInfo/modify?number=${libraryInfo.number }"><button class="btn btn-primary">수정</button></a>
		    	<a href="/libraryInfo/delete?number=${libraryInfo.number }"><button class="btn btn-outline-danger">삭제</button></a>
		    </c:if>
		    
      </span>
 
      </br>
	 </div>

	  	<div>
        <ul class="tabs" data-persist="true">
           
            <li><a href="#view2">한줄평 (${totalCount})</a></li>
            <li><a href="#view3">첨부파일</a></li>
        </ul>
       
            <div id="view2">
               <div class="container">
		  		<form method="post" 
		  			enctype="multipart/form-data">
		  		<input type="hidden" value="${libraryInfo.number}" name="number">
  		<input type="hidden" value="${libraryInfo.author}" name="author">
				    <div class="form-group">
				    	
				    	<span><input  type="text" name="content" value="" >
				      	<button type="submit" class="btn btn-primary">등록</button></span>
				    </div>
				</form>
				</div>
				
				<h1>댓글</h1>
					<table class="table table-bordered">
					<thead>
						<tr>
							<th>번호</th>
							<th>내용</th>
							<th>글쓴이</th>
							<th>작성날짜</th>
							<c:if test="${isAuthor }">
							<th>수정/삭제
							</th>
							</c:if>
						
						</tr>
					</thead>
					<tbody>
						<c:forEach var="libraryInfoComment" items="${list }" varStatus="status">
							<tr>
							
						
								<td>${status.count}</td>
								<td>${libraryInfoComment.content}</td>
								<td>${libraryInfoComment.writer}</td>
								<td>${libraryInfoComment.reg_date}</td>
								<c:if test="${isAuthor }"><td>
							
								<span><a href="#"><p onclick="onModals(${libraryInfoComment.cno},'${libraryInfoComment.content}')">수정</a>/<a href="deleteComment?cno=${libraryInfoComment.cno}">삭제</a></span></p>
					

								  <div id="id01" class="w3-modal id01">
								    <div class="w3-modal-content">
								      <header class="w3-container w3-teal"> 
								        <span onclick="$('.id01').css('display','none')" 
								        class="w3-button w3-display-topright">&times;</span>
								        <h2>수정</h2>
								      </header>
								    	<div class="w3-container">
									     <form method="post" class="form-test" action="modifyComment?cno=${libraryInfoComment.cno}"   >
									     
									        <input  type="text" class="form-control content1" name="content1" value="" >
						      				<button type="submit" class="btn btn-primary">수정</button>
										</form>
										</div>
									</div>
								</div>
								
								 	
								 		
								
									
								  
								</td>
								</c:if>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
            </div>
            
            <div id="view3">
	            <div class="form-group">
			    	<label>첨부파일</label>
			      	<div class="form-control" name="file" id="file" >
			      		<c:if test="${fileName != null }">
			      			<a href="/libraryInfo/download?fileName=${libraryInfo.filepath}"
			      			>${fileName}</a>
			      		</c:if>
			      		<c:if test="${fileName == null }">
			      			첨부파일 없음
			      		</c:if>
			      	</div>
			    </div>
            
               
            </div>
        </div>
    </div>
	</div>
	
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
	
	<script>
	//$(document).ready(function(){
	function onModals(num, content){
		$('.id01').css('display','block');
		$('.content1').val(content);
		$('.form-test').prop('action', 'modifyComment?cno='+num);
	}
	
//});
</script>	
</body>
</html>