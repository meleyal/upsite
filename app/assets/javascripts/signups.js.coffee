#= require jquery

$('.js-trigger-focus').on 'click', -> $('form input').trigger 'focus'
