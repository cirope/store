selector = '#invoice_items [data-autocomplete-update-after]'

$(document).on 'update.autocomplete', selector, (event) ->
  price = event.item.price

  $(event.element).closest('fieldset').find('input[name$="[price]"]').val price
