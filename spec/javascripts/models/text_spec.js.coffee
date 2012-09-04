#= require application

describe 'Text', ->
  
  beforeEach ->
    @model = new App.Models.Text

  it 'should have a default type', ->
    expect(@model.get('type')).toEqual('Text')