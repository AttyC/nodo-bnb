/* This changes the nav from transparent to opaque and vice versa when scrolling down or up */
var nav = $("nav");
$(window).scroll(function () {
  if ($(this).scrollTop() > 275) {
  nav.css("background-color", "#21868e;");
  } else {
  nav.css("background-color", "rgba(33, 134, 142, 0.2)");
  }
});
