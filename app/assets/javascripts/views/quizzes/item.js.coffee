class Quizzee.Views.QuizItem extends Backbone.View

	template: JST['quizzes/item']

	className: 'quizItem'

	events:
		"click h4": "showQuiz"

	render: ->
		@$el.html(@template(quiz: @model))
		this

	showQuiz: (e) ->
		e.preventDefault()
		Backbone.history.navigate("#q/#{@model.get('id')}",{trigger: true})


