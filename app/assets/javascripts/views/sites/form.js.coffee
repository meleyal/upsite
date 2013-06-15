#= require ../workspace/dialog

class App.SitesFormView extends App.DialogView

  template: JST['templates/sites/form']

  options:
    title: 'Design'

  events:
    'change input': 'update'
    'submit form': 'save'

  initialize: (options) ->
    @model = app.site
    super
    @render()

  render: ->
    @renderContent @template(@model?.data())
    return this

  update: (e) ->
    console.log 'updating'
    settings = @$('form').serializeObject()
    # @model.set { site: { settings } }
    @model.set { settings }

  save: (e) ->
    console.log 'saving...'
    e.preventDefault()
    settings = @$('form').serializeObject()
    console.log settings
    # @model.save { site: { settings } }
    @model.save { settings }
    # delete data._wysihtml5_mode
    # if @model
    #   @model.save { data }
    # else
    #   attrs = { type: 'Text', data }
    #   app.widgets.create attrs, { wait: true }
    @remove()
