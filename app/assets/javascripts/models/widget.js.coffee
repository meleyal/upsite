class app.models.Widget extends Backbone.Model

  urlRoot: '/widgets'

  data: -> @toJSON().data
