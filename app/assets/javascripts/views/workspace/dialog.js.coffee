class app.views.Dialog extends Backbone.View

  tagName: 'div'
  className: 'modal'

  dialogTemplate: (data) ->
    JST['templates/workspace/dialog'](data)

  defaults:
    title: 'Untitled Dialog'

  initialize: ->
    @dialogRender()

  dialogRender: ->
    @options ||= @defaults
    @setElement @dialogTemplate(@options)
    @$el.modal show: false, backdrop: false
    @$el.modal 'show'
    return this

  renderContent: (content) ->
    @$('.modal-body').html content
