class Question < ActiveRecord::Base
  attr_accessible :order, :point, :quiz_id, :title

  belongs_to :quiz
end
