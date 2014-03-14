class App.Image extends App.Widget

  defaults:
    type: 'Image'
    sort_order_position: 0

  initialize: ->
    console.log 'App.Image.initialize', this
    # console.log 'setting', @get('data').attachments
    # @set 'image_url', @get('data').attachments[0]
    # console.log this
    super
