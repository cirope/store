$(document).on 'change', '#warehouse_id', ->
  $('#warehouse-label').text $(this).find('option:selected').text()
