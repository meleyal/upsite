class app.views.Dialog extends Backbone.View

  tagName: 'div'
  className: 'modal'

  dialogTemplate: (data) ->
    JST['templates/workspace/dialog'](data)

  defaults:
    title: 'Untitled Dialog'

  initialize: ->
    # TODO: use events hash and merge with child views
    $(document).on 'keyup', @onKeyup
    @dialogRender()

  onKeyup: (e) =>
    switch e.which
      when 27 then @remove()

  dialogRender: ->
    @options ||= @defaults
    @setElement @dialogTemplate(@options)
    @$el.modal show: false, backdrop: false
    @$el.modal 'show'
    return this

  renderContent: (content) ->
    @$('.modal-body').html content
