$(document).on 'ready page:load', ->
  return if window.location.search is '?filter=all'
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
