// You can do this yourself and namespace in a module.
jQuery( document ).ready( function( $ ) {
    $('body').addClass('js');
      var $menu = $('#menu'),
          $menulink = $('.menu-link'),
          $menuTrigger = $('.has-submenu > a');

    $menulink.click(function(e) {
      $menulink.toggleClass('active');
      $menu.toggleClass('active');
    });

    $menuTrigger.click(function(e) {
      var $this = $(this);
      $this.toggleClass('active').next('ul').toggleClass('active');
    });

});
