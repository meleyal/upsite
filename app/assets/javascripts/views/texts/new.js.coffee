#= require ../workspace/dialog

class app.views.TextsNew extends app.views.Dialog

  template: JST['templates/texts/new']

  options:
    title: 'New Text'

  events:
    'submit form': 'save'

  initialize: (options) ->
    super
    @model = new app.models.Text
    @render()
    #@installEditor()

  render: ->
    @renderContent @template { @model }
    return this

  save: (e) ->
    e.preventDefault()
    data = @$('form').serializeObject()
    attrs =
      type: 'Text'
      sort_order_position: 0
      data: data
    #console.log data
    app.widgets.create(attrs, { wait:true })
    #app.widgets.fetch()
    @remove()

  installEditor: ->
    @$('#body').wysihtml5
      'font-styles': false
      emphasis: true
      lists: true
      link: false
      image: false
      color: false
