$(function(){

  alert('hello');
   // render map
  L.mapbox.accessToken = 'pk.eyJ1Ijoic2FoYXNoMTgyIiwiYSI6IjJhNGNjYzNiMTRmMGQ5MjkwYjcwMmEwY2IwYjkxMDk5In0.9d5E9GnR78TIUvQnjUrGxw';
  var map = L.mapbox.map('map', 'sahash182.n6o0oh90', {
            center: [0, 0],
            zoom: 2,
            minZoom: 2,
            maxBounds: [[-90, -180], [90, 180]]
  });

  




});