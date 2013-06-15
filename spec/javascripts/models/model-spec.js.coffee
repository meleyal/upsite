#= require models/model

describe 'Models/Model', ->

  beforeEach ->
    @model = new App.Model

  it 'should exist', ->
    expect(@model).toBeDefined()
