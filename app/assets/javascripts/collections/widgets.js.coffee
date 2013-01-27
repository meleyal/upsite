class app.collections.Widgets extends Backbone.Collection

  model: app.models.Widget
  url: '/widgets'

  model: (attrs, options) ->
    if model = app.models[attrs.type]
      new model attrs, options
    else
      console.warn 'Widget not found'
      false
