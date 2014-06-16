$(document).on 'update.autocomplete', '.invoice_commodity input[name$="[commodity]"]', (event) ->
  commodity = event.item || $(this).data('commodity')

  $(this).closest('.invoice_commodity').find('input[name$="[price]"]').val commodity.price
