$(document).on 'click', '[data-toggle]', (e) ->
  $("[data-toggle-id=\"#{$(this).data('toggle')}\"]").toggleClass('hidden')

  e.preventDefault()
