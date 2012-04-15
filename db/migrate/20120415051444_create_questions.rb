class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :point
      t.integer :order
      t.integer :quiz_id

      t.timestamps
    end
  end
end
