#= require models/image

describe 'Models/Image', ->

  beforeEach ->
    @model = new App.Image

  it 'should exist', ->
    expect(@model).toBeDefined()
