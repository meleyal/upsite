#= require jquery
#= require jquery-ui
#= require bootstrap
#= require wysihtml5
#= require bootstrap-wysihtml5
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
#= require_tree .

class Application

  constructor: ->
    $ =>
      @initialize()

  initialize: ->
    @widgets = new App.Collections.Widgets
    @workspace = new App.Views.Workspace
    new App.Views.WidgetsIndex({ collection: @widgets })
    @widgets.fetch()
    $('.options a').tooltip({ placement: 'left' })

window.app = new Application
