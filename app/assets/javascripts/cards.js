$(function(){
  $('.artist-card').click(CardModal.init);
});

var CardModal = {
  data: {},

  init: function(event) {
    var card = event.currentTarget;
    CardModal.artistId = $(card).data('id');
    CardModal.getModalData();
  },

  getModalData: function(){
    console.log(CardModal.artistId);
    $.get('/api/users/' + CardModal.artistId, function(data){
      CardModal.data = data;
      CardModal.updateModalElements();
      CardModal.displayModal();
    });
  },

  updateModalElements: function(){
    $('#cardModalLabel').text(CardModal.data.name);
    $('#cardModalVideo').attr("src", CardModal.data.highlight_youtube_url);
    $('#cardModalDescription').text(CardModal.data.story);
  },

  displayModal: function() {
    $('#cardModal').modal('show');
  }
}
