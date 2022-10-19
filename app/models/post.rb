class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments

  def recent_comments
    comments.first(5)
  end
end
