$(function(){

  $(window).scroll(function(){
     if($(window).scrollTop()<20){
           $('.fader').stop(true,true).fadeIn("slow");
     } else {
           $('.fader').stop(true,true).fadeOut("slow");
     }
  });

   // render map
  L.mapbox.accessToken = 'pk.eyJ1Ijoic2FoYXNoMTgyIiwiYSI6IjJhNGNjYzNiMTRmMGQ5MjkwYjcwMmEwY2IwYjkxMDk5In0.9d5E9GnR78TIUvQnjUrGxw';
  var map = L.mapbox.map('map', 'sahash182.n7e72gef', {
            center: [34, -97],
            zoom: 3,
            minZoom: 2,
            zoomControl: false,
            maxBounds: [[-90, -180], [90, 180]]
  });
   // map.dragging.disable();
        map.touchZoom.disable();
        map.doubleClickZoom.disable();
        map.scrollWheelZoom.disable();
  // Disable tap handler, if present.
  if (map.tap) map.tap.disable();
  
  //set variables
  var geocoder = L.mapbox.geocoder('mapbox.places-v1');
  // function to show markers on map
  var showMarker = function(lng, lat, title) {
    L.mapbox.featureLayer({
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [lng, lat]
      },
      properties: {
        description: title,
        'marker-size': 'small',
        'marker-color': '#fc4607',
        'marker-symbol': 'circle-stroked'
      }
    }).addTo(map);
  };

  $.get("/results.json",function(data){
    data.forEach(function(article){
      var location = article.geo_facet[0]
      var title = article.title

      if(location !== undefined && title !== undefined){
        geocoder.query(article.geo_facet[0], function(err, geo) {          
          if (!err) {
            showMarker(geo.latlng[1], geo.latlng[0], title);
          }
        });
      }
    });
  });
});  
