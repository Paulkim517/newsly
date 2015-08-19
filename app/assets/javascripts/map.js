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
  


  var showMarker = function(i, lng, lat) {


    L.mapbox.featureLayer({
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [lng, lat]
      },

      properties: {

        description:  data.results[i].title,
        'marker-size': 'small',
        'marker-color': '#fc4607',
        'marker-symbol': 'star'
      }
    }).addTo(map);
  };

    console.log(data)
      console.log(data.results[i].geo_facet[0])
      
      $.get("/results.json",function(data){

      for (var i = 0; i < data.results.length; i++) {



      var location = data.results[i].geo_facet[0]
      if(location !== undefined){
        geocoder.query(data.results[i].geo_facet[0], function(err, geo) {
          if (!err) {
            showMarker(i, geo.latlng[1], geo.latlng[0]);
          }
        });
      }            
    };
  });
});  


