#= require application

describe 'Widgets', ->

  describe 'when instantiated', ->

    beforeEach ->
      @server = sinon.fakeServer.create()
      @fixture = Fixtures.Widgets.valid
      #loadFixtures 'foo.html'
      @server.respondWith(
        'GET', '/widgets',
        [
          200,
          {"Content-Type": "application/json"},
          JSON.stringify(@fixture)
        ]
      )
      @collection = new App.Collections.Widgets
      @collection.add id: 8, title: "Foo"

    afterEach ->
      @server.restore()

    it 'should add a model', ->
      expect(@collection.length).toEqual 1

    it 'should find a model by id', ->
      expect(@collection.get(8).get('id')).toEqual 8

    it 'should make the correct request', ->
      @collection.fetch()
      expect(@server.requests.length).toEqual 1
      expect(@server.requests[0].method).toEqual 'GET'
      expect(@server.requests[0].url).toEqual '/widgets'

    it 'should parse widgets from the repsonse', ->
      @collection.fetch()
      @server.respond()
      console.log @collection
      expect(@collection.length).toEqual(@fixture.response.length)
