class App.Application

  constructor: ->
    @page = new App.Page
    @widgets = new App.Widgets
    @attachments = new App.Attachments
    @widgetsIndex = new App.WidgetsIndexView el: '.widgets', collection: @widgets
    @theme = new App.PagesThemeView model: @page
    @hud = new App.HudView
    # @workspace = new App.WorkspaceView
