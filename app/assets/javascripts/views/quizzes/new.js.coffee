class Quizzee.Views.QuizNew extends Backbone.View

	template: JST['quizzes/new']

	success_template: JST['quizzes/success']

	events:
		"click button": "create"

	render: ->
		@$el.html(@template())
		this

	create: (e) =>
		e.preventDefault()
		title = @$('#quiz-title').val()
		newQuiz = new Quizzee.Models.Quiz({})
		newQuiz.set('title',title)
		newQuiz.save({},{success: @showSuccess})

	showSuccess: (res) =>
		console.log res.get('quiz_url')
		#@$el.html(@success_template( quiz: res))
		Backbone.history.navigate('home',{trigger:true})

	

