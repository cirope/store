$(document).on 'update.autocomplete', '.receipt_commodity input[name$="[commodity]"]', (event) ->
  $(this).closest('.receipt_commodity').find('input[name$="[price]"]').val event.item.price

$(document).on 'update.autocomplete', '.use input[name$="[item]"]', (event) ->
  $(this).closest('.use').find('input[name$="[unit]"]').val event.item.unit

$(document).on 'update.autocomplete', '#receipt_customer', (event) ->
  $('#ask_for_feedback').attr('disabled', !event.item.email)
  $('[data-distance-time-to-last-receipt]').html(event.item.distance_time_to_last_receipt)
