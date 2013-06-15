#= require collections/collection

describe 'Collections/Collection', ->

  beforeEach ->
    @collection = new App.Collection

  it 'should exist', ->
    expect(@collection).toBeDefined()
