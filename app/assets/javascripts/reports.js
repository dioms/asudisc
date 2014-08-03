$(document).ready(function() {
  $("div.well").hide();
  $(".btn-warning").each(function() {
    $(this).click(function() {
      $(this).next().next().toggle();
    });
  });
});
