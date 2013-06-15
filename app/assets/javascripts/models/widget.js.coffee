class App.Widget extends App.Model

  urlRoot: '/widgets'

  defaults:
    sort_order_position: 0

  data: -> @toJSON().data
