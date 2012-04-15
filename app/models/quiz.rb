class Quiz < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :score, :title, :user_id
  attr_accessor :url

  scope :desc_ordered , order('created_at desc')

end
