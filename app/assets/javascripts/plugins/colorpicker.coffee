#
# Color picker
#

$(document)
  .on 'focus', '[data-toggle="colorpicker"]', ->
    $(this).colorpicker()

  .on 'blur', '[data-toggle="colorpicker"]', ->
    $(this).colorpicker('destroy')
