$(document).ready(function() {
  $("div.attendance-report div.well").hide();
  $("div.attendance-report .btn-warning").each(function() {
    $(this).click(function() {
      $(this).next().next().toggle();
    });
  });
});
