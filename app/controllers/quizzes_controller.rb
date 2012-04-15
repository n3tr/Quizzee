class QuizzesController < ApplicationController
  
  before_filter :authenticate_user!
  
  respond_to :json
  

  # /quizzes
  def index
    #@user = user_info_attributes
    @quiz = quiz_created_by_current_user
    respond_with(@quiz)
  end


  # /quizzes/:id
  def show
    respond_with(Quiz.find_by_id(params[:id]))
  end
  

  # POST  /quizzes
  def create
    
    # Create Quiz
    @quiz = current_user.quiz.create(params[:quiz])
    
    # Insert each Question into Quiz
    questions = params[:questions]
    questions.each do |q|
      @quiz.question.create(q)
    end

    # Test Accessor !Need fix and migrate
    @quiz.url = "foobar"
  end

  
  private

  def user_info_attributes
    User.all.map { |user| { id: user.id, email: user.email } }
  end
  
  def quiz_created_by_current_user
    current_user.quiz.desc_ordered
  end
  
  
end
