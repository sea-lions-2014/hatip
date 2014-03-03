$(function(){
  Profile.bindEventListeners();
  Profile.generateCoinbaseButton();
});

var Profile = {
  bindEventListeners: function(){
    $('#new_post_button').click(Profile.displayModal);
    // $("#new_post").on("ajax:success", Profile.appendPost);
  },

  displayModal: function(){
    $('#postModal').show();
  },

  generateCoinbaseButton: function() {
    var user_id = $('.tip-hat').data('id');
    $.get('/api/posts/' + user_id, function (data) {
      $('.tip-hat').html(data.payment_button);
    })
  }


}

