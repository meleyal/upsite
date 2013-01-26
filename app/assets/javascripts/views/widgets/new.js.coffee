#= require ../workspace/dialog

class app.views.WidgetsNew extends app.views.Dialog

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
      when 'text' then new app.views.TextsForm
      when 'image' then new app.views.ImagesForm
