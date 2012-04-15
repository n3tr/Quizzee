class Quiz < ActiveRecord::Base
 
  attr_accessible :score, :title, :user_id
  attr_accessor :url

  belongs_to :user
  has_many :question

  scope :desc_ordered , order('created_at desc')

end
