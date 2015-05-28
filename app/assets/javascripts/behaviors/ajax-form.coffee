#
# Ajax Form
# Handle Rails ajax form responses
# Expects json errors in the format `{ model_name: { attr_name: [errors...] } }`
#

##
# Error
#

$(document).on 'ajax:error', 'form[data-remote]', (event, response) ->
  $form = $(this)
  json = try JSON.parse response.responseText
  removeErrors $form
  renderErrors $form, json

removeErrors = ($form) ->
  $form.find('.form-group')
    .removeClass 'has-error'
    .find '.help-block'
    .text ''

renderErrors = ($form, json) ->
  for name, attrs of json
    for attr, errors of attrs
      renderError $form, name, attr, errors

renderError = ($form, name, attr, errors) ->
  id = attrToId name, attr
  messageText = errors.join ', '
  $field = $form.find id
  $group = $field.closest '.form-group'
  $label = $group.find '.help-block'
  $group.addClass 'has-error'

  if $label.length
    $label.text messageText
  else
    $group.append $('<span/>', class: 'help-block', text: messageText)

attrToId = (name, attr) ->
  "##{name}_#{attr.replace('.', '_')}"


##
# Success
#

$(document).on 'ajax:success', 'form[data-remote]', (..., xhr) ->
  # FIXME: hack for remotipart uploads sending no location header
  # if location = xhr.getResponseHeader 'Location'
  #   Turbolinks.visit location
  Turbolinks.visit window.location
