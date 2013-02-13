class app.views.Hud extends Backbone.View

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
    new app.views.WidgetsNew
    e.preventDefault()

  design: (e) ->
    new app.views.SitesForm
    e.preventDefault()
