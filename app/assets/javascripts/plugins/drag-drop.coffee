#
# Drag + Drop
#

# options =
#   tolerance: 'pointer'
#   handle: '.move'
#   placeholder: 'block-placeholder'
#   forcePlaceholderSize: true

# onSort = (e, ui) ->
#   { url } = ui.item.data()
#   idx = $('.block').index ui.item
#   data = block: { sort_order_position: idx }
#   $.ajax url, method: 'PUT', data: data

# $(document).on 'ready page:load', ->
#   $(document.body).sortable options
#   $(document).on 'sortupdate', 'body', onSort

