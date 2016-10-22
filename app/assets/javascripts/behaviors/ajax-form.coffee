#
# Ajax Form
# Handle Rails ajax form responses
# Expects json errors in the format `{ model_name: { attr_name: [errors...] } }`
#

##
# Submit
#

$(document).on 'submit', 'form[data-remote]', (e, response) ->
  $(e.target).find('input[type="submit"]').button('loading')


##
# Error
#

$(document).on 'ajax:error', 'form[data-remote]', (event, response) ->
  $form = $(this)
  json = try JSON.parse response.responseText
  removeErrors $form
  renderErrors $form, json

removeErrors = ($form) ->
  $form.find('input[type="submit"]').button('reset')
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

redirect = (xhr) ->
  location = xhr.getResponseHeader('location')
  if xhr.getResponseHeader('turbolinks') is 'false'
    window.location = location
  else
    Turbolinks.visit location

# replace = (e) ->
#   $modal = $(e.currentTarget).parents('.modal')
#   content = xhr.responseText
#   $modal.find('.modal-content').html(content)

$(document).on 'ajax:success', 'form[data-remote]', (e, data, textStatus, xhr) ->
  redirect(xhr)
