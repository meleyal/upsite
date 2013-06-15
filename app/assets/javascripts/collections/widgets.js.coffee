class App.Widgets extends App.Collection

  model: App.Widget
  url: '/widgets'

  # model: (attrs, options) ->
  #   if model = app.models[attrs.type]
  #     new model attrs, options
  #   else
  #     console.warn 'Widget not found'
  #     false
