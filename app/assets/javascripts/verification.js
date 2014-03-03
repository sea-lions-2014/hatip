$(function(){
  $('.create-verification').on("ajax:success", function(e, data, status, xhr){
    $(this).text(data.verified)
  })
  $('.revoke-verification').on("ajax:success", function(e, data, status, xhr){
    debugger
    $(this).text(data.verified)
  })
});


