class app.views.Widget extends Backbone.View

  tagName: 'div'

  events:
    'sorted': 'sorted'
    'click .edit': 'edit'
    'click .delete': 'confirmDelete'

  initialize: (options) ->
    @model.on 'change:data', @render

  render: (model) =>
    model ?= @model
    @$el.html @template?(model.data())

  sorted: (e, idx) =>
    delete @model.attributes.sort_order
    @model.save sort_order_position: idx

  edit: (e) ->
    new app.views.TextsForm({ @model })
    e.preventDefault()

  confirmDelete: (e) ->
    if window.confirm 'Are you sure?'
      @remove()
      @model.destroy()
    e.preventDefault()

