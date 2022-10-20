class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_thanor_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_thanor_equal_to: 0 }
  after_initialize :init

  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, counter_cache: :comments_counter
  has_many :likes, counter_cache: :likes_counter

  def recent_comments
    comments.first(5)
  end

  private

  def init
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
