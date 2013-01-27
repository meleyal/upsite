#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require jquery.ba-serializeobject
#= require bootstrap
#= require bootstrap-wysihtml5
#= require underscore
#= require backbone
#= require namespace
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./templates
#= require_tree ./views

$ =>
  app.widgets = new app.collections.Widgets
  app.attachments = new app.collections.Attachments
  app.widgetsIndex = new app.views.WidgetsIndex el: '.widgets', collection: app.widgets
  app.hud = new app.views.Hud
  app.widgets.fetch()
  #@workspace = new App.Views.Workspace
