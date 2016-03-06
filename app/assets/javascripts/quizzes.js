$(document).ready(function () {

  if ( $("#quiz_translate_to_default, #quiz_translate_from_default").length ) {

    $("#quiz_translate_to_default").change(function() {
      if (["fr", "en"].indexOf( $("#quiz_translate_to_default option:selected").val() ) > -1 ){
        $("#quiz_translate_from_default option[value='fr']").attr('disabled','disabled');
        $("#quiz_translate_from_default option[value='en']").attr('disabled','disabled');
        $("#quiz_translate_from_default option[value='kh']").removeAttr('disabled');
        $("#quiz_translate_from_default option[value='ph']").removeAttr('disabled');
      } else if (["kh", "ph"].indexOf( $("#quiz_translate_to_default option:selected").val() ) > -1 ) {
        $("#quiz_translate_from_default option[value='kh']").attr('disabled','disabled');
        $("#quiz_translate_from_default option[value='ph']").attr('disabled','disabled');
        $("#quiz_translate_from_default option[value='fr']").removeAttr('disabled');
        $("#quiz_translate_from_default option[value='en']").removeAttr('disabled');
      } else {
        $("#quiz_translate_from_default option[value='fr']").removeAttr('disabled');
        $("#quiz_translate_from_default option[value='en']").removeAttr('disabled');
        $("#quiz_translate_from_default option[value='kh']").removeAttr('disabled');
        $("#quiz_translate_from_default option[value='ph']").removeAttr('disabled');
      }
    });

    $("#quiz_translate_from_default").change(function() {
      if (["fr", "en"].indexOf( $("#quiz_translate_from_default option:selected").val() ) > -1 ){
        $("#quiz_translate_to_default option[value='fr']").attr('disabled','disabled');
        $("#quiz_translate_to_default option[value='en']").attr('disabled','disabled');
        $("#quiz_translate_to_default option[value='kh']").removeAttr('disabled');
        $("#quiz_translate_to_default option[value='ph']").removeAttr('disabled');
      } else if (["kh", "ph"].indexOf( $("#quiz_translate_from_default option:selected").val() ) > -1 ) {
        $("#quiz_translate_to_default option[value='kh']").attr('disabled','disabled');
        $("#quiz_translate_to_default option[value='ph']").attr('disabled','disabled');
        $("#quiz_translate_to_default option[value='fr']").removeAttr('disabled');
        $("#quiz_translate_to_default option[value='en']").removeAttr('disabled');
      } else {
        $("#quiz_translate_to_default option[value='fr']").removeAttr('disabled');
        $("#quiz_translate_to_default option[value='en']").removeAttr('disabled');
        $("#quiz_translate_to_default option[value='kh']").removeAttr('disabled');
        $("#quiz_translate_to_default option[value='ph']").removeAttr('disabled');
      }
    });
  }

});
