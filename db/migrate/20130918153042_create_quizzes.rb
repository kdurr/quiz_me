class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title, null:false
      t.integer :age_rating, null:false
      t.boolean :private, default:false
      t.integer :user_id

      t.timestamps
    end
  end
end
