class SpecHelper

  response: (code, responseText) ->
    [ code, {"Content-Type": "application/json"}, JSON.stringify(responseText) ]

  validResponse: (responseText) ->
    @response 200, responseText

  createdResponse: (responseText) ->
    @response 201, responseText

  updatedResponse: ->
    @response 204, ''

window.helpers = new SpecHelper
