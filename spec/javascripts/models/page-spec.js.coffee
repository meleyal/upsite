#= require models/page

describe 'Models/Page', ->

  beforeEach ->
    @model = new App.Page

  it 'should exist', ->
    expect(@model).toBeDefined()
