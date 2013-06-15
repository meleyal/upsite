#= require ../workspace/dialog

class App.WidgetsNewView extends App.DialogView

  template: JST['templates/widgets/new']

  options:
    title: 'Add Widget'
    footer: false

  events:
    'click a': 'new'

  initialize: ->
    super
    @render()

  render: ->
    @renderContent @template()
    return this

  new: (e) ->
    @remove()
    e.preventDefault()
    { type } = $(e.currentTarget).data()
    switch type
      when 'text' then new App.TextsFormView
      when 'image' then new App.ImagesFormView
