#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require jquery.ba-serializeobject
#= require bootstrap
#= require bootstrap-wysihtml5
#= require underscore
#= require backbone

#= require app/namespace
#= require app/router
#= require app/app
#= require models/model
#= require models/widget
#= require collections/collection

#= require_tree ./models
#= require_tree ./collections
#= require_tree ./templates
#= require_tree ./views

window.app = new App.Application
