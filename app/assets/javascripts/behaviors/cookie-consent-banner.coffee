$(document).on 'ready', ->
  $('#cookie-consent-banner').on 'closed.bs.alert', ->
    Cookies.set('cookies_consented', true, { path: '/', expires: 365 })
