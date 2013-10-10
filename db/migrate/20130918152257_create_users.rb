class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.string :email, null:false
      t.integer :age, null:false
      t.string :username, null:false
      t.string :password, null:false

      t.timestamps
    end
  end
end
