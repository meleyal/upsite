#= require templates/workspace/dialog
#= require views/workspace/dialog

describe 'Views/Dialog', ->

  beforeEach ->
    @view = new app.views.Dialog
    @body = $('body')

  afterEach ->
    @view.remove()
    @body.removeClass('modal-open')

  it 'should initialize a modal', ->
    modal = @view.$el.data 'modal'
    expect(modal).toBeDefined()

  it 'should render itself', ->
    expect(@body).toContain '.modal'
