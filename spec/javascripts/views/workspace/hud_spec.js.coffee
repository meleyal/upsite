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
