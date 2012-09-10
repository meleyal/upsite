#= require models/widget

describe 'Widget', ->

  beforeEach ->
    @model = new app.models.Widget position: 1

  # TODO: test something useful

  it 'exposes an attribute', ->
    expect(@model.get('position')).toEqual 1

  it 'returns the collection URL when no id is set', ->
    expect(@model.url()).toEqual '/widgets'

  it 'returns the collection URL and id when id is set', ->
    @model.id = 1
    expect(@model.url()).toEqual '/widgets/1'
