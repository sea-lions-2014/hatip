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
    $('#postModal').on('hidden.bs.modal', Profile.resetModal);
  },

  displayModal: function(){
    $('#postModal').modal('show');
  },

  generateCoinbaseButton: function() {
    var userId = $('.tip-hat').data('id');
    $.get('/api/users/' + userId, function (data) {
      $('.tip-hat').html(data.payment_button);
    });
  },

  notifyUserSuccess: function() {
    $('#create-post-button').attr('value', 'Post Created!');
    $('#create-post-button').attr('disabled', true);
    $('#new_post').find("input[type=text], textarea").val("");
  },

  notifyUserFailure: function(e, xhr, status, error) {
    var errorList = xhr.responseJSON.errors
    for(var i=0; i<errorList.length; i++) {
      $('.errors').html(errorList[i] + '<br>');
    }
  },

  resetModal: function() {
    $('#create-post-button').attr('value', 'Create Post');
    $('#create-post-button').attr('disabled', false);
    $('.errors').html('');
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

