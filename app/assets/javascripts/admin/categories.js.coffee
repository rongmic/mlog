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

  $(document).on "click", ".edit_category", ->

  $ ->
    $(document).on "ajax:success", "a[data-remote].del", (e, data, status, xhr) ->
      if(data > 0)
        $(this).parent('td').parent('tr').remove()
