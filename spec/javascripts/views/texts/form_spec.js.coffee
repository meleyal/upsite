#= require models/widget
#= require collections/widgets
#= require templates/texts/form
#= require views/texts/form

describe 'Views/TextsForm', ->

  beforeEach ->
    app.widgets = new app.collections.Widgets
    @view = new app.views.TextsForm
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
