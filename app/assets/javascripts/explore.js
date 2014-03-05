
function onPlayerStateChange(event) {
  if(event.data ===  YT.PlayerState.ENDED) {
    location.reload();
  }
}

$(function() {

  var refreshVideo = function() {
    new YT.Player('explore_js', {
      events: {
        'onStateChange': onPlayerStateChange
      }
    });
  }
  $(window).load(refreshVideo);
});
