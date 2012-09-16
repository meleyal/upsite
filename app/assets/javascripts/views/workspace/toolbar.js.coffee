class app.views.Toolbar extends Backbone.View

  el: '.toolbar'

  template: JST['workspace/toolbar']

  events:
    'click .new-text' : 'newText'

  initialize: (options) ->
    @el = $(@el)
    @render()

  render: ->
    @setElement(@template())
    @$el.modal({ backdrop: false })
    @$el.modal('show')

  newText: (e) ->
    e.preventDefault()
    @$el.modal('hide')
    $('body').append new app.views.TextsNew
