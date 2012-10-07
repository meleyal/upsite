#= require ./widget

class app.models.Text extends app.models.Widget

  #defaults:
    #type: 'Text'
    #sort_order_position: 0

  validate: (attrs) ->
    'cannot have an empty title' unless attrs.title
