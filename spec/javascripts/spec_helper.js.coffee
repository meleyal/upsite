class SpecHelper

  validResponse: (responseText) ->
    [ 200, {"Content-Type": "application/json"}, JSON.stringify(responseText) ]

  showPassedByDefault: ->
    proxied = jasmine.TrivialReporter.prototype.reportRunnerResults
    jasmine.TrivialReporter.prototype.reportRunnerResults = ->
      proxied.apply(this, arguments)
      $( '#__jasmine_TrivialReporter_showPassed__' )
        .trigger( 'click' )
        .trigger( 'click' ) # on chrome, two are needed...
        .attr( 'checked', true )


window.helpers = new SpecHelper
helpers.showPassedByDefault()
