$(function(){
  CardMaster.bindEventListeners();
  $('#stripeButton').click(StripeMaster.stripeLaunch)
});

// CardMaster is the controller to handle the card and card modal creation
var CardMaster = {

  bindEventListeners: function(){
    $('.post-card').click(CardMaster.launchModal);
    $('#cardModal').on('hidden.bs.modal', CardMaster.stopVideo);
  },

  launchModal: function(event){
    var card = CardMaster.buildCard(event);
    var modal = new CardModal(card, 'launch');
  },

  buildCard: function(event) {
    var postId = $(event.currentTarget).data('id');
    return new Card(postId);
  },

  stopVideo: function() {
    $('#cardVideo').attr('src', '');
  }
}

// Card constructor
function Card(postId) {
  this.postId = postId;
}

// Modal constructor (named card modal to not interfere with modal in bootstrap js)
function CardModal(card, callback) {
  this.dataCache = {
    postId: card.postId
  };
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
                modal.updateModalElements();
                modal[modal.callback]();
              }
  });
}

CardModal.prototype.updateModalElements = function() {
  $('#cardModalLabel').text(this.dataCache.title);
  $('#cardModalArtistName').text(this.dataCache.artist_name);
  $('#cardModalArtistName').attr("href", this.dataCache.artist_page_url);
  $('#cardVideo').attr("src", "http://www.youtube.com/embed/" + this.dataCache.youtube_id + "?controls=2&showinfo=0&rel=0");
  $('.tip-button').html(this.dataCache.payment_button);
  $('.video-description').text(this.dataCache.description);
  $('.fb-like-button').attr("src", this.dataCache.facebook_like_url);
  $('#stripeButton').attr("data-id", this.dataCache.artist_id)
}

var StripeMaster = {

  setHandler: function() {
    StripeMaster.handler = StripeCheckout.configure({
    key: 'pk_test_6pRNASCoBOKtIshFeQd4XMUh',
    // image: '/square-image.png',
    token: function(token, args) {
      $.post('/callback/stripe/' + user_id, { stripe_token: token, amount: StripeMaster.amount });
      // Use the token to create the charge with a server-side script.
      // You can access the token ID with `token.id`
    }
  });
  },

  stripeLaunch: function(e) {
    StripeMaster.setHandler();
    user_id = e.currentTarget.dataset.id;
    StripeMaster.handler.open({
      name: 'HatTip',
      description: 'Tip $1.00',
      amount: 100
    });
    e.preventDefault();
  }
}


