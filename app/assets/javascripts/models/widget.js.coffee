class app.models.Widget extends Backbone.Model

  urlRoot: '/widgets'

  defaults:
    sort_order_position: 0

  data: -> @toJSON().data
