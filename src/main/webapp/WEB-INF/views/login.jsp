<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>jQuery ��ȿ���˻�</title>
	

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
   <style>
 
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
	<center><h1 id="banner">�α��� </h1></center>

	<form method="post">
    <div class="form-group">
      <label for="usr">Id:</label>
      <input type="text" class="form-control" id="usr" name="id">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pw">
    </div>
    <button type="submit" class="btn btn-primary">�α���</button>
   <input type='BUTTON' class="btn-primary" onClick="history.back();" value=" ���">
    
  </form>
 
</center>

            
              
            
		    <p>
			  <center>  
			    <p>
			   
			       <a href="/signup">ȸ������</a>
		        </p>
			    <p>ȸ������, ���̵�/��й�ȣ �н� �� ���� ���� : 010-9552-5344</p>
			    <p>��û�ϵ� û�ֽ� ������ ��â�� 148-7 4,5��</p>
	          </center>
				</p>

	    </fieldset>
	  </form>
      </center>
</div>
</body>
</html>