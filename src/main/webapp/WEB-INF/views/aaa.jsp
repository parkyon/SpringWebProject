<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ÆË¾÷Ã¢</title>
<style type="text/css">
body {
   background:#f4f4f4;
   text-align:center;
}
form {font-size:12px}
</style>
<script type="text/javascript">
function setCookie(name, value, expiredays) { 
  var todayDate = new Date(); 
  todayDate.setDate(todayDate.getDate() + expiredays); 
  document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
} 
function closeWin() { 
  if (document.forms[0].notice.checked) 
   setCookie("notice", "done", 1); 
  self.close(); 
} 
</script>
</head>
<body>

<div>
ÆË¾÷Ã¢ÀÔ´Ï´Ù ´ÝÀ»·Á¸é ¾Æ·¡

</div>

</br>
</br>
</br>
</br>
</br>

<form>
<input type="checkbox" name="notice" value="">¿À´Ã ÇÏ·çµ¿¾È ÀÌÃ¢À» ¿­Áö ¾Ê½À´Ï´Ù
<input type="button" value="´Ý±â" onclick="closeWin()">
</form>
</body>
</html>