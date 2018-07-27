<html>
<head>
    <meta charset="utf-8">
    <title>Sample Maps App</title>
    <style>
        html, body, #map-canvas {
            height: 100%;
            margin: 0px;
            padding: 0px
        }
    </style>

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3&sensor=true"></script>

    <script type="text/javascript" >
        function initialize() {
            var map;
            var panorama;
            var currPointer =  new google.maps.LatLng("${libraryInfo.latitude}", "${libraryInfo.longitude}");

            // Set up the map
            var mapOptions = {
                center: currPointer,
                zoom: 18,
                streetViewControl: false
            };

            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

            // We get the map's default panorama and set up some defaults.
            panorama = map.getStreetView();
            panorama.setPosition(currPointer);
            panorama.setPov(/** @type {google.maps.StreetViewPov} */({
                heading: 265,
                pitch: 0
            }));

            panorama.setVisible(true);
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</head>
<body>
    <div id="map-canvas"></div>
</body>
</html>