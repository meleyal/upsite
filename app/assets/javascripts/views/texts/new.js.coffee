class App.Views.TextsNew extends App.Views.WidgetsNew

  template: JST['texts/new']

  initialize: (options) ->
    @el = $(@el)
    @model = new App.Models.Text()
    @render()

  save: (e) ->
    console.log 'saving'
    e.preventDefault()
    # console.log 'save'
    data =
      type: 'Text'
      position: 1
      data:
        title: @$el.find('#text_title').val()
        body: @$el.find('#text_body').val()
    # console.log data
    # console.log @model
    # @model.save(data)
    # console.log data
    app.widgets.create(data)
    app.widgets.fetch()
    @$el.modal('hide')
    # @undelegateEvents()
    # console.log @modal
    # @model.save(data, {
    #   success: (model, resp) =>
    #     console.log 'success'
    #     # Widgets.fetch()
    #     # @el.find('form').remove()
    #   error: =>
    #     console.log 'error'
    # })
