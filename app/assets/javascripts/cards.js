$(function(){
  $('.post-card').click(CardModal.init);
  $('#cardModal').on('hidden.bs.modal', CardModal.stopVideo);
  $('.coinbase-button2').click(function(){
    $(document).trigger('coinbase_show_modal', CardModal.data.payment_button_code);
    return false;
  });
});

var CardModal = {
  data: {},

  init: function(event) {
    var card = event.currentTarget;
    CardModal.postId = $(card).data('id');
    CardModal.getModalData();
  },

  getModalData: function(){
    $.get('/api/posts/' + CardModal.postId, function(data){
      console.log(data);
      CardModal.data = data;
      console.log(data);
      CardModal.updateModalElements();
      CardModal.displayModal();
    });
  },

  updateModalElements: function(){
    $('#cardModalLabel').text(CardModal.data.title);
    $('#cardModalArtistName').text(CardModal.data.artist_name);
    $('#cardModalArtistName').attr("href", CardModal.data.artist_page_url);
    $('#cardVideo').attr("src", "http://www.youtube.com/embed/" + CardModal.data.youtube_id);
    $('.tip-button').html(CardModal.data.payment_button)
    $('.video-description').text(CardModal.data.description);
  },

  displayModal: function() {
    $('#cardModal').modal('show');
  },

  stopVideo: function() {
    $('#cardVideo').attr('src', '');
 }
}
