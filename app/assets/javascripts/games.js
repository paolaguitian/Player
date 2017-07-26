
//turbolinks aware page laod
$(document).on('turbolinks:load', function(){
    console.log('document ready', new Date());

  //on click bring up modal box , console log is for testing it works
  $("#game_location").keypress(function(event){  //watch every keypress,naming it event
      console.log(event.which)
        if(event.which == 13){  //when key press = 13(enter code) do this...
        event.preventDefault();  //dont do what you usually do
      }
    });

});
