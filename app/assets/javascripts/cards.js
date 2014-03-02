$(function(){
  CardMaster.bindEventListeners();
});

// CardMaster is the controller to handle the card and card modal creation
var CardMaster = {
  bindEventListeners: function(){
    $('.post-card').click(CardMaster.launchModal);
    $('#cardModal').on('hidden.bs.modal', CardModal.stopVideo);
  },

  launchModal: function(event){
    var card = CardMaster.buildCard(event);
    var modal = new CardModal(card, 'launch');
  },

  buildCard: function(event) {
    var postId = $(event.currentTarget).data('id');
    return new Card(postId);
  }
}

// Card constructor
function Card(postId) {
  this.postId = postId;
}

// Modal constructor (named card modal to not interfere with modal in bootstrap js)
function CardModal(card, callback) {
  this.dataCache = {};
  this.dataCache.postId = card.postId;
  this.callback = callback;
  this.getDataFromServer();
}

CardModal.prototype.launch = function(){
  $('#cardModal').modal('show');
}

CardModal.prototype.getDataFromServer = function() {
  var modal = this;
  $.ajax({
    url:      '/api/posts/' + modal.dataCache.postId,
    success:  function(data) {
                $.extend(modal.dataCache, data);
                // console.log(modal.dataCache);
                modal.updateModalElements();
                modal[modal.callback]();
              }
  });
}

CardModal.prototype.updateModalElements = function() {
  $('#cardModalLabel').text(this.dataCache.title);
  $('#cardModalArtistName').text(this.dataCache.artist_name);
  $('#cardModalArtistName').attr("href", this.dataCache.artist_page_url);
  $('#cardVideo').attr("src", "http://www.youtube.com/embed/" + this.dataCache.youtube_id);
  $('.tip-button').html(this.dataCache.payment_button);
  $('.video-description').text(this.dataCache.description);
  $('.fb-like-button').attr("src", this.dataCache.facebook_like_url);
}
