function visibleOnScroll() {
  $(document).ready(function() {
    $(window).scroll(function() {
      if($(this).scrollTop() > 60) {
        $('.navbar-fixed-top').addClass('solid');
      } else {
        $('.navbar-fixed-top').removeClass('solid');
      }
    });
  });
}

console.log("Hello from navbar.js");

export { visibleOnScroll };
