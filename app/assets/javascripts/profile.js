$(function(){
  Profile.bindEventListeners();
});

var Profile = {
  bindEventListeners: function(){
    $('#new_post_button').click(Profile.showForm);
    $("#new_post").on("ajax:success", Profile.appendPost);
  },

  showForm: function(){
    $('#new_post').show();
  },

  appendPost: function(e, data, status, xhr){
    $('.posts-container').append(data);
  }
}

