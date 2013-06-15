#= require models/text

describe 'Models/Text', ->

  beforeEach ->
    @model = new App.Text

  it 'should exist', ->
    expect(@model).toBeDefined()

  xit 'should have a default type', ->
    expect(@model.get('type')).toEqual 'Text'

  xit 'should not save when title is empty', ->
    spy = sinon.spy()
    @model.on 'error', spy
    @model.save 'title':''
    expect(spy).toHaveBeenCalledOnce()
    expect(spy).toHaveBeenCalledWith @model, 'cannot have an empty title'
