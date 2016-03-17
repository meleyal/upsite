$(document).on 'ready page:load', (e) ->
  $('.block-text > .block-content  a,
     .block-image > a').attr('target', '_blank')
