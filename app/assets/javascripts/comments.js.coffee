# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.comment-form').on("ajax:success", (event, jqXHR, textStatus) ->
    protocol = location.protocol
    host = location.host
    fullHost = protocol + '//' + host
    window.location = fullHost + Routes.post_path jqXHR.post_id)
