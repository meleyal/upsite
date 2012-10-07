#= require ../workspace/dialog

class app.views.TextsForm extends app.views.Dialog

  template: JST['templates/texts/form']

  options:
    title: 'New Text'

  events:
    'submit form': 'save'

  initialize: (options) ->
    super
    @render()
    #@installEditor()

  render: ->
    @renderContent @template(@model?.data())
    return this

  save: (e) ->
    e.preventDefault()
    data = @$('form').serializeObject()
    if @model
      @model.save({ data }, { wait:true })
    else
      # why does create not use model defaults?
      # sort_order_position is already set on model
      attrs = { sort_order_position: 0, data }
      app.widgets.create(attrs, { wait:true })
    @remove()

  installEditor: ->
    @$('input#body').wysihtml5
      'font-styles': false
      emphasis: true
      lists: true
      link: false
      image: false
      color: false
