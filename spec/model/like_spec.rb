require 'rails_helper'

RSpec.describe Like, type: :model do
  

  context 'Test Like likes_counter method' do
    # Add some user
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

    # Add 4 comments for first_post
    Like.create(post: first_post, author: first_user)
    Like.create(post: first_post, author: first_user)
    Like.create(post: first_post, author: first_user)
    Like.create(post: first_post, author: first_user)
    Like.create(post: first_post, author: first_user)
    

    it 'first_post.likes_counter should equal 5' do
      expect(first_post.likes_counter).to eq(5)
    end
    
    it 'first_user.likes_counter should equal 5' do
      expect(first_post.likes_counter).to eq(5)
    end
  end
end
