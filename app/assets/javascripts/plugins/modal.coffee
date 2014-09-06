#
# Modal
# Extensions to the Bootstrap modal plugin
#

$(document)
  
  # reset modals on hide so they can be resused for different links
  .on 'hidden.bs.modal', '.modal', ->
    $(this).removeData('bs.modal')

  # autofocus first input when modal is shown
  # .on 'shown.bs.modal', '.modal', ->
    # $(this).find('input.string').not('.colorpicker').focus()

  # load remote content in modals with target="self"
  .on 'click', '[data-toggle="modal"]', ->
    $el = $(this)
    if $el.data 'target' is 'self'
      $content = $el.parents '.modal-content'
      $content.load $el.attr('href')

  # # scale large modals relative to the window
  # .on 'show.bs.modal loaded.bs.modal', '#modal-lg', ->
  #   $(this).find('.modal-body')
  #     .css('height', $(window).height() * .75)
