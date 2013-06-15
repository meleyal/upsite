class App.Application

  constructor: ->
    @page = new App.Page
    @router = new App.Router { @page }
