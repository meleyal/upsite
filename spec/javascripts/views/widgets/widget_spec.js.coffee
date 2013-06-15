#= require templates/texts/text
#= require views/widgets/widget

describe 'Views/Widget', ->

  beforeEach ->
    collection = { url: '/collection' }
    App.Widget::template = JST['templates/texts/text']
    @model = new Backbone.Model
    @model.data = -> true
    @model.collection = collection
    @view = new App.Widget { @model }
    @server = sinon.fakeServer.create()

  afterEach ->
    @server.restore()
    @view.remove()

  it 'should save position when sorted', ->
    @model.on 'change', (model) ->
      expect(model.get('sort_order_position')).toEqual(2)
    @view.$el.trigger 'sorted', 2

  it 'should delete itself on clicking delete button', ->
    @view.render()
    sinon.stub(window, 'confirm').returns(true)
    spy = sinon.spy()
    @model.on 'destroy', spy
    btn = @view.$('.delete')
    btn.trigger 'click'
    expect(window.confirm).toHaveBeenCalled()
    expect(spy).toHaveBeenCalled()
