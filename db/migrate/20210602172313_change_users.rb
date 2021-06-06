class ChangeUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
    rename_column :users, :password, :password_digest
  end
end
