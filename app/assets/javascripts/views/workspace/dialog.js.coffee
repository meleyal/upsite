class App.Views.Dialog extends Backbone.View

  tagName: 'div'
  className: 'modal'
  template: JST['workspace/dialog']

  options:
    'title': 'Untitled Dialog'

  events:
    'click .confirm' : 'confirm'
    'hidden' : 'onHidden'

  initialize: ->
    #@render()

  render: ->
    @setElement(@template(@options))
    @$el.modal({ show: false, backdrop: false })
    @$el.modal('show')

  add: (containerName, view) ->
    console.log 'add subview...'

  show: ->
    @$el.modal('show')

  hide: ->
    @$el.modal('hide')

  confirm: (e) ->
    e.preventDefault()
    @options.onConfirm() if @options.onConfirm()
    this.hide()

  onHidden: (e) ->
    @$el.remove()

_.extend(App.Views.Dialog, {

  prompt: (text, callback, options) ->
    new App.Views.Dialog(_.extend({
      title: text
      onConfirm: callback
    }))

})
