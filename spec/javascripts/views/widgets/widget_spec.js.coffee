#= require views/widgets/widget

describe 'Views/Widget', ->

  beforeEach ->
    collection = { url: '/collection' }
    @model = new Backbone.Model
    @model.collection = collection
    @view = new app.views.Widget { @model }
    @server = sinon.fakeServer.create()

  afterEach ->
    @server.restore()

  it 'should save position when sorted', ->
    @model.on 'change', (model) ->
      expect(model.get('position_position')).toEqual(2)
    @view.$el.trigger 'sorted', 2
