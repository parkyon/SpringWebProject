<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>�α���</title>
	

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
   <style>
 #div1 {
    padding-top: 10px;
    padding-right: 10px;
    padding-bottom: 10px;
    padding-left: 10px;
    background-color:#DAD8D8;
    border:2px solid green;
}
   p{
	   font-size:14px
   }
   
.error{
	color:red
	
}
.cmxform {
    width: 500px;
}

	
   
   </style> 
   
   

	<script>
	

	$().ready(function() {

		

		// validate signup form on keyup and submit
		$("#commentForm2").validate({   //���� �����
			rules: {
			ID: {
					required: true,
					maxlength: 10
					
					
				},
				
				
			
			comment: "required"
			},
			messages: {
				ID: {
					required: "���̵� �Է����ּ���",
					maxlength: "���̵�� �ʰ�"
									
				},
			
					PW: {
					required: "��й�ȣ�� �Է����ּ���",
					minlength : "��й�ȣ�� ��ȿ���� �ʽ��ϴ�"
									
				}
					
				
			}
		});
	});
	</script>
	
</head>
<body>
<h1 style="color:#AAA57D;">���������� �ý���</h1>
	</br>
	</br>
	<form method="post">
	<div class="col-sm-3">
	</div>
	<div id="div1" class="col-sm-6">
		<strong><h1 style="color:green;">�α��� </h1></strong>
	<p>�α����� �Ͻø� ���� ���� ������ ���񽺸� �̿��Ͻ� �� �ֽ��ϴ�.</p>
	<hr>
    <div class="form-group">
      <label for="usr">�ƾƵ�:</label>
      <input type="text" value="���̵� �Է����ּ���" onclick="this.value='';" class="form-control" id="usr" name="id">
    </div>
    <div class="form-group">
      <label for="pwd">��й�ȣ:</label>
      <input type="password" value="��й�ȣ �Է����ּ���" onclick="this.value='';" class="form-control" id="pwd" name="pw">
    </div>
    <button type="submit" class="btn btn-primary">�α���</button>
   <input type='BUTTON' class="btn btn-primary" onClick="history.back();" value=" ���">
   
      </div>
       
       <div class="col-sm-3">
	</div>
  </form>
	
	<hr>

     <div class="col-sm-4">
	</div>
	
	   <div class="col-sm-4">
	 <center>  
	 </br>
	 </br>
			    <p>
			    ���� ������ �����ý��� ȸ���� �ƴϽŰ���?</p>
			   <a href="/signup">ȸ������</a>
		        
			    <p>ȸ������, ���̵�/��й�ȣ �н� �� ���� ���� : 010-9552-5344</p>
			    <p>��û�ϵ� û�ֽ� ������ ��â�� 148-7 4,5��</p>
	 </center>
	 </div>
	  
    <div class="col-sm-4">
	</div>
</body>
</html>