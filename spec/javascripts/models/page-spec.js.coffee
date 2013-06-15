#= require models/page

describe 'Models/Page', ->

  beforeEach ->
    @model = new App.Page

  it 'should exist', ->
    expect(@model).toBeDefined()

  it 'should create sub-models', ->
    expect(@model.widgets).toBeDefined()
    expect(@model.attachments).toBeDefined()
