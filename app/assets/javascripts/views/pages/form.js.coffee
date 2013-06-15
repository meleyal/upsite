#= require ../workspace/dialog

class App.PagesFormView extends App.DialogView

  template: JST['templates/pages/form']

  options:
    title: 'Design'

  events:
    'change input': 'update'
    'submit form': 'save'

  initialize: (options) ->
    # TODO: pass in as option (router?)
    @model = app.page
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
