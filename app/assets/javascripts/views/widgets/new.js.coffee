#= require ../workspace/dialog

class app.views.WidgetsNew extends app.views.Dialog

  template: JST['templates/widgets/new']

  options:
    title: 'Add Widget'
    footer: false

  events:
    'click .new-text': 'newText'

  initialize: ->
    super
    @render()

  render: ->
    @renderContent @template()
    return this

  newText: (e) ->
    @remove()
    new app.views.TextsNew
    e.preventDefault()
