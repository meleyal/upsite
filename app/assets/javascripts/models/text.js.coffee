class App.Models.Text extends App.Models.Widget

  defaults:
    type:   'Text'
    title:  'Title'
    body:   'Body'

  initialize: ->
    super()

  validate: (attrs) ->
    "cannot have an empty title" unless attrs.title
