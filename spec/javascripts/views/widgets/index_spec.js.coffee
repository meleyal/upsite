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
  
