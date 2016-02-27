#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require jquery-ui
#= require jquery.remotipart
#= require jquery.embedly
#= require dropzone
#= require bootstrap
#= require bootstrap-colorpicker
#= require_tree ./behaviors

$(document).on 'page:change', ->
  unless $('.block').length
    $('.hud .add')
      .attr('title', 'Get started')
      .trigger('focus')
