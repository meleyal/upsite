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
    @collection.bind 'reset', @addAll
    @collection.bind 'add', @addOne
    @makeSortable()

  addOne: (model) =>
    widget = @buildView model
    @$el.prepend widget

  addAll: =>
    @$el.empty()
    views = @collection.map @buildView
    @$el.append views

  buildView: (model) ->
    type = model.get 'type'
    view = app.views[type]
    new view({ model }).render().el

  makeSortable: ->
    @$el.sortable @sortableOptions

  onSort: (e, ui) =>
    widgets = @$('.widget')
    idx = widgets.index ui.item
    ui.item.trigger 'sorted', idx
