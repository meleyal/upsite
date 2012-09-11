#= require ./widget

class app.models.Text extends app.models.Widget

  defaults:
    type:   'Text'
    title:  'Title'
    body:   'Body'

  validate: (attrs) ->
    "cannot have an empty title" unless attrs.title
