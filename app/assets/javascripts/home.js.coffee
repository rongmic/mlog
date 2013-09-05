# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

covers = [
  [ "/assets/louvre.jpg",   "The Louvre in Paris." ],
  [ "/assets/paris.jpg",    "Sunset on Paris from the Eiffel Tower." ],
  [ "/assets/eiffel.jpg",   "The Eiffel Tower." ],
  [ "/assets/normandy.jpg", "The Normandy coast." ],
  [ "/assets/seine.jpg",    "The Seine River in Paris." ]
]


cover = covers[Math.floor(Math.random() * covers.length)]

$(document).ready ->
  $("img.cover-img").attr "src", cover[0]
  $("p.cover-caption").html cover[1]
