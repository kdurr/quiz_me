class AddPasswordConfirmationField < ActiveRecord::Migration
  def change
    add_column :users, :password_confirmation, :string, null: false
  end
end
