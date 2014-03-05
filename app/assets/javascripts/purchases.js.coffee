selector = '#purchase_items [data-autocomplete-update-after]'

$(document).on 'update.autocomplete', selector, (event) ->
  line = $(event.element).closest 'fieldset'

  line.find('input[name$="[unit]"]').val event.item.unit
