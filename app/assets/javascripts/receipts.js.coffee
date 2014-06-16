$(document).on 'update.autocomplete', '.receipt_commodity input[name$="[commodity]"]', (event) ->
  commodity = event.item || $(this).data('commodity')

  $(this).closest('.receipt_commodity').find('input[name$="[price]"]').val commodity.price

$(document).on 'update.autocomplete', '.use input[name$="[item]"]', (event) ->
  item = event.item

  $(this).closest('.use').find('input[name$="[unit]"]').val item.unit
