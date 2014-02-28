$(function(){
  $('.artist-card').click(CardModal.init);
});

var CardModal = {
  init: function(event) {
    var card = event.currentTarget;
    CardModal.artistId = $(card).data('id');
    CardModal.getModalData();
  },

  getModalData: function(){
    $.get('/api/users/' + this.artistId, this.displayModal);
  },

  displayModal: function(data) {
    debugger
    $('#cardModalLabel').text(data.first_name + ' ' + data.last_name);
    $('#cardModalVideo').attr("src", "//www.youtube.com/embed/IYH7_GzP4Tg");
    $('#cardModalDescription').text(data.story);
    $('#cardModal').modal('show');
  }
}
