$(document).on 'change, keyup', '[data-chargeable-changer]', ->
  total = 0.0

  $('[data-chargeable-row]').each ->
    price      = +$(this).find('[data-chargeable-price]').val()      || 0
    multiplier = +$(this).find('[data-chargeable-multiplier]').val() || 0

    total += price * multiplier

  $('[data-chargeable-total]').text total.toFixed(2)
