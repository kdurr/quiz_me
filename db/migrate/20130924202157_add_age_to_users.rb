class AddAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer, null: false
  end
end
