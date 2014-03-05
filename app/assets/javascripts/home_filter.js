  $(function(){
    // This needs to be refactored. Need to put everything in OO.
    $('.filter_music, .filter_dance, .filter_acrobatic, .filter_other').on("ajax:success", function(e, data, status, xhr){
    $(".home_cards").html(data);
    });
});
