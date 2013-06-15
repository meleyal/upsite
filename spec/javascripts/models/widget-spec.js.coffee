#= require models/widget

describe 'Models/Widget', ->

  beforeEach ->
    @model = new App.Widget position: 1

  it 'should exist', ->
    expect(@model).toBeDefined()
