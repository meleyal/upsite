class App.Collections.Widgets extends Backbone.Collection

  model: App.Models.Widget

  url: '/widgets'

  initialize: ->
    # console.log 'hello collection'
    # @fetch()
