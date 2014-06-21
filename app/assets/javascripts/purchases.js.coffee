$(document).on 'update.autocomplete', '.purchase_commodity input[name$="[commodity]"]', (event) ->
  $(this).closest('.purchase_commodity').find('input[name$="[unit]"]').val event.item.unit
