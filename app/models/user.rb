class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: self
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_initialize :init

  has_many :posts, inverse_of: 'author', foreign_key: 'author_id', counter_cache: :posts_counter
  has_many :comments, inverse_of: 'author', foreign_key: 'author_id'
  has_many :likes, inverse_of: 'author', foreign_key: 'author_id'
  def recent_posts
    posts.first(3)
  end

  private

  def init
    self.posts_counter ||= 0
  end
end
