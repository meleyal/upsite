$(document).on 'ready page:change', ->
  unless $('.block').length
    $('.hud .add')
      .attr('title', 'Get started')
      .trigger('focus')
