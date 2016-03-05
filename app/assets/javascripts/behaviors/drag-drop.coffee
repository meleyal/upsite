#
# Drag + Drop
#

options =
  items: '.block:not(.block-not-ad)'
  tolerance: 'pointer'
  handle: '.move'
  placeholder: 'block block-placeholder col-sm-4'
  forcePlaceholderSize: true
  cancel: '.block-ad'
  cursor: 'move'

onStart = (e, ui) ->
  # console.log 'onStart', e, ui
  $(e.currentTarget).find('.move').tooltip('destroy')

onSort = (e, ui) ->
  ids = $('[data-sortable] .block').map((idx, el) -> $(el).attr('data-id')).get()
  $.ajax 'blocks/sort', method: 'POST', data: { block: { ids }}
  $(e.currentTarget).find('.move').tooltip()

$(document).on 'ready page:load', ->
  $('[data-sortable]').sortable options
  $(document).on 'sortupdate', '[data-sortable]', onSort
  $(document).on 'sortstart', '[data-sortable]', onStart
