class App.Page extends App.Model

  urlRoot: '/'

  # These are needed so we can PUT without an id.
  url: -> @urlRoot
  isNew: -> false

  data: -> @toJSON()

