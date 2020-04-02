<!doctype html>
<html>
<head>
    <%-- definiu o layout padrão que é o layout/main --%>
    <meta name="layout" content="main"/> 
    <title>Welcome to index</title>


    <%-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>

    <link href='https://api.mapbox.com/mapbox.js/v3.2.1/mapbox.css' rel='stylesheet' />
    <script src='https://api.mapbox.com/mapbox.js/v3.2.1/mapbox.js'></script>

    <%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div id="content" role="main">
        <section class="container colset-2-its">
            <h1>Welcome to Grails</h1>
  
            <button type="button" class="btn btn-primary m-4" id="btnModal" data-toggle="modal" data-target="#exampleModal">
                Launch demo modal
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <%-- <div id="map" style="width:470px;height:347px;"></div> --%>
                        <div id="map" style="height:306px;"></div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                    </div>
                </div>
            </div>
            <!-- / Modal -->
        </section>
    </div>

    <script>
// (TUTORIAL) https://docs.mapbox.com/help/tutorials/analysis-with-turf-mapbox-js/#getting-started

        L.mapbox.accessToken = 'pk.eyJ1Ijoiam9uYXRoYW5jY2FyZG9zbyIsImEiOiJjazhocXc1MGIwM3E5M21wNGwyaDN1MTVuIn0.-_l4VwBEoryNKlLzi1d5nQ';

// datas
        // store GeoJSON objects in these variables
        var hospitals = {
            "type": "FeatureCollection",
            "features": [
                { "type": "Feature", "properties": { "Name": "VA Medical Center -- Leestown Division", "Address": "2250 Leestown Rd" }, "geometry": { "type": "Point", "coordinates": [ -84.539487, 38.072916 ] } },
                { "type": "Feature", "properties": { "Name": "St. Joseph East", "Address": "150 N Eagle Creek Dr" }, "geometry": { "type": "Point", "coordinates": [ -84.440434, 37.998757 ] } },
                { "type": "Feature", "properties": { "Name": "Central Baptist Hospital", "Address": "1740 Nicholasville Rd" }, "geometry": { "type": "Point", "coordinates": [ -84.512283, 38.018918 ] } },
                { "type": "Feature", "properties": { "Name": "VA Medical Center -- Cooper Dr Division", "Address": "1101 Veterans Dr" }, "geometry": { "type": "Point", "coordinates": [ -84.506483, 38.02972 ] } },
                { "type": "Feature", "properties": { "Name": "Shriners Hospital for Children", "Address": "1900 Richmond Rd" }, "geometry": { "type": "Point", "coordinates": [ -84.472941, 38.022564 ] } },
                { "type": "Feature", "properties": { "Name": "Eastern State Hospital", "Address": "627 W Fourth St" }, "geometry": { "type": "Point", "coordinates": [ -84.498816, 38.060791 ] } },
                { "type": "Feature", "properties": { "Name": "Cardinal Hill Rehabilitation Hospital", "Address": "2050 Versailles Rd" }, "geometry": { "type": "Point", "coordinates": [ -84.54212, 38.046568 ] } },
                { "type": "Feature", "properties": { "Name": "St. Joseph Hospital", "ADDRESS": "1 St Joseph Dr" }, "geometry": { "type": "Point", "coordinates": [ -84.523636, 38.032475 ] } },
                { "type": "Feature", "properties": { "Name": "UK Healthcare Good Samaritan Hospital", "Address": "310 S Limestone" }, "geometry": { "type": "Point", "coordinates": [ -84.501222, 38.042123 ] } },
                { "type": "Feature", "properties": { "Name": "UK Medical Center", "Address": "800 Rose St" }, "geometry": { "type": "Point", "coordinates": [ -84.508205, 38.031254 ] }
                }
            ]
        };
        var libraries = {
            "type": "FeatureCollection",
            "features": [
                { "type": "Feature", "properties": { "Name": "Village Branch", "Address": "2185 Versailles Rd" }, "geometry": { "type": "Point", "coordinates": [ -84.548369, 38.047876 ] } },
                { "type": "Feature", "properties": { "Name": "Northside Branch", "ADDRESS": "1733 Russell Cave Rd" }, "geometry": { "type": "Point", "coordinates": [ -84.47135, 38.079734 ] } },
                { "type": "Feature", "properties": { "Name": "Central Library", "ADDRESS": "140 E Main St" }, "geometry": { "type": "Point", "coordinates": [ -84.496894, 38.045459 ] } },
                { "type": "Feature", "properties": { "Name": "Beaumont Branch", "Address": "3080 Fieldstone Way" }, "geometry": { "type": "Point", "coordinates": [ -84.557948, 38.012502 ] } },
                { "type": "Feature", "properties": { "Name": "Tates Creek Branch", "Address": "3628 Walden Dr" }, "geometry": { "type": "Point", "coordinates": [ -84.498679, 37.979598 ] } },
                { "type": "Feature", "properties": { "Name": "Eagle Creek Branch", "Address": "101 N Eagle Creek Dr" }, "geometry": { "type": "Point", "coordinates": [ -84.442219, 37.999437 ] } }
            ]
        };

        // Add marker color, symbol, and size to hospital GeoJSON
        for (var i = 0; i < hospitals.features.length; i++) {
            hospitals.features[i].properties['marker-color'] = '#DC143C';
            hospitals.features[i].properties['marker-symbol'] = 'hospital';
            hospitals.features[i].properties['marker-size'] = 'small';
        }

        // Add marker color, symbol, and size to library GeoJSON
        for (var j = 0; j < libraries.features.length; j++) {
            libraries.features[j].properties['marker-color'] = '#4169E1';
            libraries.features[j].properties['marker-symbol'] = 'library';
            libraries.features[j].properties['marker-size'] = 'small';
        }

