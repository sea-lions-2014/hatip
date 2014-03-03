$(function(){
  Profile.bindEventListeners();
  Profile.generateCoinbaseButton();
});

var Profile = {
  bindEventListeners: function(){
    $('#new_post_button').click(Profile.displayModal);
    $("#new_post").on("ajax:success", Profile.notifyUserSuccess);
    $("#new_post").on("ajax:error", Profile.notifyUserFailure);
    Profile.bindTabListeners();
  },

  displayModal: function(){
    $('#postModal').modal('show');
  },

  generateCoinbaseButton: function() {
    var user_id = $('.tip-hat').data('id');
    $.get('/api/posts/' + user_id, function (data) {
      $('.tip-hat').html(data.payment_button);
    });
  },

  notifyUserSuccess: function() {
    $('#create-post-button').replaceWith('Post Created!');
  },

  notifyUserFailure: function(e, xhr, status, error) {
    var errorList = xhr.responseJSON.errors
    for(var i=0; i<errorList.length; i++) {
      $('.errors').html(errorList[i] + '<br>');
    }
  },

  bindTabListeners: function() {
    $('.artist_info').hide();

    $("#show-posts").on('click', function(){
      $('.artist_info').hide();
      $('.tv').show();
      $('#profile-columns').show();
    });

    $("#more-info").on('click', function(){
      $('.tv').hide();
      $('#profile-columns').hide();
      $('.artist_info').show();
    });
  }
}

