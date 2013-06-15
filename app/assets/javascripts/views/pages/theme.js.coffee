class App.PagesThemeView extends Backbone.View

  tagName: 'style'

  template: JST['templates/pages/theme']

  initialize: (options) ->
    $('head').append @render().el
    @model.on 'change', @render

  render: =>
    @$el.html @template(@model.data()) if @model.get('settings')
    this

