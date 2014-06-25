jQuery ($) ->
  Container =
    _container: -> $ '[data-graph-container]'
    raw:        -> @_container().get 0
    width:      -> @_container().outerWidth()
    present:    -> @_container().length
    empty:      -> @_container().empty()

  Data =
    values:     -> $('[data-graph-value]').map -> +$(this).text()
    labels:     -> $('[data-graph-label]').map -> "%%.%% #{$(this).text()}"
    colors:     -> $('[data-graph-color]').map -> $(this).data('graphColor')
    hrefs:      -> $('[data-graph-href]').map  -> $(this).data('graphHref')
    others:     -> $('[data-graph-grid][data-graph-others]').data 'graphOthers'
    present:    -> @values().length
    pieOptions: -> legend: @labels(), legendothers: @others(), colors: @colors(), href: @hrefs()

  Graph =
    pie: -> @_pie().hover @_hoverIn, @_hoverOut
    _pie: ->
      @_raphael().piechart Container.width() / 3.5, 100, 75, Data.values(), Data.pieOptions()
    _raphael: -> Raphael Container.raw(), Container.width(), 200
    _hoverIn: ->
      @sector.scale 1.1, 1.1, @cx, @cy

      if @label
        @label[0].attr r: 7.5
        @label[1].attr 'font-weight': 800
    _hoverOut: ->
      @sector.animate transform: "s1 1 #{@cx} #{@cy}", 500, 'bounce'

      if @label
        @label[0].animate r: 5, 500, 'bounce'
        @label[1].attr 'font-weight': 400

  Container.empty() && Graph.pie() if Container.present() && Data.present()
