$(function(){
  $('.artist-card').click(callCardModal);
});

function callCardModal(event){
  CardModal.init(event.currentTarget);
}

var CardModal = {
  init: function(card) {
    this.artistId = $(card).data('id');
    var data = CardModal.getModalData();
  },

  getModalData: function(){
    $.get('/api/users/' + this.artistId, this.displayModal);
  },

  displayModal: function(data) {
    $('#cardModalLabel').text(data.first_name + ' ' + data.last_name);
    $('#cardModalVideo').attr("src", "//www.youtube.com/embed/IYH7_GzP4Tg");
    $('#cardModalDescription').text(data.story);
    $('#cardModal').modal('show');
  }
}
