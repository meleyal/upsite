$(document).on 'ready page:load', ->
  $('.block-video a, .block-embed a').embedly({
    key: 'cf5e3363ffee4a2dad84835fdd324e59',
    query: {
      maxwidth: 280,
      maxheight: 280,
    }
  })
