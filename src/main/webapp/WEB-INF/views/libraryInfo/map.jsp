<html>
<head>
	<meta charset="utf-8"/>
	<title>Daum 지도 시작하기</title>
</head>
<body>
<c:forEach var="libraryInfo" items="${list}">
	<div id="map" style="width:500px;height:400px;"></div>
	
	
	
	
	
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24895e7659c99a646c858cb49911f9e0"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng("${libraryInfo.latitude}", "${libraryInfo.longitude}"),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
	</c:forEach>
</body>
</html>
