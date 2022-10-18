class AddPostToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, null: false, foreign_key: 'post_id', index: true
  end
end
