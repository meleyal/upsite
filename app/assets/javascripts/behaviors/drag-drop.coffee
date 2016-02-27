#
# Drag + Drop
#

options =
  tolerance: 'pointer'
  handle: '.move'
  placeholder: 'block block-placeholder col-sm-4'
  forcePlaceholderSize: true

onSort = (e, ui) ->
  { url } = ui.item.data()
  idx = $('.block').index ui.item
  data = block: { sort_order_position: idx }
  $.ajax url, method: 'PUT', data: data

$(document).on 'ready page:load', ->
  $('[data-sortable]').sortable options
  $(document).on 'sortupdate', '[data-sortable]', onSort
