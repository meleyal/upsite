class app.collections.Widgets extends Backbone.Collection

  model: app.models.Widget

  url: '/widgets'

  comparator: (model) ->
    model.get('sort_order')

