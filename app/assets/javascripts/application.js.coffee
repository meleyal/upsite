#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require jquery-ui
#= require jquery.remotipart
#= require bootstrap
#= require bootstrap-colorpicker

#= require_tree ./plugins


$(document).on 'page:change', ->
  unless $('.blocks').length
    $('.hud .add')
      .attr('title', 'Get started')
      .trigger('focus')
