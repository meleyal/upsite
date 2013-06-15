#= require models/attachment
#= require collections/attachments

describe 'Collections/Attachments', ->

  beforeEach ->
    @collection = new App.Attachments

  it 'should exist', ->
    expect(@collection).toBeDefined()
