#= require models/widget
#= require collections/widgets
#= require views/widgets/index
#= require templates/texts/text
#= require views/texts/text

describe 'Views/Widgets/Index', ->

  beforeEach ->
    @collection = new app.collections.Widgets
    @view = new App.WidgetsIndex { @collection }

  it 'should render multiple widgets', ->
    @collection.reset fixtures.widgets.valid
    expect(@view.$('.widget').length).toEqual(2)

  it 'should render correct widget type', ->
    @collection.reset fixtures.widgets.valid
    expect(@view.$el).toContain '.widget-text'

  it 'should be sortable', ->
    expect(@view.$el.data('sortable')).toBeDefined()

  it 'should find a widgets index/position when sorted', ->
    html = '''
      <div class="widget"></div>
      <div class="widget"></div>
    '''
    @view.$el.append html
    ui = { item: @view.$('.widget').last() }
    spy = sinon.spy()
    ui.item.on 'sorted', spy
    @view.$el.trigger 'sortupdate', ui
    expect(spy.getCall(0).args[1]).toBe(1)
