class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, after: :email
    add_index :users, :username, unique: true
    remove_index :users, column: :email, unique: true
  end
end
