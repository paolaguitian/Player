var watchID;
var geoLocation;


function showLocation(position) { //position params comes from getLocationUpdate
  var latitude = position.coords.latitude; //gets latitude coord
  var longitude = position.coords.longitude; //gets longitude coord
  var output=document.getElementById("output");
  output.innerHTML= "Latitude : " + latitude + " Longitude: " + longitude;
}


function errorHandler(err) { //catch errors for location malfunction
  if(err.code === 1) {
    alert("Error: Access is denied!"); //user did not allow location access
  }else if( err.code === 2) {
    alert("Error: Position is unavailable!"); //user location could not be found
  }
}


function getLocationUpdate(){ //this method is called from Html file
  if(navigator.geolocation){// location coming from browser
    var options = {enableHighAccuracy:true,maximumAge:30000,timeout:27000};
    //options is assigned precise location (enableHighAccuracy:true),
    //location no older than 30 seconds(maximumAge:30000),
    //stop if its taking longer than 27 seconds to retrieve location
    geoLoc = navigator.geolocation;
    //this just saves the location coming in from browser into a var
    watchID = geoLoc.watchPosition(showLocation, errorHandler, options);
    //asks browser for position if succesful do showLocation(method above)
    //if it fails than run errorHandler(method above)
    //pass it the options var we created on line 24
  }else{  //if browser does not have navigator.geoloction ability
    alert("Sorry, browser does not support geolocation!");


  }
}
