#= require ../workspace/dialog

class app.views.TextsNew extends app.views.Dialog

  template: JST['templates/texts/new']

  options:
    title: 'New Text'

  events:
    'submit form': 'save'

  initialize: ->
    super
    @render()
    #@installEditor()

  render: ->
    @renderContent @template
    return this

  save: (e) ->
    e.preventDefault()
    data = @$('form').serializeObject()
    # TODO: BB bug?
    # why does create not use model defaults?
    # sort_order_position is already set on model
    attrs =
      sort_order_position: 0
      data: data
    app.widgets.create(attrs, { wait:true })
    @remove()

  installEditor: ->
    @$('#body').wysihtml5
      'font-styles': false
      emphasis: true
      lists: true
      link: false
      image: false
      color: false
