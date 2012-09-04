#= require application

describe 'Dialog', ->

  beforeEach ->
    @view = new App.Views.Dialog

  describe 'Instantiation', ->

    xit 'should create a div', ->
      expect(@view.$el).toBe('div')

    xit 'should have a "modal" class', ->
      expect(@view.$el).toHaveClass('modal')

    xit 'should have default attributes', ->
      title = @view.$el.find('.modal-title').text()
      expect(title).toEqual('Untitled Dialog')

  describe 'Rendering', ->

    xit 'should create a dialog instance', ->
      # @view.$el.on('show', -> console.log 'show event')
      # @view.show()
      # expect(@model.get('type')).toEqual('Text')

    xit 'should hide on dismiss', ->
      # @view.show()
      # @view.$el.find('.close').click()
      # @view.hide()

    xit 'should add a custom subview', ->
      subview = new App.Views.TextsNew()
      #console.log subview.render().el
      @view.add('test', subview)
      # expect form to be present
      expect(@view.$el).toContain('form')

      #expect(title).toEqual('Untitled Dialog')
