#
# Dropzone
# Confuration and handlers for dropzone.js
#

Dropzone.autoDiscover = false

createDropzone = ->
  options =
    url: $('#new_block').attr('action')
    dictDefaultMessage: 'Click or drop files here to upload'
    paramName: 'block[attachments_attributes][0][upload]'
    headers: 'X-CSRF-Token' : $('meta[name="csrf-token"]').attr('content')
    previewsContainer: '#dropzone-wrapper'

  myDropzone = new Dropzone('#dropzone-wrapper', options)

  myDropzone.on 'success', onSuccess


# Update the form to perform a PUT on the created resource
onSuccess = (file, res) ->
  $('#new_block')
    .attr('action', res.url)
    .append("<input type='hidden' name='_method' value='put'>")


$(document).on 'page:change', ->

  if $('form[enctype="multipart/form-data"]').length
    createDropzone()
