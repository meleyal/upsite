#= require jquery
#= require jquery_ujs

$('header .btn').on 'click', -> $('form input').trigger 'focus'
