describe 'App/Application', ->

  beforeEach ->
    @app = new App.Application

  it 'should exist', ->
    expect(@app).toBeDefined()

  it 'should setup app', ->
    expect(@app.page).toBeDefined()
    expect(@app.router).toBeDefined()
