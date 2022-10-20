class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, counter_cache: :comments_counter
  has_many :likes,  counter_cache: :likes_counter

  def recent_comments
    comments.first(5)
  end
end
