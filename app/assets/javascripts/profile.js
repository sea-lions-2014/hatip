$(function(){
  Profile.bindEventListeners();
});

var Profile = {
  bindEventListeners: function(){
    $('#new_post_button').click(Profile.displayModal);
    $("#new_post").on("ajax:success", Profile.appendPost);
  },

  displayModal: function(){
    // Profile.updateModalElements();
    $('#postModal').show();
  },

  appendPost: function(e, data, status, xhr){
    $('.posts-container').append(data);
  },
}

