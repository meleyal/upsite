class app.views.WidgetsNew extends Backbone.View

  el: '.toolbar'

  events:
    'submit form' : 'save'
    'hidden' : 'onHidden'

  render: ->
    @setElement(@template())
    @$el.modal({ backdrop: false })
    @$el.modal('show')
    return this

  hide: ->
    @el.modal(true).hide()

  onHidden: (e) ->
    # console.log 'onHidden'
    # @modal.remove()
    # console.log @modal
    # @el.modal('show')
