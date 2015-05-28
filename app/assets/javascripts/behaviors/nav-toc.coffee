#
# Table of contents
#

render = ->
  $el = $('[data-nav-toc]')
  $anchors = $('[data-nav-toc-anchor]')

  links = for a in $anchors
    id = '#' + a.id
    text = $.trim $(a).text()
    "<li><a href=#{id}>#{text}</a></li>"

  $el.append links
  


$(document).on 'ready', render



