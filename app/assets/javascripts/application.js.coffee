#= require jquery
#= require jquery-ui
#= require bootstrap
#= require underscore
#= require backbone
#= require backbone.authtokenadapter
#= require namespace
#= require_tree ../templates
#= require models/widget
#= require collections/widgets
#= require_tree ./views/widgets
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers
#= require_tree .

App.initialize = ->
  window.Widgets = new App.Collections.Widgets
  new App.Views.Workspace
  new App.Views.WidgetsIndex({ collection: Widgets })
  Widgets.fetch()
  $('.options a').tooltip({ placement: 'left' })

$(document).ready ->
  App.initialize()
