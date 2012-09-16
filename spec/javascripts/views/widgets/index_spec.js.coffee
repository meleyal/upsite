#= require views/widgets/index
#= require templates/texts/text
#= require views/texts/text

describe 'Views/Widgets/Index', ->

  beforeEach ->
    @collection = new Backbone.Collection
    @view = new app.views.WidgetsIndex { @collection }

  it 'should render a single widget', ->
    @collection.add title: 'Foo', type: 'Text'
    expect(@view.$el).toContain '.widget'

  it 'should render multiple widgets', ->
    @collection.reset(fixtures.widgets.valid)
    expect(@view.$('.widget').length).toEqual(2)

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
