#= require collections/widgets

describe 'Collections/Widgets', ->

  beforeEach ->
    @collection = new App.Widgets
    # @fixture = fixtures.widgets.valid
    # @server = sinon.fakeServer.create()
    # @server.respondWith helpers.validResponse(@fixture)
    # @collection.fetch()
    # @server.respond()

  afterEach ->
    # @server.restore()

  it 'should exist', ->
    expect(@collection).toBeDefined()

  xit 'adds a model', ->
    expect(@collection.length).toEqual 2

  xit 'finds a model by id', ->
    expect(@collection.get(1).id).toEqual 1

  xit 'makes the correct request', ->
    expect(@server.requests.length).toEqual 1
    expect(@server.requests[0].method).toEqual 'GET'
    expect(@server.requests[0].url).toEqual '/widgets'

  xit 'parses widgets from the repsonse', ->
    expect(@collection.length).toEqual @fixture.length
    expect(@collection.get(1).get('data').title).toEqual 'Woody Allen'
