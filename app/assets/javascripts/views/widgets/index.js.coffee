class App.Views.WidgetsIndex extends Backbone.View

  el: '.widgets'

  initialize: (options) ->
    @el = $(@el);
    @collection = options.collection
    @collection.bind('add', @addOne)
    @collection.bind('reset', @addAll)
    @makeSortable()
  
  addOne: (model) =>
    console.log 'addOne'
    type = model.get('type')
    # console.log type
    view = eval("App.Views.#{type}") # TODO: evil
    widget = new view({ model }).render()
    @el.append(widget)

  addAll: =>
    @el.empty()
    @collection.each(@addOne)
    
  makeSortable: ->
    @el.sortable({ 
      tolerance: 'pointer'
      handle: '.move'
      placeholder: 'widget-placeholder span4'
      forcePlaceholderSize: true
      update: (e, ui) =>
        @widgets = @el.find('.widget')        
        idx = @widgets.index(ui.item)
        ui.item.trigger('sorted', idx)
    })