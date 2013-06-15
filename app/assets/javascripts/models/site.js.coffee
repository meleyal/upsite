class app.models.Site extends Backbone.Model

  urlRoot: '/'

  # These are needed so we can PUT without an id.
  url: -> @urlRoot
  isNew: -> false

  data: -> @toJSON()

