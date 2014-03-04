  function log(msg) {
      jQuery('#log').prepend(msg + '<br/>');
  }

  function onPlayerStateChange(event) {
      // switch(event.data) {
      //         case YT.PlayerState.ENDED:
      //             log('Video has ended.');
      //             break;
      //         case YT.PlayerState.PLAYING:
      //             log('Video is playing.');
      //             break;
      //         case YT.PlayerState.PAUSED:
      //             log('Video is paused.');
      //             break;
      //         case YT.PlayerState.BUFFERING:
      //             log('Video is buffering.');
      //             break;
      //         case YT.PlayerState.CUED:
      //             log('Video is cued.');
      //             break;
      //         default:
      //             log('Unrecognized state.');
      //             break;
      //     }

      if(event.data ===  YT.PlayerState.ENDED) {
          location.reload();
          // log('Video has ended.');
      }
  }

  jQuery(document).ready(function($) {
      $('.video-thumb').click(function() {
          new YT.Player('explore_js', {
              events: {
                  'onStateChange': onPlayerStateChange
              }
          });
      });
  });
