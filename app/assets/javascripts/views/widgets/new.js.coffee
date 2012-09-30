#= require ../workspace/dialog

class app.views.WidgetsNew extends app.views.Dialog

  template: JST['templates/widgets/new']

  options:
    title: 'Add Widget'
    footer: false

  #events:
    #'submit form' : 'save'
    #'hidden' : 'onHidden'

  initialize: ->
    super
    @render()

  render: ->
    @renderContent @template()
    return this

  #hide: ->
    #@el.modal(true).hide()

  #onHidden: (e) ->
    # console.log 'onHidden'
    # @modal.remove()
    # console.log @modal
    # @el.modal('show')
