$(document).on 'click', '[data-track]', (e) ->
  e.preventDefault()
  console.log $(this).data()
  alert("This feature is coming soon, we'll let you know when it's ready!")