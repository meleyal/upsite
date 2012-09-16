class app.views.WidgetsIndex extends Backbone.View

  events:
    'sortupdate': 'onSort'

  sortableOptions:
    tolerance: 'pointer'
    handle: '.move'
    placeholder: 'widget-placeholder span4'
    forcePlaceholderSize: true

  initialize: (options) ->
    { @collection } = options
    @collection.bind 'add', @addOne
    @collection.bind 'reset', @addAll
    @makeSortable()

  addOne: (model) =>
    type = model.get 'type'
    view = app.views[type]
    widget = new view({ model }).render()
    @$el.append widget

  addAll: =>
    @$el.empty()
    @collection.each @addOne

  makeSortable: ->
    @$el.sortable @sortableOptions

  onSort: (e, ui) =>
    widgets = @$('.widget')
    idx = widgets.index(ui.item)
    ui.item.trigger 'sorted', idx
