class App.Application

  constructor: ->
    @site = new App.Site
    @widgets = new App.Widgets
    @attachments = new App.Attachments
    @widgetsIndex = new App.WidgetsIndexView el: '.widgets', collection: @widgets
    @theme = new App.SitesThemeView model: @site
    @hud = new App.HudView
    # @workspace = new App.WorkspaceView
