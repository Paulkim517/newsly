$(function(){

   // render map
  L.mapbox.accessToken = 'pk.eyJ1Ijoic2FoYXNoMTgyIiwiYSI6IjJhNGNjYzNiMTRmMGQ5MjkwYjcwMmEwY2IwYjkxMDk5In0.9d5E9GnR78TIUvQnjUrGxw';
  var map = L.mapbox.map('map', 'sahash182.n6o0oh90', {
            center: [34, -97],
            zoom: 2,
            minZoom: 2,
            maxBounds: [[-90, -180], [90, 180]]
  });

  //set variables
 var geocoder = L.mapbox.geocoder('mapbox.places-v1');
 
 // function to show markers on map
  var showMarker = function(lng, lat) {
    L.mapbox.featureLayer({
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [lng, lat]
      },
      properties: {
        description: + results.title,
        'marker-size': 'small',
        'marker-color': '#fc4607',
        'marker-symbol': 'star'
      }
    }).addTo(map);
  };


geocoder.query(results.geo_facet, function(err, result) {
        if (!err) {
          showMarker(result.latlng[1], result.latlng[0], result.title, results.abstract);
        }
      });
  




});