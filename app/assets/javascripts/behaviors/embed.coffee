$(document).on 'ready page:load', ->
  $('[data-embed]').embedly({
    key: 'cf5e3363ffee4a2dad84835fdd324e59',
    query: {
      maxWidth: 300,
      maxHeight: 300,
      width: 300,
      height: 300,
      # luxe: true,
    }
  })
