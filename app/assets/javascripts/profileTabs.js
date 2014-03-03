$(function(){

  $('.artist_info').hide()

  $("#show-posts").on('click', function(){
    $('.artist_info').hide()
    $('.tv').show();
    $('#profile-columns').show();
  })

  $("#more-info").on('click', function(){
    $('.tv').hide();
    $('#profile-columns').hide();
    $('.artist_info').show()

  })


});
