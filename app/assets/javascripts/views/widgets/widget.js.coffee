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
    #console.log @model
    #console.log 'sorted', idx
    # console.log @model
    # console.log @model.url()
    delete @model.attributes.position
    #console.log @model.attributes
    @model.save({ position_position: idx })
    # @model.save({ position: idx })

