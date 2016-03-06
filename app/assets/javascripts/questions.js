$(document).ready(function () {

  var timer = $("form").data("timer");
  if ( timer ) {
    setTimeout(function(){
      $("form.edit-question").submit();
    }, timer * 1000);
  }

});
