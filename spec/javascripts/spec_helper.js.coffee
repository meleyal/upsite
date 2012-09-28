class SpecHelper

  validResponse: (responseText) ->
    [ 200, {"Content-Type": "application/json"}, JSON.stringify(responseText) ]

window.helpers = new SpecHelper
