class app.views.Dialog extends Backbone.View

  tagName: 'div'
  className: 'modal'
  dialogTemplate: JST['templates/workspace/dialog']

  defaults:
    title: 'Untitled Dialog'

  #events:
    #'show': 'onShow'
    #'click .confirm': 'confirm'
    #'hidden' : 'onHidden'

  initialize: ->
    @dialogRender()

  dialogRender: ->
    @options ||= @defaults
    @setElement @dialogTemplate(@options)
    #@$el.on 'show', @onShow
    @$el.modal show: false, backdrop: false
    @$el.modal 'show'
    return this

  renderContent: (content) ->
    @$('.modal-body').html content

  onShow: (e) =>
    #console.log 'onShow'
