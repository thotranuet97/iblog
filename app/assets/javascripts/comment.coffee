# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#comment_form form').hide()
  $('.edit-comment').click ->
    $(this).closest('.comment').find('.show-comment').hide()
    $(this).closest('.comment').find('form').show()
  return
return