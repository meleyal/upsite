#= require application

describe 'Widget', ->

  beforeEach ->
    @model = new App.Models.Widget position: 1

  describe 'when instantiated', ->

    it 'should expose an attribute', ->
      expect(@model.get('position')).toEqual 1

  describe 'url', ->

    describe 'when no id is set', ->
      it 'should return the collection URL', ->
        expect(@model.url()).toEqual '/widgets'

    describe 'when id is set', ->
      it 'should return the collection URL and id', ->
        @model.id = 1
        expect(@model.url()).toEqual '/widgets/1'