// initial map

        // var map = L.map('map').setView([48.86, 2.35], 11);

        // L.marker([48.86, 2.35]).addTo(map);

        // L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        //     attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        // }).addTo(map);

        // // // Comment out the below code to see the difference.
        // $('#exampleModal').on('shown.bs.modal', function() {
        //     map.invalidateSize();
        // });

        var map = L.mapbox.map('map')
            // .setView([38.05, -84.5], 12)
            .setView([38.05, -80.5], 10) // test
            .addLayer(L.mapbox.styleLayer('mapbox://styles/mapbox/dark-v10'));
        map.scrollWheelZoom.disable();

        // $("#btnModal").click(function(){
        //     // alert("IAE!");
        //     // map.invalidateSize();
        //     map.invalidateSize();
        // });

        var hospitalLayer = L.mapbox.featureLayer(hospitals)
            .addTo(map);
        var libraryLayer = L.mapbox.featureLayer(libraries)
            .addTo(map);

        // When map loads, zoom to libraryLayer features
        map.fitBounds(libraryLayer.getBounds());

// hospitals
        // Bind a popup to each feature in hospitalLayer and libraryLayer
        hospitalLayer.eachLayer(function(layer) {
            layer.bindPopup('<strong>' + layer.feature.properties.Name + '</strong>', { closeButton: false });
        }).addTo(map);
        libraryLayer.eachLayer(function(layer) {
            layer.bindPopup(layer.feature.properties.Name, { closeButton: false });
        }).addTo(map);

        // Open popups on hover
        libraryLayer.on('mouseover', function(e) {
            e.layer.openPopup();
        });
        hospitalLayer.on('mouseover', function(e) {
            e.layer.openPopup();
        });

// Turf is a JavaScript library for adding spatial and statistical analysis to your web maps.
        libraryLayer.on('click', function(e) {
            // Get the GeoJSON from libraryFeatures and hospitalFeatures
            var libraryFeatures = libraryLayer.getGeoJSON();
            var hospitalFeatures = hospitalLayer.getGeoJSON();

            // Using Turf, find the nearest hospital to library clicked
            var nearestHospital = turf.nearest(e.layer.feature, hospitalFeatures);

            // Change the nearest hospital to a large marker
            nearestHospital.properties['marker-size'] = 'large';

            // Add the new GeoJSON to hospitalLayer
            hospitalLayer.setGeoJSON(hospitalFeatures);
        });
    </script>


    <script>
        $(document).ready(function(){

            $("#btnModal").click(function(){
                // map.invalidateSize();
                // alert("iasdsa");

                window.setTimeout(function() {
                    alert("iasdsa");
                    map.invalidateSize();
                }, 1000);
            });

            // shown and show
            // $('#exampleModal').on('show.bs.modal', function() {
            //     alert("EII");
            //     // alert("Modal Open");
            //     // map.invalidateSize();
            // });
            
            // $("#btnModal").click(function(){
            //     alert("IAE!");
            //     map.invalidateSize();
            // });

            // $('#exampleModal').on('shown.bs.modal', function() {
            //     while($('#map').length == 0) {
            //         sleep(1000);
            //     }
            //     var map = new L.Map('map');
            // })

            // document.getElementById("exampleModal").addEventListener("click", myFunction);

            // function myFunction() {
            //     // document.getElementById("demo").innerHTML = "YOU CLICKED ME!";
            //     alert("ei");
            //     // map.invalidateSize();
            // }
        });
    </script>

</body>
</html>
