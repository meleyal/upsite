class app.views.Widget extends Backbone.View

  tagName: 'div'

  events:
    'click': 'log'
    'sorted': 'sorted'
    'click .edit': 'edit'
    'click .delete': 'confirmDelete'

  initialize: (options) ->
    @model.on 'change:data', @render

  render: (model) =>
    model ?= @model
    @$el.html @template(model.data())
    this

  log: (e) =>
    console.log @model

  sorted: (e, idx) =>
    @model.save { sort_order_position: idx }, { wait: true }
    @model.fetch()

  edit: (e) ->
    new app.views.TextsForm { @model }
    e.preventDefault()

  confirmDelete: (e) ->
    if window.confirm 'Are you sure?'
      @remove()
      @model.destroy()
    e.preventDefault()
