# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('form').submit ->
    if($("#article_title").val() is "")
      $("#article_title").addClass('error')
      return false
    else
      $("#article_title").removeClass('error')
    if($("#article_content").val() is "")
      $("#article_content").addClass('error')
      return false
    else
      $("#article_content").removeClass('error')
    if($("#article_category_id").val() is "")
      return false
