class App.HudView extends Backbone.View

  tagName: 'div'
  className: 'hud'
  template: JST['templates/workspace/hud']

  events:
    'click .add': 'add'
    'click .design': 'design'

  initialize: ->
    @render()

  render: ->
    @$el.html @template(@options)
    @$('a').tooltip placement: 'left'
    $('body').append @$el
    this

  add: (e) ->
    new App.WidgetsNewView
    e.preventDefault()

  design: (e) ->
    new App.SitesFormView
    e.preventDefault()
