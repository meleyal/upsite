class app.views.Dialog extends Backbone.View

  tagName: 'div'
  className: 'modal'
  dialogTemplate: JST['templates/workspace/dialog']

  options:
    'title': 'Untitled Dialog'

  #events:
    #'show': 'onShow'
    #'click .confirm': 'confirm'
    #'hidden' : 'onHidden'

  initialize: ->
    console.log 'Dialog#initialize'
    @dialogRender()

  dialogRender: ->
    #@$el.html @template(@options)
    @setElement @dialogTemplate(@options)
    #@delegateEvents()
    #@$el.on 'show', @onShow
    @$el.modal show: false, backdrop: false
    @$el.modal 'show'
    return this

  onShow: (e) =>
    #console.log 'onShow'

  #add: (containerName, view) ->
    #console.log 'add subview...'

  #show: ->
    #@$el.modal('show')

  #hide: ->
    #@$el.modal('hide')

  #confirm: (e) ->
    #console.log 'onConfirm'
    #e.preventDefault()
    #@options.onConfirm() if @options.onConfirm()
    #this.hide()

  #onHidden: (e) ->
    #@$el.remove()
