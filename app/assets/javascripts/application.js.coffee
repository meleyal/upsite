#= require jquery
#= require jquery-ui
#= require jquery.ba-serializeobject
#= require bootstrap
#= require wysihtml5
#= require bootstrap-wysihtml5
#= require underscore
#= require backbone
#= require backbone.authtokenadapter
#= require namespace
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./templates
#= require_tree ./views

$ =>
  app.widgets = new app.collections.Widgets
  app.widgetsIndex = new app.views.WidgetsIndex el: '.widgets', collection: app.widgets
  app.hud = new app.views.Hud

  #@workspace = new App.Views.Workspace
