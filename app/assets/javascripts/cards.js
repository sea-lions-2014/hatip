$(function(){
  $('.artist-card').click(CardModal.init);
});

var CardModal = {
  init: function(event) {
    this.artistId = $(event.target).data('id');
    var data = this.getModalData();
  },

  getModalData: function(){
    $.get('/api/artists/' + this.artistId, this.displayModal);
  }
  displayModal: function(data) {
    debugger
  }
}
