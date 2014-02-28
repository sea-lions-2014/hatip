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
      console.log(data);
      CardModal.data = data;
      CardModal.updateModalElements();
      CardModal.displayModal();
    });
  },

  updateModalElements: function(){
    $('#cardModalLabel').text(CardModal.data.first_name + ' ' + CardModal.data.last_name);
    $('#cardModalVideo').attr("src", "//www.youtube.com/embed/IYH7_GzP4Tg");
    $('#cardModalDescription').text(CardModal.data.story);
  },

  displayModal: function() {
    $('#cardModal').modal('show');
  }
}
