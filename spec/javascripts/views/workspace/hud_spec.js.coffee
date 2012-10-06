#= require templates/workspace/hud
#= require views/workspace/hud

describe 'Views/Hud', ->

  beforeEach ->
    @view = new app.views.Hud
    @body = $('body')

  afterEach ->
    @view.remove()

  it 'should render itself', ->
    expect(@body).toContain '.hud'

  xit 'should create a widgets dialog when clicking "Add"', ->
    add = @view.$('.add')
    add.on 'click', => expect(@body).toContain '.modal'
    add.trigger 'click'
