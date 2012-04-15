class Quizzee.Views.QuizShow extends Backbone.View

	template: JST['quizzes/show']

	render: ->
		@$el.html(@template(quiz: @model))
		this
