class app.views.Workspace extends Backbone.View

  #el: 'body'

  #events:
    #'click .add': 'add'

  #add: (e) ->
    #e.preventDefault()
    #$(@el).append new App.Views.Toolbar
