#= require ../workspace/dialog

class app.views.TextsForm extends app.views.Dialog

  template: JST['templates/texts/form']

  options:
    title: 'Text Widget'

  editorOptions:
    'font-styles': false
    link: false
    image: false
    color: false

  events:
    'submit form': 'save'

  initialize: (options) ->
    super
    @render()
    @installEditor()

  render: ->
    @renderContent @template(@model?.data())
    return this

  save: (e) ->
    e.preventDefault()
    data = @$('form').serializeObject()
    delete data._wysihtml5_mode
    if @model
      @model.save { data }
    else
      attrs = { type: 'Text', data }
      app.widgets.create attrs, { wait: true }
    @remove()

  installEditor: ->
    @$('textarea').wysihtml5 @editorOptions
