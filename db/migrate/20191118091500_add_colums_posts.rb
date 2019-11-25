class AddColumsPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :pageid, :integer, after: :id
    add_reference :posts, :user, foreign_key: true, after: :id
  end
end
