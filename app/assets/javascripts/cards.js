$(function(){
  $('.post-card').click(CardModal.init);
});

var CardModal = {
  data: {},

  init: function(event) {
    var card = event.currentTarget;
    CardModal.postId = $(card).data('id');
    CardModal.getModalData();
  },

  getModalData: function(){
    console.log(CardModal.artistId);
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
    $('#cardModalVideo').attr("src", CardModal.data.youtube_embed_url);
    $('#cardModalDescription').text(CardModal.data.description);
  },

  displayModal: function() {
    $('#cardModal').modal('show');
  }
}
