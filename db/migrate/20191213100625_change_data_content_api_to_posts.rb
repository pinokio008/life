class ChangeDataContentApiToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :content_api, :text
  end
end
