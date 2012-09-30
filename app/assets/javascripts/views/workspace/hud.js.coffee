class app.views.Hud extends Backbone.View

  tagName: 'div'
  className: 'hud'
  template: JST['templates/workspace/hud']

  initialize: ->
    @render()

  render: ->
    @$el.html @template(@options)
    @$('a').tooltip placement: 'left'
    $('body').append @$el
    return this
