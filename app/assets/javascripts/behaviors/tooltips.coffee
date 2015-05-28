#
# Tooltips
#

$(document).on 'page:change', ->
  $('body').tooltip selector: '[rel="tooltip"]'