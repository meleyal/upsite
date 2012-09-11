#= require views/widgets/index
#= require templates/texts/text
#= require views/texts/text

describe 'Widgets/Index', ->

  beforeEach ->
    @collection = new Backbone.Collection
    @view = new app.views.WidgetsIndex { @collection }

  it 'should render a widget view', ->
    @collection.add title: 'Foo', type: 'Text'
    expect(@view.$el).toContain '.widget'
