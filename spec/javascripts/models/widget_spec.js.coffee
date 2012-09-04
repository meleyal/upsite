#= require application

describe 'Widget', ->

  beforeEach ->
    @model = new App.Models.Widget position: 1
    collection = { url: '/collection' }
    @model.collection = collection

  describe 'when instantiated', ->

    it 'should expose an attribute', ->
      expect(@model.get('position')).toEqual(1)

  describe 'url', ->
    
    describe
