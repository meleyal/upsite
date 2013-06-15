#= require ../workspace/dialog

class App.ImagesFormView extends App.DialogView

  template: JST['templates/images/form']

  options:
    title: 'Image Widget'

  events:
    'submit form': 'upload'

  initialize: (options) ->
    super
    @render()

  render: ->
    @renderContent @template(@model?.data())
    return this

  upload: (e) ->
    e.preventDefault()
    file = @$('input')[0].files[0]
    attachment = app.attachments.create { file }
    attachment.on 'sync', (model, res) => @save res

  save: (attachment) ->
    data = { attachments: [attachment.upload_url] }
    if @model
      @model.save { data }
    else
      attrs = { type: 'Image', data }
      app.widgets.create attrs, { wait: true }
    @remove()
