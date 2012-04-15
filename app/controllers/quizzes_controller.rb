class QuizzesController < ApplicationController
  
  before_filter :authenticate_user!
  
  respond_to :json
  
  def index
    #@user = user_info_attributes
    @quiz = quiz_created_by_current_user
    respond_with(@quiz)
  end
  
  def create
    @quiz = current_user.quiz.create(params[:quiz])
    @quiz.url = "foobar"
  end

  def show
    respond_with(Quiz.find_by_id(params[:id]))
  end
  
  
  private
  
  def user_info_attributes
    User.all.map { |user| { id: user.id, email: user.email } }
  end
  
  def quiz_created_by_current_user
    current_user.quiz.desc_ordered
  end
  
  
end
