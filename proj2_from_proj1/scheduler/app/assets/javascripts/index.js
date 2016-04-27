$(document).ready(function() {
    // your code here: parallax function
    function parallax() {
      //keep track of where you are on the page
      var scrolled = $(window).scrollTop();
      $('.parallax').css("top", -(scrolled * 0.6) + "px");

      console.log(scrolled);
    }

    $(window).scroll(function() {
        // your code here
        parallax();
    })
})
