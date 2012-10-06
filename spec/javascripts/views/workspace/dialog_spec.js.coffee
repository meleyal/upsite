#= require templates/workspace/dialog
#= require views/workspace/dialog

describe 'Views/Dialog', ->

  beforeEach ->
    @options = { title: 'Test' }
    @view = new app.views.Dialog @options
    @body = $('body')

  afterEach ->
    @view.remove()
    @body.removeClass('modal-open')

  it 'should initialize a modal', ->
    modal = @view.$el.data 'modal'
    expect(modal).toBeDefined()

  it 'should render itself', ->
    expect(@body).toContain '.modal'

  it 'should render custom content', ->
    content = $('<div>', class: 'custom')
    @view.renderContent(content)
    expect(@view.$el).toContain '.custom'

  it 'should accept options', ->
    title = @view.$('.modal-title').text()
    expect(title).toBe(@options.title)

