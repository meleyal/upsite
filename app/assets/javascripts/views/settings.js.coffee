class App.Views.Settings extends Backbone.View

  el: '.options'

  template: JST['settings/edit']

  # events:
  #   'submit form' : 'save'

  initialize: (options) ->
    @el = $(@el)
    @render()

  render: ->
    @setElement(@template())
    @$el.modal('show')