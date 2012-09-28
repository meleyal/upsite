#= require templates/texts/text
#= require views/widgets/widget

describe 'Views/Widget', ->

  beforeEach ->
    collection = { url: '/collection' }
    app.views.Widget::template = JST['templates/texts/text']
    @model = new Backbone.Model
    @model.collection = collection
    @view = new app.views.Widget { @model }
    @server = sinon.fakeServer.create()

  afterEach ->
    @server.restore()

  it 'should save position when sorted', ->
    @model.on 'change', (model) ->
      expect(model.get('sort_order_position')).toEqual(2)
    @view.$el.trigger 'sorted', 2

  it 'should delete itself on clicking delete button', ->
    sinon.stub(window, 'confirm').returns(true)
    spy = sinon.spy()
    @model.on 'destroy', spy
    btn = @view.$('.delete')
    btn.trigger 'click'
    expect(window.confirm).toHaveBeenCalled()
    expect(spy).toHaveBeenCalled()
