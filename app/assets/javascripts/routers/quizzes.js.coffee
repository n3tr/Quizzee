class Quizzee.Routers.Quizzes extends Backbone.Router
	
  initialize: (options) ->
    @collection = new Quizzee.Collections.Quizzes({})
    @quizViewIndex = new Quizzee.Views.QuizzesIndex({ collection: @collection })
    @quizViewIndex.render()

  routes:
    "":	"index"
    "home": "index"
    "q/:id" : "show"
    "create": "new"

  index: ->
    $('#quizzes').html(@quizViewIndex.el)
    @collection.fetch()
   
  show: (id) =>
    quizItem = new Quizzee.Models.Quiz({id: id})
    quizItem.fetch(
      success: -> 
        showView = new Quizzee.Views.QuizShow({ model: quizItem }) 
        $('#quizzes').html(showView.render().el)
      )

  new: ->
    newView = new Quizzee.Views.QuizNew()
    $('#quizzes').html(newView.render().el)



    
   
