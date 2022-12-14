require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  context 'Test User validators' do
    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be a positive integer' do
      subject.posts_counter = 'test'
      expect(subject).to_not be_valid
    end
  end

  context 'Test recent_posts method' do
    # Add some user
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    # Add 4 posts for first_user
    Post.create(author: first_user, title: '1st', text: 'This is my first post')
    Post.create(author: first_user, title: '2nd', text: 'This is my 2nd post')
    Post.create(author: first_user, title: '3rd', text: 'This is my 3rd post')
    Post.create(author: first_user, title: '4th', text: 'This is my 4th post')

    it 'first_user.recent_posts should return three records' do
      expect(first_user.recent_posts.size).to eq(3)
    end

    it 'first_user.posts_counter should equal 4' do
      expect(first_user.posts_counter).to eq(4)
    end
  end
end
