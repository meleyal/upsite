proxied = jasmine.TrivialReporter.prototype.reportRunnerResults
jasmine.TrivialReporter.prototype.reportRunnerResults = ->
  proxied.apply(this, arguments)
  $( '#__jasmine_TrivialReporter_showPassed__' )
    .trigger( 'click' )
    .trigger( 'click' ) # on chrome, two are needed...
    .attr( 'checked', true )
