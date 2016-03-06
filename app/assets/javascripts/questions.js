$(document).ready(function () {

  var timer = $("form").data("timer");
  if ( timer ) {
      setTimeout(function(){
          $("form.edit-question").submit();
      }, timer * 1000);
  }

  var current_timer = timer
  var progress_status_interval = setInterval(function() {

      var current_timer_percent = current_timer * 100 / timer;
      current_timer = current_timer - 0.2;
      $(".timer-progressbar").css("width", current_timer_percent.toString() + '%');
      if (current_timer_percent <= 50 && $(".progress-bar-success").length) {
        $(".timer-progressbar").removeClass("progress-bar-success");
        $(".timer-progressbar").addClass("progress-bar-warning");
      } else if (current_timer_percent <= 20 && $(".progress-bar-warning").length) {
        $(".timer-progressbar").removeClass("progress-bar-warning");
        $(".timer-progressbar").addClass("progress-bar-danger");
      } else if (current_timer_percent <= 0) {
        clearInterval(progress_status_interval);
      }

  }, 500);

});
