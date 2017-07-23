//init map being called in partial through api call back. Loads map with current
//locaiton and desired markers
function initMap() {
  var map, infoWindow;
  map = new google.maps.Map(document.getElementById('map'), {
    //  center: {lat: -34.397, lng: 150.644},
    zoom: 15
  });

  infoWindow = new google.maps.InfoWindow;
  var locations = JSON.parse($('#games_lat_and_lng').val())
    var i;
      for(loc of locations){
        if( loc.lat !== null && loc.lng !== null ){

          var myLatLng = {lat: loc.lat, lng: loc.lng};
          var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: 'Hello World!'
          })

          google.maps.event.addListener(marker, 'click', (function(marker, i){
            return function() {
              if( locations[i] !== undefined && locations[i].description !== undefined) {
                infoWindow.setContent(locations[i].description)
              } else {
                  infoWindow.setContent("no description")
              }
              infoWindow.open(map, marker)
            }
          })(marker, i));

        }
      }

  // Try HTML5 geolocation
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found.');
      infoWindow.open(map);
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
  infoWindow.open(map);
}



//being called from js appliaction load, loads and runs when it finds JQuery
//targeted element
function initAutocomplete() {
  var autocomplete;
 // Create the autocomplete object, restricting the search to geographical
 // location types.
 autocomplete = new google.maps.places.Autocomplete(
     (document.getElementById('game_location')),
     {types: ['geocode']});

 // When the user selects an address from the dropdown, populate the address
 // fields in the form.
//  autocomplete.addListener('place_changed', fillInAddress);
}
