require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Test Comment comments_counter method' do
    # Add some user
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

    # Add 4 comments for first_post
    Comment.create(post: first_post, author: first_user, text: '1st comment')
    Comment.create(post: first_post, author: first_user, text: '2nd comment')
    Comment.create(post: first_post, author: first_user, text: '3rd comment')
    Comment.create(post: first_post, author: first_user, text: '4th comment')
    Comment.create(post: first_post, author: first_user, text: '5th comment')
    Comment.create(post: first_post, author: first_user, text: '6th comment')

    it 'first_post.comments_counter should equal 6' do
      expect(first_post.comments_counter).to eq(6)
    end
  end
end
