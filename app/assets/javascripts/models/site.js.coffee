class app.models.Site extends Backbone.Model

  urlRoot: '/'

  url: ->
    @urlRoot

  data: -> @toJSON()

  isNew: ->
    console.log 'isNew'
    false
