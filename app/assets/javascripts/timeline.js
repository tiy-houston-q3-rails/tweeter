jQuery(document).ready(function() {
  $(".search-and-submit form").on("submit", function(){
    var searchFor = $.trim($("#search").val());
    if (searchFor.length === 0){
      return false;
    } else {
      return true;
    }
  })
});


jQuery(document).ready(function() {
  jQuery("time.timeago").timeago();
});

$(document).ready(function() {
  var menu = $('#navigation-menu');
  var menuToggle = $('#js-mobile-menu');
  var signUp = $('.sign-up');

  $(menuToggle).on('click', function(e) {
    e.preventDefault();
    menu.slideToggle(function(){
      if(menu.is(':hidden')) {
        menu.removeAttr('style');
      }
    });
  });

  // underline under the active nav item
  $(".nav .nav-link").click(function() {
    $(".nav .nav-link").each(function() {
      $(this).removeClass("active-nav-item");
    });
    $(this).addClass("active-nav-item");
    $(".nav .more").removeClass("active-nav-item");
  });
});
