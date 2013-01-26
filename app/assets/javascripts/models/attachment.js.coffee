class app.models.Attachment extends Backbone.Model

  sync: (method, model, options) =>
    console.log 'sync', method, model, options
    file = model.get 'file'
    formData = new FormData
    formData.append 'upload', file
    token = $("meta[name='csrf-token']").attr 'content'
    console.log token
    formData.append 'authenticity_token', token
    req = new XMLHttpRequest
    # upload = req.upload
    req.addEventListener 'progress', @updateProgress
    req.addEventListener 'load', @transferComplete
    # req.addEventListener("error", transferFailed, false);
    # req.addEventListener("abort", transferCanceled, false);
    req.open 'POST', @url()
    req.send formData
    req

  updateProgress: (e) ->
    # console.log 'progress', e

  transferComplete: (e) =>
    # console.log 'complete', e
    res = $.parseJSON e.target.responseText
    @trigger 'sync', this, res
