jQuery ($) ->
  Data =
    container:    -> $ '[data-graph-container]'
    rawContainer: -> @container().get 0
    width:        -> @container().outerWidth()
    values:       -> $('[data-value-column]').map -> +$(this).text()
    labels:       -> $('[data-label-column]').map -> "%%.%% #{$(this).text()}"
    present:      -> @values().filter(-> +this).length

  Graph =
    drawPie: -> @_pie().hover @_hoverIn, @_hoverOut
    _pie: ->
      @_chart().piechart Data.width() / 3.5, 100, 75, Data.values(), @_options()
    _chart: -> Raphael Data.rawContainer(), Data.width(), 200
    _options: ->
      legend: Data.labels(), legendpos: 'east', stroke: '#eee', strokewidth: 2
    _hoverIn: ->
      @sector.stop()
      @sector.scale 1.1, 1.1, @cx, @cy

      if @label
        @label[0].stop()
        @label[0].attr r: 7.5
        @label[1].attr 'font-weight': 800
    _hoverOut: ->
      @sector.animate transform: "s1 1 #{@cx} #{@cy}", 500, 'bounce'

      if @label
        @label[0].animate r: 5, 500, 'bounce'
        @label[1].attr 'font-weight': 400

  Graph.drawPie() if Data.container().length && Data.present()
