window.Quizzee =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    
    new Quizzee.Routers.Quizzes()
    Backbone.history.start()


$(document).ready ->
  div = $('<div></div>')
  div.html($('#bootstrap').text())
  #data = JSON.parse(div.text())
  Quizzee.init()

