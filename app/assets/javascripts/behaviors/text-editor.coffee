autolink = (e) ->
  pastedText = e.originalEvent.clipboardData?.getData?('Text')
  setTimeout( ->
    if pastedText and !!pastedText.match(/^(https?:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})$/ig)
      editor = $('trix-editor').get(0).editor
      currentText = editor.getDocument().toString()
      currentSelection = editor.getSelectedRange()
      textWeAreInterestedIn = currentText.substring 0, currentSelection[0]
      startOfPastedText = textWeAreInterestedIn.lastIndexOf pastedText
      editor.setSelectedRange [startOfPastedText, currentSelection[0]]
      editor.activateAttribute 'href', pastedText
      editor.setSelectedRange currentSelection
  , 0)

$(document).on 'paste', 'trix-editor', autolink
