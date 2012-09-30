#= require ../workspace/dialog

#class app.views.TextsNew extends Backbone.View
class app.views.TextsNew extends app.views.Dialog

  template: JST['templates/texts/new']

  options:
    'title': 'New Text'

  #events:
    #'click .confirm': 'confirm'

  initialize: (options) ->
    #console.log @$el
    #console.log 'TextsNew#initialize'
    super
    @model = new app.models.Text()
    @render()
    #$('#text_body').wysihtml5(
      #'font-styles': false
			#'emphasis': true
			#'lists': true
			#'link': false
			#'image': false
			#'color': false
    #)

  #confirm: (e) ->
    #console.log 'TextsNew#confirm'
    #e.preventDefault()

  render: ->
    #console.log 'TextsNew#render'
    #super()
    ##console.log @model
    content = @template?({ @model })
    @$('.modal-body').html content
    ##@setElement(@template())
    ##@$el.modal({ backdrop: false })
    ##@$el.modal('show')
    return this

  save: (e) ->
    #console.log 'save'
    #console.log 'saving'
    #e.preventDefault()
    ## console.log 'save'
    #data =
      #type: 'Text'
      #position: 1
      #data:
        #title: @$el.find('#text_title').val()
        #body: @$el.find('#text_body').val()
    ## console.log data
    ## console.log @model
    ## @model.save(data)
    ## console.log data
    #app.widgets.create(data)
    #app.widgets.fetch()
    #@$el.modal('hide')
    ## @undelegateEvents()
    ## console.log @modal
    ## @model.save(data, {
    ##   success: (model, resp) =>
    ##     console.log 'success'
    ##     # Widgets.fetch()
    ##     # @el.find('form').remove()
    ##   error: =>
    ##     console.log 'error'
    ## })
