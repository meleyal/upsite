$(document).on 'ready page:change', ->

  $progressBar = $('.progress-bar')
  $progressStatus = $('.progress-status')
  $input = $('input[data-upload]')
  $btn = $('.fileinput-button')

  $input.fileupload({
    start: (e, data) =>
      $('.list-group-item.hidden').removeClass('hidden')
      $btn.attr('disabled', true)
    progressall: (e, data) =>
      progress = parseInt(data.loaded / data.total * 100, 10)
      if progress > 95
        $progressStatus.text('Processing..')
        $progressBar.addClass('progress-bar-striped active')
      $progressBar.css('width', progress + '%')
    error: (e, data) =>
      message = if data?.responseJSON?.block["attachments.upload_file_size"]
        "The file is too big, the limit is 8 MB"
      else
        "There was a problem uploading the file, please try again"
      $btn.attr('disabled', false)
      $progressStatus.text(message)
      $progressBar.removeClass('progress-bar-success')
                  .addClass('progress-bar-danger')
    done: (e, data) =>
      $modal = $(e.target).parents('.modal')
      window.location.reload()
  })
