class User < ApplicationRecord
  has_many :posts, inverse_of: 'author', foreign_key: 'author_id'
  has_many :comments, inverse_of: 'author', foreign_key: 'author_id'
  has_many :likes, inverse_of: 'author', foreign_key: 'author_id'
  def recent_posts
    posts.first(3)
  end
end
