##
# [data-autofill]
# Autofill one field based on the value of another
#
$(document).on 'change', '[data-autofill]', (e) ->
  $input = $(e.currentTarget)
  selector = $input.data('autofill')
  $(selector).val($input.val()).trigger('autofill').trigger('change')

##
# [data-format]
# Rewrite a fields value into a given format
#
$(document).on 'autofill', '[data-format]', (e) ->
  $input = $(e.currentTarget)
  value = $input.val()

  result = switch $input.data('format')
    when 'subdomain' then value.toLowerCase().replace(/'/g, '').replace(/[^a-z0-9]+/g, '-')

  $input.val(result) if result

##
# <form>
# autofocus first form field
#
$(document).on 'ready', ->
  $field = $('form').find('.form-group').find('[data-autofocus]')
  if $field.length
    $field.trigger('focus')

##
# <form>
# autofocus first form field with errors
#
$(document).on 'ready', ->
  $field = $('form').find('.form-group.has-error')
  if $field.length
    $field.first().find(':input').trigger('focus')
