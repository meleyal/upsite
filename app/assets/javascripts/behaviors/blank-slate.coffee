$(document).on 'ready page:change', ->
  if $('.blocks').length and !$('.block').length
    $('.hud .add')
      .attr('title', 'Get started')
      .trigger('focus')
      .addClass('active')
