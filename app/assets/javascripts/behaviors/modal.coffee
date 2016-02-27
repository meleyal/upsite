#
# Modal
# Extensions to the Bootstrap modal plugin
#

$(document)

  # reset modals on hide so they can be resused for different links
  .on 'hidden.bs.modal', '.modal', ->
    $(this).removeData('bs.modal')

  # ensure plugins are activated by simulating Turbolinks event
  .on 'loaded.bs.modal', '.modal', ->
    event = new Event(Turbolinks.EVENTS.CHANGE)
    document.dispatchEvent event

  # autofocus first input when modal is shown
  .on 'shown.bs.modal', '.modal', ->
    $(this).find('.form-group :input').first().focus()

  # load remote content in modals with target="self"
  # .on 'click', '[data-toggle="modal"]', ->
  #   $el = $(this)
  #   if $el.data 'target' is 'self'
  #     $content = $el.parents '.modal-content'
  #     $content.load $el.attr('href')

  # replace content of modal when clicking a 'self' link
  .on 'click', '.modal a[data-target="self"]', (e) ->
    e.preventDefault()
    $link = $(e.currentTarget)
    $content = $link.parents('.modal-content')
    $modal = $content.parents('.modal')
    $content.load $link.attr('href'), ->
      $modal.trigger('loaded.bs.modal')

  # # scale large modals relative to the window
  # .on 'show.bs.modal loaded.bs.modal', '#modal-lg', ->
  #   $(this).find('.modal-body')
  #     .css('height', $(window).height() * .75)
