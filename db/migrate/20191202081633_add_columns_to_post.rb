class AddColumnsToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :content_api, :string, after: :content
    add_column :posts, :content_second, :string, after: :content_api
  end
end
