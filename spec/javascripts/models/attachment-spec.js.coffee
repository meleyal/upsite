#= require models/attachment

describe 'Models/Attachment', ->

  beforeEach ->
    @model = new App.Attachment

  it 'should exist', ->
    expect(@model).toBeDefined()
