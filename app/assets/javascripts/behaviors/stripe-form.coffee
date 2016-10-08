##
# [data-stripe-form]
# Credit-card fomatting and validation
#

onSubmit = (e) ->
  $form = $(e.target)
  $('[data-stripe="submit"]').button('loading')
  Stripe.card.createToken($form, onStripeResponse)
  e.preventDefault()

onStripeResponse = (status, response) ->
  $form = $('[data-stripe="form"]')

  if response.error
    $('[data-stripe="feedback"]')
      .text(response.error.message)
      .removeClass('hidden')
  else
    $('[data-stripe="form"]').off('submit')
    $form.find('input[name="token"]').val(response.id)
    $form.submit()

onValid = ($input) ->
  $input.parents('.form-group')
    .removeClass('has-feedback has-error')
    .addClass('has-feedback has-success')
  $input.parents('.form-group')
    .find('.form-control-feedback-success').removeClass('hidden').end()
    .find('.form-control-feedback-error').addClass('hidden')

onInvalid = ($input) ->
  $input.parents('.form-group')
    .removeClass('has-feedback has-success')
    .addClass('has-feedback has-error')
  $input.parents('.form-group')
    .find('.form-control-feedback-error').removeClass('hidden').end()
    .find('.form-control-feedback-success').addClass('hidden')

onChange = (e) ->
  $input = $(e.target)
  valid = switch $input.data('stripe')
    when 'number' then $.payment.validateCardNumber($input.val())
    when 'exp'
      { month, year } = $.payment.cardExpiryVal($input.val())
      $.payment.validateCardExpiry(month, year)
    when 'cvc' then $.payment.validateCardCVC($input.val())
  if valid then onValid($input) else onInvalid($input)
  if allFieldsValid() then enableSubmit() else disableSubmit()

allFieldsValid = () ->
  allFieldsLength = $('.form-group').length
  validFieldsLength = $('.form-group.has-success').length
  allFieldsLength is validFieldsLength

enableSubmit = () ->
  $('[data-stripe="submit"]').removeAttr('disabled').removeAttr('title')

disableSubmit = () ->
  $('[data-stripe="submit"]').attr('disabled', true)

$(document).on 'ready', ->
  $('[data-stripe="number"]').payment('formatCardNumber').on('input blur', onChange)
  $('[data-stripe="exp"]').payment('formatCardExpiry').on('input blur', onChange)
  $('[data-stripe="cvc"]').payment('formatCardCVC').on('input blur', onChange)
  $('[data-stripe="form"]').on('submit', onSubmit)
