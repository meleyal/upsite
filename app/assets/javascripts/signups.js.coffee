#= require jquery

$('header .btn').on 'click', -> $('form input').trigger 'focus'
