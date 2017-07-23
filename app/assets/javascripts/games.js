
//turbolinks aware page laod
$(document).on('turbolinks: load', function(){
    console.log('document ready', new Date());

  //on click bring up modal box , console log is for testing it works
  $('.modal-footer .btn-primary').click(function(){
    console.log('click');
    console.log($('.modal-body form'));
    $('.modal-body form').submit();

  });
});
