$(function(){
  $('#show-posts').on("ajax:success", function(e, data, status, xhr){
    $(".display-profile-tab").html(data);
  });

  $('#more-info').on("ajax:success", function(e, data, status, xhr){
    $(".display-profile-tab").html(data);
  });
});
