#= require jquery

$('.js-trigger-focus').on 'click', -> 
  setTimeout (-> $('form input').trigger('focus')), 100
