class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments
  has_many :likes

  def recent_comments
    comments.first(5)
  end
end
