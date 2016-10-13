##
# [data-autofill]
# Autofill one field based on the value of another
#
$(document).on 'input', '[data-autofill-subdomain]', (e) ->
  $input = $(e.currentTarget)
  selector = $input.data('autofill-subdomain')
  text = $input.val().toLowerCase().replace(/'/g, '').replace(/[^a-z0-9]+/g, '-')
  $(selector).text('http://' + text + '.upsite.io')
