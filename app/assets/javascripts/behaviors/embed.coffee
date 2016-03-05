$(document).on 'ready page:load', ->
  $('[data-embed]').embedly({
    key: 'cf5e3363ffee4a2dad84835fdd324e59',
    query: {
      maxwidth: 300,
      maxheight: 300,
    }
  })
