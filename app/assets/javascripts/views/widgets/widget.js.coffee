class app.views.Widget extends Backbone.View

  tagName: 'div'

  #events:
    #'click .delete' : 'confirmDelete'

  initialize: (options) ->
    @$el.on('sorted', @sorted)
    @render()

  render: ->
    @$el.html(@template?({ @model }))

  #confirmDelete: ->
    #$(@el).append new app.views.Dialog.prompt("Delete #{@model.get('type')}?", =>
      #@model.destroy()
      #@$el.remove()
    #)

  sorted: (e, idx) =>
    delete @model.attributes.sort_order
    @model.save({ sort_order_position: idx })
