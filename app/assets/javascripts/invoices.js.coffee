selector = '#invoice_items [data-autocomplete-update-after]'

$(document).on 'autocomplete:update', selector, (event) ->
  price = event.item.price

  $(event.input).closest('fieldset').find('input[name$="[price]"]').val price
