class Quizzee.Views.QuizzesIndex extends Backbone.View

	template: JST['quizzes/index']
	
	initialize: ->
		@collection.on('reset', @appendAll,this)
		@collection.on('add', @appendQuizItem,this)

	render: ->
		@appendAll()
		this

	appendAll: =>
		@$el.empty()
		@$el.html(@template())
		@collection.forEach(@appendQuizItem, this)
		
	appendQuizItem: (quizItem) ->
		quizItemView = new Quizzee.Views.QuizItem({model: quizItem})
		@$el.append(quizItemView.render().el)
