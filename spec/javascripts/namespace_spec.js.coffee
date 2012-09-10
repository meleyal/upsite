#= require namespace

describe 'Namespace', ->

  it 'creates a global namespace', ->
    expect(window.app).toBeDefined()
    expect(app.models).toBeDefined()
    expect(app.collections).toBeDefined()
    expect(app.views).toBeDefined()
    expect(app.helpers).toBeDefined()
