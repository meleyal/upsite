#= require models/site

describe 'Models/Site', ->

  beforeEach ->
    @model = new App.Site

  it 'should exist', ->
    expect(@model).toBeDefined()
