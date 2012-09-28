class app.views.Widget extends Backbone.View

  tagName: 'div'

  events:
    'click .delete': 'confirmDelete'
    'sorted': 'sorted'

  initialize: (options) ->
    @render()

  render: ->
    @$el.html @template?({ @model })

  confirmDelete: (e) ->
    if window.confirm 'Are you sure?'
      @remove()
      @model.destroy()
    e.preventDefault()

  sorted: (e, idx) =>
    delete @model.attributes.sort_order
    @model.save sort_order_position: idx
