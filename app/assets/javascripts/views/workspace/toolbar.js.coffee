class App.Views.Toolbar extends Backbone.View

  el: '.toolbar'

  template: JST['toolbar']

  events:
    'click .more' : 'showMore'
    'click .new-text' : 'newText'

  initialize: (options) ->
    @el = $(@el)
    @render()

  render: ->
    @setElement(@template())
    @$el.modal({ backdrop: false })
    @$el.modal('show')
  
  showMore: (e) ->
    e.preventDefault()
    # $(e.target).remove()
    @$el.find('.modal-footer').remove()
    @$el.find('.toolbar-more').addClass('active')
  
  newText: (e) ->
    e.preventDefault()
    @$el.modal('hide')    
    $('body').append new App.Views.TextsNew