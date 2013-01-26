#= require ../workspace/dialog

class app.views.ImagesForm extends app.views.Dialog

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
      # TODO: Why does create not use model defaults?
      # sort_order_position is already set on model
      attrs = { sort_order_position: 0, type: 'Image', data }
      app.widgets.create attrs, { wait: true }
    @remove()
