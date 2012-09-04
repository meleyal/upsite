#= require application

describe 'Text', ->

  beforeEach ->
    @model = new App.Models.Text

  describe 'when instantiated', ->
    it 'should have a default type', ->
      expect(@model.get('type')).toEqual('Text')

  describe 'validation', ->
    it 'should not save when title is empty', ->
      eventSpy = sinon.spy()
      @model.on('error', eventSpy)
      @model.save "title": ""
      expect(eventSpy).toHaveBeenCalledOnce()
      expect(eventSpy).toHaveBeenCalledWith @model, "cannot have an empty title"
