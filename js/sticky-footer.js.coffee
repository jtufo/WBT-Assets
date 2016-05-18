$(document).ready ->
  footer = $("footer")
  $("#footer_space").height footer.outerHeight()
  # Placement of background image, above sticky footer
  $(".inner-wrap").css "background-position", "left 50% bottom #{footer.height()}px"
