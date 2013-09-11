# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("form").submit ->
    category_name = $("#category_name")
    if category_name.val() is ""
      category_name.addClass("error")
      category_name.next('small').addClass("hide-for-small")
      return false
    return true

  $(".edit_category").click ->
    alert(1)

  $ ->
    $("a[data-remote].del").on "ajax:success", (e, data, status, xhr) ->
      alert "The post was deleted."
