describe 'App/Router', ->

  beforeEach ->
    @start = sinon.stub Backbone.history, 'start'
    @page = new Backbone.Model
    @router = new App.Router { @page }

  it 'should exist', ->
    expect(@router).toBeDefined()
    @start.restore()

  it 'should start Backbone.history', ->
    expect(@start).toHaveBeenCalled()

