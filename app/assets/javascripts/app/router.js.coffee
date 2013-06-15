class App.Router extends Backbone.Router

  routes:
    '': 'index'

  initialize: (options) ->
    { @page } = options
    Backbone.history.stop()
    Backbone.history.start pushState: true

  index: ->
    console.log 'index', @page
    # new App.WidgetsIndexView el: '.widgets', collection: @page.widgets
    # new App.PagesThemeView model: @page
    # new App.HudView
    # @workspace = new App.WorkspaceView
