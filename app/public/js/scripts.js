/* This changes the nav from transparent to opaque and vice versa when scrolling down or up */
var nav = $(".navbar");
$(window).scroll(function () {
  if ($(this).scrollTop() > 275) {
  nav.css("background-color", "#292322");
  } else {
  nav.css("background-color", "rgba(41, 35, 35, 0.2)");
  }
});
