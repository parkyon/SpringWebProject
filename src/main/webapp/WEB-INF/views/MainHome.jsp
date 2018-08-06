<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
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
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <h4>John's Blog</h4>
      
      <div class="input-group">
         <div> 
		     <object id="nzeo" width="100%" height="100%" data="/recBook/download?fileName=${recBook.filepath}" name="aaa">
			</object>
     
   		 </div>
    </div>

    <div class="col-sm-9">
    
     <div class="form-group">
		    	<label>책 유형</label>
		      	<input type="text" class="form-control" name="bookType" value="${recBook.bookType}" disabled>
		    </div>
		    <div class="form-group">
		    	<label>책 사진</label>
		      	<div class="form-control" name="file" id="file" >
		      		<c:if test="${fileName != null }">
		      			<a href="/recBook/download?fileName=${recBook.filepath}"
		      			 target="aaa">${fileName}</a>
		      		</c:if>
		      		<c:if test="${fileName == null }">
		      			사진 없음
		      		</c:if>
		      	</div>
		    </div>
		    
		    <div class="form-group">
		    	<label>책 스토리</label>
		      	<input type="text" class="form-control" name="bookStory" value="${recBook.bookStory}" disabled>
		    </div>
		    <div class="form-group">
		    	<label>작가</label>
		      	<input type="text" class="form-control" name="writer" value="${recBook.writer}" disabled>
		    </div>
		    <div class="form-group">
		    	<label>작성자</label>
		      	<input type="text" class="form-control" name="author" value="${recBook.author}" disabled>
		    </div>
    </div>
  </div>
</div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>
