$(document).on 'update.autocomplete', '.invoice_commodity input[name$="[commodity]"]', (event) ->
  $(this).closest('.invoice_commodity').find('input[name$="[price]"]').val event.item.price
