class Autocomplete
  constructor: (@input) ->
    @idInput = $ @input.data('autocompleteIdTarget')

    @_init()

  _init: ->
    @input.autocomplete
      source: (request, response) => @_source request, response
      type: 'get'
      minLength: @input.data('autocompleteMinLength')
      select: (event, ui) => @_selected event, ui

    @input.change => @idInput.val undefined unless @input.val().trim()

    @_rewriteRenderItem()
    @_markAsObserved()

  _markAsObserved: -> @input.attr 'data-observed', true

  _renderResponse: (item) ->
    content = $ '<div></div>'
    item.label ||= item.name

    content.append $('<span class="title"></span>').text item.label
    content.append $('<small></small>').text item.informal if item.informal

    label: content.html(), value: item.label, item: item

  _rewriteRenderItem: ->
    @input.data('ui-autocomplete')._renderItem = (ul, item) ->
      $('<li></li>').append($('<a></a>').html(item.label)).appendTo ul

  _selected: (event, ui) ->
    selected = ui.item

    @input.val selected.value
    @input.data 'item', selected.item
    @idInput.val selected.item.id

    @input.trigger type: 'update.autocomplete', input: @input, item: selected.item

    false

  _source: (request, response) ->
    jQuery.ajax
      url: @input.data('autocompleteUrl')
      dataType: 'json'
      data: { q: request.term }
      success: (data) =>
        response jQuery.map data, (item) => @_renderResponse item

jQuery ($) ->
  selector = 'input[data-autocomplete-url]:not([data-observed])'

  $(document).on 'focus', selector, -> new Autocomplete $(this)
