//= require datatables
//= require jquery.tokeninput

$(document).ready(function () {

  if ( $('#datatable').length ) {
    $('#datatable').dataTable({
      'paging':   true,  // Table pagination
      'ordering': true,  // Column ordering
      'info':     true,  // Bottom left status text
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

  $('#word_tag_list').tokenInput( '/words/tags.json', {
    theme: 'custom',
    minChars: 2,
    allowCustomEntry: true,
    allowFreeTagging: true,
    preventDuplicates: true,
    prePopulate: $('#word_tag_list').data('load')
  });

});
