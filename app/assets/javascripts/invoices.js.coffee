selector = '#invoice_commodities [data-autocomplete-update-after]'

$(document).on 'update.autocomplete', selector, (event) ->
  commodity = event.item || $(this).data('commodity')

  $(this).closest('fieldset').find('input[name$="[price]"]').val commodity.price
