class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
  end
end
