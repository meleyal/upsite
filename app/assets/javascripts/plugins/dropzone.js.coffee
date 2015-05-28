#
# Dropzone
# Confuration and handlers for dropzone.js
#

Dropzone.autoDiscover = false
dropzone = null

createDropzone = ->
  options =
    url: $('#new_block').attr('action')
    dictDefaultMessage: 'Click or drop files here to upload'
    paramName: 'block[attachments_attributes][0][upload]'
    headers: 'X-CSRF-Token' : $('meta[name="csrf-token"]').attr('content')
    previewsContainer: '#dropzone-wrapper'

  dropzone = new Dropzone('#dropzone-wrapper', options)
  dropzone.on 'success', onSuccess
  dropzone.on 'addedfile', onAddedFile


# Update the form to perform a PUT on the created resource
onSuccess = (file, res) ->
  $('#new_block')
    .attr('action', res.url)
    .append("<input type='hidden' name='_method' value='put'>")

# Show advanced options
onAddedFile = ->
  if dropzone.files.length > 1
    $('[data-form-advanced-options]').removeClass('hidden')

$(document).on 'page:change', ->

  if $('form[enctype="multipart/form-data"]').length
    createDropzone()
