class AddUserToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: 'author_id', index: true
  end
end
