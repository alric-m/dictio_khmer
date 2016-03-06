//= require datatables

$(document).ready(function () {

  if ( $('#datatable').length ) {
    $('#datatable').dataTable({
      'paging':   false,  // Table pagination
      'ordering': true,   // Column ordering
      'info':     false,  // Bottom left status text
      // Text translation options
      // Note the required keywords between underscores (e.g _MENU_)
      oLanguage: {
        oPaginate: {
          sNext:         'Suivant',
          sPrevious:     'Précédent'
        },
        sSearch:      'Recherche:',
        sLengthMenu:   '_MENU_ entrées par page',
        info:          'Page _PAGE_ sur _PAGES_',
        sInfo:         'Affichage de _START_ à _END_ sur _TOTAL_ entrées',
        zeroRecords:   'Aucune entrée disponible',
        szeroRecords:   'Aucune entrée disponible',
        infoEmpty:     'Aucune donnée trouvé',
        sInfoEmpty:    'Aucune donnée trouvé',
        infoFiltered:  '(filtré sur _MAX_ entrées)',
        sInfoFiltered: '(filtré sur _MAX_ entrées)',
        sZeroRecords:  'Aucune entrée disponible'
      }
    });
  }

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
