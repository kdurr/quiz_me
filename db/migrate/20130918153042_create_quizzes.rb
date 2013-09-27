class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title, null:false
      t.integer :age_rating
      t.boolean :private, default:false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
