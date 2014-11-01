#
# Drag + Drop
#

options =
  tolerance: 'pointer'
  handle: '.move'
  placeholder: 'widget-placeholder'
  forcePlaceholderSize: true

onSort = (e, ui) ->
  { url } = ui.item.data()
  idx = $('.widget').index ui.item
  data = widget: { sort_order_position: idx }
  $.ajax url, method: 'PUT', data: data

$(document).on 'ready', ->
  $(document.body).sortable options
  $(document).on 'sortupdate', 'body', onSort

