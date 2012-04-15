class Quizzee.Views.QuizNew extends Backbone.View

	template: JST['quizzes/new']

	success_template: JST['quizzes/success']

	events:
		"click button#quiz-create-btn": "create"
		"click button#add-new-question": "appendQuestion"

	render: ->
		@$el.html(@template())
		this

	create: (e) =>
		e.preventDefault()

		title = @$('#quiz-title').val()
		newQuiz = new Quizzee.Models.Quiz({})
		newQuiz.set('title',title)

		questionList = $('#questions-form').serializeArray()
		
		questions = new Quizzee.Collections.Questions()

		for question in questionList
			questions.add({title:question.value})

		
		

		newQuiz.set('questions', questions.toJSON())

	
		newQuiz.save({},{success: @showSuccess})

	showSuccess: (res) =>
		console.log res
		#@$el.html(@success_template( quiz: res))
		quiz = res.get('quiz')
		Backbone.history.navigate("q/#{quiz.id}",{trigger:true})

	appendQuestion: (e) ->
		e.preventDefault()
		clauseItem = $('<li/>')
		clauseItem.addClass('question-item')

		clauseInput = $('<input/>')
		clauseInput.attr('name','questionTitle')
		clauseInput.addClass('question-title-input')

		clauseItem.append(clauseInput)
		$('#questions-list').append(clauseItem)

		clauseInput.focus()


	

