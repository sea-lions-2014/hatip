$(function(){
  $('.post-card').click(CardModal.init);
  $('#cardModal').on('hidden.bs.modal', CardModal.stopVideo)
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
    $('.coinbase-button').attr("data-custom", CardModal.postId + '-' + CardModal.data.artist_name)
    $('.video-description').text(CardModal.data.description);
  },

  displayModal: function() {
    $('#cardModal').modal('show');
  },

  stopVideo: function() {
    $('#cardVideo').attr('src', '');
 }
}
