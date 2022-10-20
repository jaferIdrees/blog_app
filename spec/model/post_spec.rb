require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.create(author: first_user, title: 'Hello', text: 'This is my first post') }
  context 'Test Post validators' do
    before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be a positive integer' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be a positive integer' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Test Post recent_comments method and comments_counter' do
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

    it 'first_user.recent_posts should return three records' do
      expect(first_post.recent_comments.size).to eq(5)
    end

    it 'first_post.comments_counter should equal 6' do
      expect(first_post.comments_counter).to eq(6)
    end
  end
end
