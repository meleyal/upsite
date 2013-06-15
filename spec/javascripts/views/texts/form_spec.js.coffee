#= require models/widget
#= require collections/widgets
#= require templates/texts/form
#= require views/texts/form

describe 'Views/TextsForm', ->

  beforeEach ->
    app.widgets = new app.collections.Widgets
    @view = new App.TextsForm
    @view.$('#title').val('Woody Allen')
    @fixture = fixtures.widgets.valid[0]
    @server = sinon.fakeServer.create()

  afterEach ->
    @server.restore()
    @view.remove()

  it 'should create a new widget on submit', ->
    spy = sinon.spy()
    app.widgets.on 'sync', spy
    @view.$('form').trigger 'submit'
    @server.respondWith helpers.createdResponse(@fixture)
    @server.respond()
    req = @server.requests[0]
    expect(req.requestBody).toMatch('Woody Allen')
    expect(spy).toHaveBeenCalled()

  it 'should update an existing widget on submit', ->
    model = new app.models.Widget id:1
    @view.model = model
    spy = sinon.spy()
    model.on 'sync', spy
    @view.$('form').trigger 'submit'
    @server.respondWith helpers.updatedResponse()
    @server.respond()
    expect(spy).toHaveBeenCalled()
