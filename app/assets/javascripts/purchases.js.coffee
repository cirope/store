$(document).on 'update.autocomplete', '.purchase_commodity input[name$="[commodity]"]', (event) ->
  commodity = event.item || $(this).data('commodity')

  $(this).closest('.purchase_commodity').find('input[name$="[unit]"]').val commodity.unit
