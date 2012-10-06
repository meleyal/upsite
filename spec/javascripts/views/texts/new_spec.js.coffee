#= require models/widget
#= require collections/widgets
#= require templates/texts/new
#= require views/texts/new

describe 'Views/TextsNew', ->

  beforeEach ->
    app.widgets = new app.collections.Widgets
    @view = new app.views.TextsNew
    @view.$('#title').val('Woody Allen')
    @server = sinon.fakeServer.create()

  afterEach ->
    @server.restore()
    @view.remove()

  it 'should save widget on submit', ->
    @view.$('form').trigger 'submit'
    @server.respond()
    req = @server.requests[0]
    expect(req.requestBody).toMatch('Woody Allen')
